import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MassageBubble extends StatelessWidget {
  final Map map;
  const MassageBubble({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Tooltip(
        message:   
        '${ intl.DateFormat('yy-MM-dd hh:mm a').format(map['sendDate'].toDate())}',
        child: Column(
          crossAxisAlignment: FirebaseAuth.instance.currentUser?.email == map['sendUser'] ?
            CrossAxisAlignment.end : 
            CrossAxisAlignment.start,
            children: [
              Text(
                map['sendUser'],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54
                ),
              ),
              Material(
                elevation: 5,
                borderRadius: FirebaseAuth.instance.currentUser?.email == map['sendUser'] ?
                const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft:Radius.circular(8)
                ):
                 const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomRight:Radius.circular(8) 
                ),
                color: FirebaseAuth.instance.currentUser?.email == map['sendUser'] ? 
                  Colors.lightBlueAccent :
                  Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      map['massage'],
                      style: TextStyle(
                        fontSize: 15,
                        color: FirebaseAuth.instance.currentUser?.email == map['sendUser'] ? 
                        Colors.white :
                        Colors.lightBlueAccent,
                      ),
                    ),
                  ),
              )
            ],
        ),
      ),
    );
  }
}