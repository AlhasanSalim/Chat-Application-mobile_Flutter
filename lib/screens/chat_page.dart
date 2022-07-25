import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/buttons.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/screens/home_page.dart';
import 'package:firebase_project/screens/register_page.dart';
import 'package:firebase_project/widgets/massage_bubbel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController massageTextController;

  @override
  void initState() {
    massageTextController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      FirebaseAuth.instance.currentUser?.email ?? "",
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    trailing: IconButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){return const HomePage();}), (route) => false);
                      },
                      icon: const Icon(Icons.logout)
                    )
                  ),
                ),
              ),
              Expanded(child: massageStreamWidget()),
              Container(
                decoration: kMassageContainerDecoration,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: null,
                        controller: massageTextController,
                        decoration: kMassageTextFeildDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: onSendMassage,
                      child: const Text(
                        "Send",
                        style: kSendButtonTextStyle
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void onSendMassage(){
    FirebaseFirestore.instance.collection('massages').add(
      {
        'massage' : massageTextController.text,
        'sendUser' : FirebaseAuth.instance.currentUser?.email,
        'sendDate' : DateTime.now()
      }
    );
    massageTextController.clear();
  }
  Widget massageStreamWidget(){
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('massages').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        if (snapshot.data?.docs.isEmpty ?? false){
          return const Center(
            child: Text(
              "No Data FOUND"
            ),
          );
        }

        else{
          var massages = snapshot.data!.docs.toList();
          massages.sort((a, b) =>
            ((a.data()as Map)['sendDate'].toDate()).compareTo((b.data() as Map)['sendDate'].toDate()));
          massages = massages.reversed.toList();
          return ListView.builder(
            itemCount: massages.length,
            reverse: true,
            itemBuilder: (_, index){
              return MassageBubble(map: (massages[index].data() as Map));
            }
          );
        }
      }
    );
  }
}