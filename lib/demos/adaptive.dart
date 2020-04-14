import 'package:flutter/material.dart';

import '../ui/breakpoints.dart';
import 'index.dart';

class AdaptiveScreen extends StatefulWidget {
  @override
  _AdaptiveScreenState createState() => _AdaptiveScreenState();
}

class _AdaptiveScreenState extends State<AdaptiveScreen> {
  final _selection = ValueNotifier<Contact>(null);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, dimens) {
        if (dimens.maxWidth >= kTabletBreakpoint) {
          return Row(
            children: <Widget>[
              Container(
                width: 300,
                child: AdaptiveList(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.startTop,
                  onSelect: (val) => _selection.value = val,
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _selection,
                  builder: (context, contact, child) =>
                      DetailsScreen(contact: contact),
                ),
              )
            ],
          );
        }
        return AdaptiveList(
          onSelect: (val) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => DetailsScreen(contact: val),
            ));
          },
        );
      },
    );
  }
}

class AdaptiveList extends StatelessWidget {
  const AdaptiveList({
    Key key,
    @required this.onSelect,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  final ValueChanged<Contact> onSelect;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    const kCount = 20;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 3,
        ),
        itemCount: kCount,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => onSelect(Contact(
              Colors.red.withOpacity(index / kCount),
            )),
            child: Container(height: 60),
          );
        },
      ),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: FloatingActionButton(
        child: Container(),
        backgroundColor: Colors.red,
        onPressed: null,
      ),
    );
  }
}
