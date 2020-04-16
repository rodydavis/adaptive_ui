import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<RouteName> _routes = [
      RouteName('/mobile', 'Mobile Screen'),
      RouteName('/tablet', 'Tablet Screen'),
      RouteName('/adaptive_screen', 'Adaptive Screen'),
      RouteName('/adaptive_dialog', 'Adaptive Dialog'),
      RouteName('/platform', 'Platform View'),
      RouteName('/default', 'Default View'),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Adaptive UI Demos'),
        actions: [
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => launch('https://github.com/rodydavis/adaptive_ui'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _routes.length,
        itemBuilder: (_, index) {
          final route = _routes[index];
          return ListTile(
            title: Text(route.name),
            trailing: Icon(Icons.visibility),
            onTap: () => Navigator.of(context).pushNamed(route.route),
          );
        },
      ),
    );
  }
}

class RouteName {
  final String route;
  final String name;

  const RouteName(this.route, this.name);
}
