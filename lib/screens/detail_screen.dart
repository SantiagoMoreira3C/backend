import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/email.dart';


class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.email}) : super(key: key);
  
  Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
        backgroundColor: Color.fromARGB(255, 104, 204, 126),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
      child:  Column(
       children: [
          Text('From: '+email.from,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20),
            ),
         Divider(color: Color.fromARGB(140, 104, 204, 126)),
                   Text(email.subject,
                   style: TextStyle(fontSize: 20),),
       Divider(color: Color.fromARGB(140, 104, 204, 126)),
         Text(email.body,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20),
            ),
            ],
      ),

      ),
     
    );
           
  }
}