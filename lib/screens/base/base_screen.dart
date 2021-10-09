import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual_pro/models/page_manager.dart';
import 'package:loja_virtual_pro/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  BaseScreen({Key? key}) : super(key: key);

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
              backgroundColor: const Color.fromARGB(255, 4, 125, 141),
              title: const Text('Loja'),
            ),
          ),
          const ProductsScreen(),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 4, 125, 141),
              title: const Text('Loja'),
            ),
          ),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 4, 125, 141),
              title: const Text('Loja'),
            ),
          ),
        ],
      ),
    );
  }
}
