import 'package:flutter/material.dart';
import 'package:notes_app/Utils/Colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final double borderRadius;
  final int maxLine;
  const TextFieldWidget({super.key, required this.controller, required this.hinText, required this.borderRadius, required this.maxLine});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
            maxLines: maxLine,
              style: TextStyle(
                fontSize: 20,
                color: Appcolor.smallTextColor
                
              ),
                controller: controller,
                decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),


                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(
                      
                      color: Appcolor.primaryColor,width: 1)),
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: Colors.white,width: 1)),
        
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    
                    
                    borderRadius: BorderRadius.circular(borderRadius)),
                  
                  hintText:hinText,
                  hintStyle: TextStyle(
                    color: Appcolor.textGrey
                  ),
                  filled: true,
                  fillColor: Appcolor.textHolder
                ),
              );
  }
}