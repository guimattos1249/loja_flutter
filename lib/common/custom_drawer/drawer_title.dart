import 'package:flutter/material.dart';

class DrawerTitle extends StatelessWidget {
  const DrawerTitle({
    Key? key,
    required this.iconData,
    required this.title,
    required this.page,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
