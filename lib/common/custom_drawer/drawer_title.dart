import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/models/page_manager.dart';
import 'package:provider/provider.dart';

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
    final int curPage = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;
    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? primaryColor : Colors.grey[700],
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: curPage == page ? primaryColor : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
