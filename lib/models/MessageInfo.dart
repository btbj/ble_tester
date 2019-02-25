enum MessageType {
  send,
  receive,
}

class MessageInfo {
  MessageType type;
  String message;
  DateTime timestamp;

  MessageInfo(this.message, {this.type = MessageType.send}) {
    this.timestamp = DateTime.now();
  }
}
