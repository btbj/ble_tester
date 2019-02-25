import 'package:flutter/material.dart';

import './device_list.dart';

class ScanBtn extends StatefulWidget {
  @override
  _ScanBtnState createState() => _ScanBtnState();
}

class _ScanBtnState extends State<ScanBtn> {

  Future popDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return DeviceList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.scanner),
      onPressed: () {
        print('scan');
        popDialog(context);
      },
    );
  }
}
