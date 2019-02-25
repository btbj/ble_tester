import 'package:flutter/material.dart';

class BasicPlate extends StatelessWidget {
  final Widget child;

  BasicPlate({this.child});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: Colors.white,
            width: deviceWidth,
            height: deviceHeight,
            child: child,
          ),
        ),
      );
  }
}