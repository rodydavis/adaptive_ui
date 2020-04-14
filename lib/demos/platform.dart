import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, dimens) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => SettingsScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Dark Mode'),
            subtitle: Text('Come to the dark side'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (val) {},
            ),
          ),
          ListTile(
            title: CupertinoButton(
              color: Colors.blue,
              child: Text('Save'),
              onPressed: () {},
            ),
          ),
          Container(height: 10),
          Center(child: CupertinoActivityIndicator()),
        ],
      ),
    );
  }
}
