import 'package:flutter/material.dart';
import 'package:notes_app/Utils/Colors.dart';



class SnackBarClass{

    void showSnackBar(BuildContext context,String label,String text,VoidCallback onTap) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 1),
      content: Text(text),
      backgroundColor: Appcolor.primaryColor,
      margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 100,
      left: 10,
      right: 10,
    ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: label,
        disabledTextColor: Colors.yellow.shade100,
        textColor: Colors.yellow.shade200,
        onPressed: onTap
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar as SnackBar);
  }
       



 
  }



