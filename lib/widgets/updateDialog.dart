import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/Utils/Colors.dart';


class UpdateDialogBox extends StatefulWidget {

  final String taskId;
  final String currentTitle;
    final String currentDescription;


  const UpdateDialogBox({
    required this.taskId,
    required this.currentTitle, required this.currentDescription,
  });


  @override
  _UpdateDialogBoxState createState() => _UpdateDialogBoxState();
}

class _UpdateDialogBoxState extends State<UpdateDialogBox> {
  late TextEditingController titleController;
    late TextEditingController descriptionController;



  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.currentTitle);
    descriptionController = TextEditingController(text: widget.currentDescription);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }
    Future<void> updateTask(String taskId, Map<dynamic, dynamic> updatedData) async {
  final url = 'https://nutty-lingerie-frog.cyclic.app/tasks/$taskId';
  
  try {
    final response = await http.put(
      Uri.parse(url),
      body: updatedData,
    );
    
    if (response.statusCode == 200) {
      print('Task updated successfully');
      // Handle success case
    } else {
      print('Failed to update task. Error code: ${response.statusCode}');
      // Handle error case
    }
  } catch (e) {
    print('Error updating task: $e');
    // Handle error case
  }
}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Update Task'),
      content: SizedBox(
        height: 170,
        child: Column(
          children: [
         
                     TextField(
          controller: titleController,
         decoration: InputDecoration(
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      
                      color: Appcolor.primaryColor,width: 1)),
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white,width: 1)),
        
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    
                    
                    borderRadius: BorderRadius.circular(15)),
                  
                  hintText:'Task Title',
                  hintStyle: TextStyle(
                    color: Appcolor.textGrey
                  ),
                  filled: true,
                  fillColor: Appcolor.textHolder
                ),
        ),
        SizedBox(height: 10,),
        TextField(
          maxLines: 3,
          controller: descriptionController,
         decoration: InputDecoration(
          
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      
                      color: Appcolor.primaryColor,width: 1)),
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white,width: 1)),
        
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    
                    
                    borderRadius: BorderRadius.circular(15)),
                  
                  hintText:'Task Description',
                  hintStyle: TextStyle(
                    color: Appcolor.textGrey
                  ),
                  filled: true,
                  fillColor: Appcolor.textHolder
                ),
          ),
          ]
        )
      
        ),
    
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:  Text('Cancel',style: TextStyle(
                                                            color: Appcolor
                                                                .primaryColor),),
        ),
        TextButton(
          onPressed: () {
            final updatedData = {'title': titleController.text,
            'description': descriptionController.text
            };
            updateTask(widget.taskId, updatedData);
            Navigator.pop(context);
          },
          child:  Text('Update',style: TextStyle(
                                                            color: Appcolor
                                                                .primaryColor),),
        ),
      ],
    );
  }
}
