import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/main_model.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  MainModel _model;

  @override
  void initState() {
    print('initstate devicelist');
    super.initState();
    _model = ScopedModel.of<MainModel>(context);
  }

  Widget _buildClearBtn() {
    return FlatButton(
      child: ListTile(
        title: Text('clear'),
      ),
      onPressed: () {
        _model.clearMessageHistory();
        print('Clear History');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: Column(
          children: <Widget>[
            _buildClearBtn(),
          ],
        ),
      ),
    );
  }
}
