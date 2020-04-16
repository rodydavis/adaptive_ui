import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, dimens) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text('Platform Demo'),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton.icon(
                  icon: Icon(Icons.settings),
                  label: Text('Open Cupertino Settings'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => _CupertinoSettings(),
                    ));
                  },
                ),
                Container(height: 20),
                RaisedButton.icon(
                  icon: Icon(Icons.settings),
                  label: Text('Open Material Settings'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => _MaterialSettings(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MaterialSettings extends StatelessWidget {
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
            trailing: Switch(
              value: false,
              onChanged: (val) {},
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text('Save'),
              onPressed: () {},
            ),
          ),
          Container(height: 10),
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class _CupertinoSettings extends StatelessWidget {
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
