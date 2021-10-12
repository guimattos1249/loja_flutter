import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual_pro/models/product_manager.dart';
import 'package:loja_virtual_pro/screens/products/components/product_list_title.dart';
import 'package:provider/provider.dart';

import 'components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        title: const Text('Produtos'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => SearchDialog());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: productManager.allProducts!.length,
            itemBuilder: (_, index) {
              return ProductListTitle(
                productManager.allProducts![index],
              );
            },
          );
        },
      ),
    );
  }
}
