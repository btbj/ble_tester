import 'package:scoped_model/scoped_model.dart';
import '../models/MessageInfo.dart';

mixin MessageModel on Model {
  List<MessageInfo> _msgHistory = [];
  List<MessageInfo> get msgHistroy => this._msgHistory;

  void addMessage(MessageInfo msg) {
    this._msgHistory.add(msg);
    notifyListeners();
  }

  void clearMessageHistory() {
    this._msgHistory.clear();
    notifyListeners();
  }

  void displayReceivedMessage(List<int> values) {
    final MessageInfo msg = MessageInfo(
      values.toString(),
      type: MessageType.receive,
    );
    this._msgHistory.add(msg);
    notifyListeners();
  }
}
