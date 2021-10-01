import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/common/custom_drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            title: const Text('Loja'),
          ),
        ),
        Container(
          color: Colors.red,
          child: ElevatedButton(
            onPressed: () {
              pageController.jumpToPage(1);
            },
            child: null,
          ),
        ),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}
