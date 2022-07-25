import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/buttons.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/screens/chat_page.dart';
import 'package:firebase_project/helpers/snack_helper.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: SingleChildScrollView(
           child: Column(
           mainAxisAlignment: MainAxisAlignment.center, 
           children: [
            const FlutterLogo(
                size: 200,
            ),
            const SizedBox(height: 40),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: kTextFeildDecoration.copyWith(hintText: "Enter your E-mail"),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: kTextFeildDecoration.copyWith(hintText: "Enter your password"),
            ),
            Button(
              text: 'Login',
              onPressed: onRegisterClicked,
              color: Colors.lightBlueAccent
            )
         
           ],
          ),
         ),
      ),
     ), 
    );
  }
  void onRegisterClicked() async {
    try{
      final uesrCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    if (uesrCredential.user != null){
      Navigator.push(context, MaterialPageRoute(builder: (_){return const ChatPage();}));
    }
   }catch(e){
    SnackHelper.showSnack(context: context,title: e.toString());
   }
  }
}