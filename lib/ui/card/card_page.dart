import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';

class CardPage extends StatelessWidget {
  static const String _title = 'Card';
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Template(
      index: PageIndex.qr,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          child: Text(
            _title,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
