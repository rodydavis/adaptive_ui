import 'package:flutter/material.dart';

class Contact {
  final Color color;

  Contact(this.color);
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key key,
    this.contact,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  final Contact contact;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    if (contact == null) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
        ),
        body: Placeholder(
          color: Colors.grey.shade300,
          strokeWidth: 3,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: contact.color),
    );
  }
}
