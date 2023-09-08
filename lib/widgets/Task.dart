

import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final Color color;
  final String taskName;
  const TaskWidget({super.key, required this.taskName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width:double.maxFinite,
      height: MediaQuery.of(context).size.height/12,

      decoration: BoxDecoration(
        color: Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(0),
        
      ),
      child:Center(
        child: Text(taskName,style: TextStyle(fontSize: 20,color: color),)
        ));
  }
}