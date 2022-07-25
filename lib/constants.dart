import 'package:flutter/material.dart';

final kScaffoldBackgroundColor = Colors.grey.shade200;

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlue,
  fontWeight: FontWeight.bold,
  fontSize: 18
);


const kMassageTextFeildDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  hintText: "Type Your Massage here ...",
  border: InputBorder.none
);

const kMassageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2
    )
  )
);

const kTextFeildDecoration = InputDecoration(
  hintText: "",
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30))
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2
    ),
    borderRadius: BorderRadius.all(Radius.circular(30))
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2
    ),
    borderRadius: BorderRadius.all(Radius.circular(30))
  )
);