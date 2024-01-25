import 'package:flutter/material.dart';


// on créer une vue pour l'appbar customisé pour alleger le code de main.dart ainsi que d'éviter la répition dans profileView

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      backgroundColor: Colors.deepPurple[300],
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 28),
      title: Text(title),
    );
    

  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
