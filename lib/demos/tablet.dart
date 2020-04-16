import 'package:flutter/material.dart';

class TabletDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(Icons.menu),
        title: Text('Tablet Layout'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                thickness: 3,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(height: 60);
              },
            ),
          ),
          Expanded(
            child: Placeholder(
              color: Colors.grey.shade300,
              strokeWidth: 3,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: Container(),
        backgroundColor: Colors.red,
        onPressed: null,
      ),
    );
  }
}
