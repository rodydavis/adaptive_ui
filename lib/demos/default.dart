import 'package:flutter/material.dart';

import '../ui/breakpoints.dart';
import 'index.dart';

class DefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, dimens) {
        if (dimens.maxWidth >= kTabletBreakpoint) {
          return TabletDevice();
        }
        return MobileDevice();
      },
    );
  }
}
