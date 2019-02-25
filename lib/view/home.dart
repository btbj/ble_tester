import 'package:flutter/material.dart';
import '../components/basic_plate.dart';
import '../components/message_box.dart';
import '../components/input_box.dart';
import '../components/side_menu.dart';
import '../components/scan_btn.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLE Tester'),
        actions: <Widget>[
          ScanBtn(),
        ],
      ),
      drawer: SideMenu(),
      body: BasicPlate(
        child: Column(
          children: <Widget>[
            MessageBox(),
            InputBox(),
          ],
        ),
      ),
    );
  }
}
