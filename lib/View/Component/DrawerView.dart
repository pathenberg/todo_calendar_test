import 'package:flutter/material.dart';
import 'package:todo_calendar_test/View/ProfileView.dart';
import 'package:todo_calendar_test/main.dart';

// on créer une vue pour l'appbar customisé pour alleger le code de ProfileView ainsi que d'éviter la répition dans profileView

class CustomDrawer extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        backgroundColor: Colors.deepPurple.shade100,
        child: Column(
         
          children:[
         
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Divider(
              color: Colors.deepPurple.shade100,
            ),
          ),
        
         Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Calendrier'),
              onTap: () {
              
               Navigator.pushReplacement( //on utilise pushRemplacement pour éviter la superoposition de page, et on passe HomePage pour revenir à la page du calendrier mensuel
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Mon Profil'),
              onTap: () {
                  Navigator.pushReplacement( //on utilise pushRemplacement pour éviter la superoposition de page, et on passe ProfileView pour accèder à la page profile
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileView(
  
                    ),
                  ),
                );
                
              },
            ),
          ),
          
           Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
            ),
          ),]
         
      ),
      );
    

  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}