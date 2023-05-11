import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'chat_stored.dart';

const String openAiAPIKey = String.fromEnvironment("apikey");
const user = types.User(id: "user");
const chatGpt = types.User(id: "chatgpt");

Future<String> _getNextPrompt(
  String question, {
  List<Map<String, dynamic>>? withLastMessages,
}) async {
  final response = await post(
    Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: {
      "Authorization": "Bearer $openAiAPIKey",
      "content-type": "application/json"
    },
    body: jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        ...withLastMessages ?? [],
        {"role": "user", "content": question},
      ],
      "max_tokens": 1000,
    }),
  );

  return (jsonDecode(response.body)["choices"] as List).first["message"]
      ["content"];
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([ChatStoredSchema], directory: dir.path);

  await isar.writeTxn(() async {
    final chats = await isar.chatStoreds.where().findAll();

    if (chats.isEmpty) await isar.chatStoreds.put(ChatStored());
  });

  runApp(MaterialApp(home: ChatGptAppScaffold(isarStorage: isar)));
}

class ChatGptAppScaffold extends StatelessWidget {
  final Isar isarStorage;

  const ChatGptAppScaffold({super.key, required this.isarStorage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1d1c21),
        ),
        drawer: ChatGPTDrawer(chatStorage: isarStorage),
        body: ChatGPTBody(
          chatStorage: isarStorage,
          currentChatId: 1,
        ),
      ),
    );
  }
}

class ChatGPTBody extends StatefulWidget {
  const ChatGPTBody({
    super.key,
    required this.chatStorage,
    required this.currentChatId,
  });

  final Isar chatStorage;
  final int currentChatId;

  @override
  State<ChatGPTBody> createState() => _ChatGPTBodyState();
}

class _ChatGPTBodyState extends State<ChatGPTBody> {
  List<types.TextMessage> messages = [];

  void _onSendPressed(types.PartialText text) async {
    final List<MessageStored> toAddToStorage = [];

    setState(() {
      messages = [
        types.TextMessage(
          author: user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: text.text,
        ),
        ...messages
      ];

      toAddToStorage.add(MessageStored()
        ..author = Participant.assistant
        ..text = text.text);
    });

    await _getNextPrompt(text.text,
            withLastMessages: messages
                .map((message) => {
                      "role": message.author == user ? "user" : "assistant",
                      "content": message.text,
                    })
                .toList())
        .then((value) => setState(() {
              messages = [
                (types.TextMessage(
                  author: chatGpt,
                  createdAt: DateTime.now().millisecondsSinceEpoch,
                  id: const Uuid().v4(),
                  text: value,
                )),
                ...messages
              ];

              toAddToStorage.add(MessageStored()
                ..author = Participant.assistant
                ..text = value);
            }));

    await widget.chatStorage.writeTxn(
      () async {
        ChatStored? currentChat =
            await widget.chatStorage.chatStoreds.get(widget.currentChatId);

        if (currentChat == null) return;

        currentChat = ChatStored()
          ..id = widget.currentChatId
          ..messages = [...toAddToStorage, ...currentChat.messages];

        await widget.chatStorage.chatStoreds.put(currentChat);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Chat(
        messages: messages,
        onSendPressed: _onSendPressed,
        user: user,
      ),
    );
  }
}

class ChatGPTDrawer extends StatelessWidget {
  const ChatGPTDrawer({super.key, required this.chatStorage});

  final Isar chatStorage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1d1c21),
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: FutureBuilder<List<ChatStored>>(
          future: chatStorage.chatStoreds.where().findAll(),
          builder: (context, snapshot) => Column(
            children:
                snapshot.data?.map((e) => Text(e.id.toString())).toList() ?? [],
          ),
        ),
      ),
    );
  }
}
