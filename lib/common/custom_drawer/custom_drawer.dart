import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/common/custom_drawer/drawer_title.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerTitle(
            iconData: Icons.home,
            title: 'Início',
            page: 0,
          ),
          DrawerTitle(
            iconData: Icons.list,
            title: 'Produtos',
            page: 1,
          ),
          DrawerTitle(
            iconData: Icons.playlist_add_check,
            title: 'Meus Pedidos',
            page: 2,
          ),
          DrawerTitle(
            iconData: Icons.location_on,
            title: 'Lojas',
            page: 3,
          ),
        ],
      ),
    );
  }
}
