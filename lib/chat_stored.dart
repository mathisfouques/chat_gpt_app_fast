import 'package:isar/isar.dart';

part 'chat_stored.g.dart';

@collection
class ChatStored {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  List<MessageStored> messages = [];
}

@embedded
class MessageStored {
  @enumerated
  Participant author = Participant.user;

  String text = "";
}

enum Participant { user, assistant }
