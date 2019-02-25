import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/main_model.dart';
import '../models/MessageInfo.dart';

class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final TextEditingController inputCtrl = TextEditingController();
  MainModel _model;

  @override
  void initState() {
    print('initstate devicelist');
    super.initState();
    _model = ScopedModel.of<MainModel>(context);
  }

  void sendMsg(List<int> values) {
    final MessageInfo msg =
        MessageInfo(values.toString(), type: MessageType.send);

    this._model.addMessage(msg);
  }

  Widget _buildTextRow() {
    return Expanded(
      child: Container(
        child: TextField(
            controller: inputCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            )),
      ),
    );
  }

  Widget _buildSendButton() {
    return Container(
      // margin: EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: FlatButton(
        child: Text('Send'),
        onPressed: () {
          List<int> values = formatInput(inputCtrl.text);
          print(values);
          sendMsg(values);
          inputCtrl.text = '';
        },
      ),
    );
  }

  List<int> formatInput(String text) {
    List<int> intList = [];
    final RegExp regx = RegExp(r"([0-9]\d{0,2}(.[0-9]\d{0,2})*)");
    print(inputCtrl.text);
    print(regx.hasMatch(inputCtrl.text));
    String intString = regx.stringMatch(inputCtrl.text);

    if (intString == null) return intList;

    List<String> intStringList = intString.split(".");
    for (String str in intStringList) {
      intList.add(int.parse(str));
    }
    return intList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTextRow(),
          _buildSendButton(),
        ],
      ),
    );
  }
}
