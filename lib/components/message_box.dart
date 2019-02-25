import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/main_model.dart';
import '../models/MessageInfo.dart';

class MessageBox extends StatelessWidget {
  List<Widget> _buildMessageList(MainModel model) {
    final List<Widget> result = [];

    for (MessageInfo msg in model.msgHistroy) {
      Widget msgBox = Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: msg.type == MessageType.send
                ? Icon(Icons.arrow_left)
                : Icon(Icons.arrow_right),
            title: Text(msg.message),
            subtitle: Text(
              msg.timestamp.toLocal().toString(),
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ],
      );
      result.add(msgBox);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Expanded(
          child: ListView(
            children: _buildMessageList(model),
          ),
        );
      },
    );
  }
}
