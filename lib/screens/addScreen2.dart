

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/Provider/Provider.dart';
import 'package:notes_app/Utils/Colors.dart';
import 'package:notes_app/widgets/TextFieldWidget.dart';
import 'package:notes_app/widgets/button.dart';
import 'package:provider/provider.dart';


class AddScreen2 extends StatefulWidget {
  const AddScreen2({super.key});

  @override
  State<AddScreen2> createState() => _AddScreen2State();
}

class _AddScreen2State extends State<AddScreen2> {

  // void addTask() async {
  //   if (titleController.text.isNotEmpty &&
  //       descriptionController.text.isNotEmpty) {
  //     var regBody = {
  //       "title": titleController.text,
  //       "description": descriptionController.text
  //     };
  //     var response = await http.post(Uri.parse(createTaskUrl),
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode(regBody));
  //     var jsonResponse = jsonDecode(response.body);
  //     print(jsonResponse['status']);

  //     if (response.statusCode == 200) {
  //       SnackBarClass()
  //           .showSnackBar(context, 'view task', 'Task added successfully', () {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: ((context) => TaskListScreen())));
  //       });
  //       setState(() {
  //         isLoading = false;
  //       });
  //       titleController.clear();
  //       descriptionController.clear();

  //       // Navigator.pop(context);
  //       // getTodoList(userId);
  //     } else {
  //       print("SomeThing Went Wrong");
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }

 

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Consumer<ProviderClass>(

        builder: ( context,  value,  child) {  
          return WillPopScope(
             onWillPop: ()async { 
              
              value.moveToListScreen(context);
              return true;
             },
            child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 7, bottom: 7, right: 30),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                  value.moveToListScreen(context);


                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Appcolor.primaryColor,
                                size: 25,
                              ))),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Lottie.network(
                            "https://assets7.lottiefiles.com/packages/lf20_h4th9ofg.json",
                            height: 150)),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldWidget(
                          controller: value.titleController,
                          hinText: 'Task Title',
                          borderRadius: 30,
                          maxLine: 1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                            controller: value.descriptionController,
                            hinText: "Task Description",
                            borderRadius: 15,
                            maxLine: 5),
                        SizedBox(
                          height: 20,
                        ),
                        ActionButton(
                          text: "Add task",
                          backgroundColor: Appcolor.primaryColor,
                          textColor: Colors.white,
                          isLoading: value.isLoading,
                          onTap: () {
                           value.addTaskNew(context); 
                            value.isLoadingTrue();
                          },
                          onpressedOpen: () {},
                          onpressedupdate: () {},
                          onpressedDelete: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
                  ),
          );

        },
      )
    );
  }
}
