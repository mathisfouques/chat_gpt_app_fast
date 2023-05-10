import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

const String openAiAPIKey = String.fromEnvironment("apikey");

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

void main() => runApp(const ChatGptApp());

class ChatGptApp extends StatefulWidget {
  const ChatGptApp({super.key});
  @override
  State<ChatGptApp> createState() => _ChatGptAppState();
}

class _ChatGptAppState extends State<ChatGptApp> {
  List<types.TextMessage> messages = [];
  final user = const types.User(id: "user");
  final chatGpt = const types.User(id: "chatgpt");

  void _onSendPressed(types.PartialText text) async {
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
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Chat(
          messages: messages,
          onSendPressed: _onSendPressed,
          user: user,
        ),
      ),
    );
  }
}
