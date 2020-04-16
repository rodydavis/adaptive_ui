import 'package:flutter/material.dart';

import 'demos/dialog.dart';
import 'demos/index.dart';
import 'ui/home/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adaptive UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/mobile': (_) => NavBack(child: MobileDevice()),
        '/tablet': (_) => NavBack(child: TabletDevice()),
        '/adaptive_screen': (_) => NavBack(child: AdaptiveScreen()),
        '/adaptive_dialog': (_) => NavBack(child: DialogScreen()),
        '/platform': (_) => NavBack(child: PlatformScreen()),
        '/default': (_) => NavBack(child: DefaultScreen()),
      },
    );
  }
}

class NavBack extends StatelessWidget {
  final Widget child;

  const NavBack({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned(
          left: 20,
          bottom: 20,
          child: FloatingActionButton.extended(
            heroTag: 'back_nav',
            label: Text('Back'),
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        )
      ],
    );
  }
}
