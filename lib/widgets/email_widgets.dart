import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:backend/models/email.dart';

import '../models/backend.dart';
import '../screens/detail_screen.dart';
import '../screens/list_screen.dart';

class EmailWidgets extends StatefulWidget {
// instacia de la clase email 
  final Email email;
  VoidCallback? onClicked;

   EmailWidgets({Key? key, required this.email, this.onClicked}) : super(key: key);

  @override
  State<EmailWidgets> createState() => _EmailWidgetsState();
}

class _EmailWidgetsState extends State<EmailWidgets> {
   Color color2 = Color.fromARGB(235, 58, 175, 73);
    final backend = Backend();
  
   Widget buildCircle({
     required radius,
     required color,
   }){ return Container(
        width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
   );

   }

   Widget buildMenuItem({
  
    required String text, text2,
    VoidCallback? onClicked,
  }){
    final colorfrom = Color.fromARGB(255, 1, 0, 0);
    final colorsubject = Color.fromARGB(199, 1, 0, 0);
    final hoverColor = Color.fromARGB(100,104 , 202, 202);
    return ListTile(

      leading: Text(widget.email.dateTime.year.toString() +'-'+ widget.email.dateTime.month.toString()  + '-'+ widget.email.dateTime.day.toString(),),
      title:  Text(widget.email.from, style: TextStyle(color:colorfrom, fontWeight: FontWeight.bold)),
      subtitle: Text(widget.email.subject, style: TextStyle(color:colorsubject, fontWeight: FontWeight.w600)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget build(BuildContext context) {
    return InkWell(
       onLongPress: () { Navigator.push(
         context, MaterialPageRoute(
          builder: (context) => DetailScreen(email: widget.email),
         ),
   );
    Backend().markEmailAsRead(widget.email.id);
          setState(() {
            color2 = Color.fromARGB(152, 0, 0, 0);
          });
          
    },
      onDoubleTap: () { Navigator.push(
         context, MaterialPageRoute(
          builder: (context) => DetailScreen(email: widget.email),
         ),
   );
    Backend().markEmailAsRead(widget.email.id);
          setState(() {
            color2 = Color.fromARGB(186, 28, 207, 64);
          });
          
    },
    
    
      // Navigator.pushNamed(context, '/'),
        child: Column(
          children: [
            
            Container(
              
              child: Column(
                children: [
                 buildCircle(radius: 20.0, color: color2),

                  Text(widget.email.dateTime.year.toString() +'-'+ widget.email.dateTime.month.toString()  + '-'+ widget.email.dateTime.day.toString(),),
                  Text(widget.email.from, style: TextStyle( color: color2, fontWeight: FontWeight.bold)),
                  Text(widget.email.subject),
                  ],
              
              ),
              
            ),
            
            //Separation with lineal 
            Divider(color: Color.fromARGB(170, 102, 204, 204)),
          ],
          
        ),
        //Separation betwees
     
    );
  }



  
}

