import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  static const String _title = 'dummy';

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        _title,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
