import 'package:adaptive_ui/ui/breakpoints.dart';
import 'package:flutter/material.dart';

const kDialogSize = Size(505, 700);

class DialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, dimens) => Scaffold(
            appBar: AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Text('Adaptive Dialog Demo'),
                actions: [
                  IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        if (dimens.maxWidth >= kTabletBreakpoint) {
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  AdaptiveDialog(child: SettingsScreen()));
                          return;
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (_) => SettingsScreen(),
                        ));
                      })
                ]),
            body: Center(
                child: Container(
                    width: 300,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      RaisedButton.icon(
                          icon: Icon(Icons.settings),
                          label: Text('Open Settings'),
                          onPressed: () {
                            if (dimens.maxWidth >= kTabletBreakpoint) {
                              showDialog(
                                context: context,
                                builder: (_) =>
                                    AdaptiveDialog(child: SettingsScreen()),
                              );
                              return;
                            }
                            Navigator.of(context).push(MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) => SettingsScreen()));
                          }),
                    ])))));
  }
}

class AdaptiveDialog extends StatelessWidget {
  final Widget child;
  const AdaptiveDialog({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, dimens) {
      if (dimens.maxWidth < kDialogSize.width ||
          dimens.maxHeight < kDialogSize.height) return child;
      return Center(
        child: SizedBox.fromSize(
            size: kDialogSize,
            child: AspectRatio(aspectRatio: 1, child: child)),
      );
    });
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text('Settings')),
    );
  }
}
