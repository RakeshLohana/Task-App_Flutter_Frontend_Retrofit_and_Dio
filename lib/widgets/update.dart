import 'package:flutter/material.dart';
import 'package:notes_app/API/dio_client.dart';
import 'package:notes_app/API/get.dart';
import 'package:notes_app/Utils/Colors.dart';

class TaskEditScreen extends StatefulWidget {
  final GetTask task;

  TaskEditScreen(this.task);

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text fields with the existing task data
    titleController.text = widget.task.title!;
    descriptionController.text = widget.task.description!;
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
                // Create an updated task object with the edited data
                final updatedTask = GetTask(
                  id: widget.task.id,
                  title: titleController.text,
                  description: descriptionController.text,
                  completed: widget.task.completed,
                  createdAt: widget.task.createdAt,
                );

                // Call the updateTask method to update the task
                client.updateTask(widget.task.id!, updatedTask).then((updatedTask) {
                  // Task updated successfully, navigate back to the previous screen
                  Navigator.pop(context, updatedTask);
                }).catchError((error) {
                  // Handle the error, e.g., display an error message
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Failed to update the task.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                });
           },
          child:  Text('Update',style: TextStyle(
                                                            color: Appcolor
                                                                .primaryColor),),
        ),
      ],
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Edit Task'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         TextField(
    //           controller: titleController,
    //           decoration: InputDecoration(labelText: 'Title'),
    //         ),
    //         TextField(
    //           controller: descriptionController,
    //           decoration: InputDecoration(labelText: 'Description'),
    //         ),
    //         SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: () {
    //             // Create an updated task object with the edited data
    //             final updatedTask = GetTask(
    //               id: widget.task.id,
    //               title: titleController.text,
    //               description: descriptionController.text,
    //               completed: widget.task.completed,
    //               createdAt: widget.task.createdAt,
    //             );

    //             // Call the updateTask method to update the task
    //             client.updateTask(widget.task.id!, updatedTask).then((updatedTask) {
    //               // Task updated successfully, navigate back to the previous screen
    //               Navigator.pop(context, updatedTask);
    //             }).catchError((error) {
    //               // Handle the error, e.g., display an error message
    //               showDialog(
    //                 context: context,
    //                 builder: (context) {
    //                   return AlertDialog(
    //                     title: Text('Error'),
    //                     content: Text('Failed to update the task.'),
    //                     actions: [
    //                       TextButton(
    //                         onPressed: () {
    //                           Navigator.pop(context);
    //                         },
    //                         child: Text('OK'),
    //                       ),
    //                     ],
    //                   );
    //                 },
    //               );
    //             });
    //           },
    //           child: Text('Save Changes'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

