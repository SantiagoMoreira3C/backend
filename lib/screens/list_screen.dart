import 'package:flutter/material.dart';


import '../models/email.dart';
import '../widgets/email_widgets.dart';
import 'package:backend/models/backend.dart';


class ListScreen extends StatelessWidget {
   ListScreen({Key? key, required this.email}) : super(key: key);
  
  
  Email email;


  @override

    
  Widget build(BuildContext context) {
    return Container(
        child: Column(
                children: [
                  Text(email.dateTime.year.toString() +'-'+ email.dateTime.month.toString()  + '-'+ email.dateTime.day.toString(),),
                  Text(email.from),
                  Text(email.subject),
                  ],
              
              ),
    );
  }
}