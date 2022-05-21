import 'package:backend/models/email.dart';
import 'package:backend/screens/detail_screen.dart';
import 'package:backend/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:backend/widgets/email_widgets.dart';
import 'package:backend/models/backend.dart';


void main(){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     initialRoute: '/',
        routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
     '/': (context) =>  MyHomePage(),

      
        }
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);

  final backend = Backend();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(     
        title: const Text('List Emails'),
        backgroundColor: Color.fromARGB(255, 102, 204, 204)
      ),

      body: ListView(
        children: backend.getEmails()
            .map((email) => EmailWidgets(
              email: email,  
              ))
            .toList(),
      ),
    );
  }
}
