import 'package:flutter/material.dart';

class MobileDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(Icons.menu),
        title: Text('Mobile Layout'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 3,
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(height: 60);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(),
        backgroundColor: Colors.red,
        onPressed: null,
      ),
    );
  }
}
