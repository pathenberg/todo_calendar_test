import 'package:flutter/material.dart';
import 'package:todo_calendar_test/View/Component/AppBarView.dart';
import 'package:todo_calendar_test/View/Component/DrawerView.dart';
import 'package:todo_calendar_test/View/LoginPageView.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
        appBar: CustomAppBar(title: 'Votre profil'), //AppBarView renvoie cette appBar, on a variabilisé en amont le titre pour qu'il puisse être différent en fonciton de la page
        drawer: CustomDrawer(), // DrawerView renvoie ce drawer
        body: LoginPage(),
    );
          
  }
    
  }
