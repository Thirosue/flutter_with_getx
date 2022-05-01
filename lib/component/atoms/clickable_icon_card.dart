import 'package:flutter/material.dart';

class ClickAbleIconCard extends StatelessWidget {
  final Function()? onClick;
  final IconData? icon;
  final String label;

  const ClickAbleIconCard({
    Key? key,
    required this.onClick,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 40,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 3,
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
