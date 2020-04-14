import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, dimens) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Home'),
          actions: [],
        ),
      ),
    );
  }
}
