import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual_pro/models/page_manager.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Loja'),
            ),
          ),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Loja'),
            ),
          ),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Loja'),
            ),
          ),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Loja'),
            ),
          ),
        ],
      ),
    );
  }
}
