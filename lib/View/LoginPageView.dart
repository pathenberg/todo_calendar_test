// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_calendar_test/View/Component/MyTextFieldView.dart';
import 'package:todo_calendar_test/View/Component/myButton.dart';
import 'package:todo_calendar_test/View/SignUpViewPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //controller pour le texte de username

  final usernameController = TextEditingController();

  //controller pour le texte du mot de passe

  final passwordController = TextEditingController();

  // methode signuser

  void signUserIn(){

    // ici envoyer la méthode de connexion à https://example.com/api/login/ via la logique contenu dans AuthService.dart

  }

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300, 
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

          // usertextfield    
          MyTextFieldView(
            controller: usernameController,
            hintText: 'Utilisateur',
            obscureText: false,
          ),

          const SizedBox(
              height: 25,
          ),

          // passwordtextfield
          MyTextFieldView(
            controller: passwordController,
            hintText: 'Mot de passe',
            obscureText: true,

          ),
           const SizedBox(
              height: 25,
          ),

          MyButton(
            text: "Connexion",
            onTap: signUserIn,
          ),
          
          
          const SizedBox(
              height: 50,
          ),


          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.deepPurple,
                
                ),
              ),

              Text('Ou continuez avec',
              style: TextStyle(color: Colors.deepPurple)
              ),

              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.deepPurple,
                
                ),
              ),
            ],
          ),

          const SizedBox(
              height: 50,
          ),

          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Pas encore inscrit?'),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpViewPage()),
                );
              },
              child: Text(
                'Inscrivez vous !',
                style: TextStyle(
                  color: Colors.deepPurple.shade300,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
       ]
    ),
    ),
    ),
  );
  }
}