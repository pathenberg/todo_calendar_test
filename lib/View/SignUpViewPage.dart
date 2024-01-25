// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_calendar_test/View/Component/AppBarView.dart';
import 'package:todo_calendar_test/View/Component/DrawerView.dart';
import 'package:todo_calendar_test/View/Component/MyTextFieldView.dart';
import 'package:todo_calendar_test/View/Component/myButton.dart';

class SignUpViewPage extends StatelessWidget {
  SignUpViewPage({super.key});

  //controller pour le texte de username

  final usernameController = TextEditingController();

  //controller pour le texte du mot de passe

  final passwordController = TextEditingController();

  // methode signuser

  void SignUpUser(){

    // ici envoyer la méthode d'inscription à https://example.com/api/login/ via la logique contenu dans AuthService.dart

  }

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Inscription'),
      drawer: CustomDrawer(),
      backgroundColor: Colors.grey.shade300, 
      body: SafeArea(
        child: Center(
          child: Column(
           
            children: [
              const SizedBox(
                height: 50
              ),
              Icon(
              Icons.lock,
              size: 100,
              color: Colors.deepPurple.shade300,
              ),
              const SizedBox(
                height: 25,
              ),
           
           const SizedBox(
                height: 50,
              ),
          // usertextfield    
          MyTextFieldView(
            controller: usernameController,
            hintText: 'Choisissez un nom d\'utilisateur',
            obscureText: false,
          ),

          const SizedBox(
              height: 25,
          ),

          // passwordtextfield
          MyTextFieldView(
            controller: passwordController,
            hintText: 'Choisissez un mot de passe',
            obscureText: true,

          ),
           const SizedBox(
              height: 25,
          ),

          MyButton(
            onTap: SignUpUser,
            text: 'Inscription',
          ),
          
      


          

        
         
       ]
    ),
    ),
    ),
  );
  }
}