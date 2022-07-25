import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/buttons.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/screens/chat_page.dart';
import 'package:firebase_project/screens/login_page.dart';
import 'package:firebase_project/screens/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../widgets/tamplate_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
   init();
    super.initState();
  }
  void init() async {
    await Future.delayed(const Duration(milliseconds: 100));
     if (FirebaseAuth.instance.currentUser != null){
      Navigator.push(context, MaterialPageRoute(builder: (_){return const ChatPage();}));
    }
  }
  @override
  Widget build(BuildContext context) {
    return TamplateWidget(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 300,
              ),
              const SizedBox(
                height: 40
              ),
              Button(
                text: "Login",
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_){return const LoginPage();}));
                },
                color: Colors.lightBlueAccent
              ),
              Button(
                text: "Register",
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_){return const RegisterPage();}));
                },
                color: Colors.lightBlueAccent
              ),
            ],
          ),
        ),
      )
    );
  }
}