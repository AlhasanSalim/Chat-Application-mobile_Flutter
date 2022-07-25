import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../constants.dart';

class TamplateWidget extends StatelessWidget {
  final Widget body;
  const TamplateWidget({Key? key ,required this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (!connected){
            WidgetsBinding.instance.addPostFrameCallback((_) async { 
              await showDialog(barrierDismissible: false, context: context, builder: (_){
                return AlertDialog(
                  title: const Text("Oooops You Are OFFLINE !!!!!"),
                  content: const Text("Try to reconnect OR use Your Mobile Data"),
                  actions: [
                    TextButton(
                      onPressed: (){
                        exit(0);
                      },
                      child: const Text("Ok")
                    )
                  ],
                );
              });
            });
          }
          return body;
        },
        child: Container(),
      ),
    );
  }
}