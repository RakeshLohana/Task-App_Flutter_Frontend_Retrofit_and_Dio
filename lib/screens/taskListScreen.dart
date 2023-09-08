import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/API/dio_client.dart';
import 'package:notes_app/API/get.dart';
import 'package:notes_app/API/model.dart';
import 'package:notes_app/Provider/Provider.dart';
import 'package:notes_app/Urls/urls.dart';
import 'package:notes_app/Utils/Colors.dart';
import 'package:notes_app/widgets/button.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/widgets/update.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<GetTaskOld> getTaskList = [];

  Future<List<GetTaskOld>> getTasksList() async {
    final response = await http.get(Uri.parse(getTaskUrl));
    var data = jsonDecode((response.body.toString()));
    if (response.statusCode == 200) {
      for (Map i in data) {
        getTaskList.add(GetTaskOld.fromJson(i));
        print(getTaskList);
      }
      return getTaskList;
    }
    return getTaskList;
  }

  Future<void> deleteTask(String taskId) async {
    final url = 'https://nutty-lingerie-frog.cyclic.app/tasks/$taskId';

    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        print('Task deleted successfully');
        // Handle success case
      } else {
        print('Failed to delete task. Error code: ${response.statusCode}');
        // Handle error case
      }
    } catch (e) {
      print('Error deleting task: $e');
      // Handle error case
    }
  }

  @override
  Widget build(BuildContext context) {
    final leftEditIcon = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
          color: Appcolor.smallTextColor.withOpacity(0.5),
        ),
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
      ),
    );
    final rightEditIcon = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 12,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
    );

    return SafeArea(
      child: Consumer<ProviderClass>(
        builder: ( context, value,  child) { 
          return  WillPopScope(
            onWillPop: ()async { 
              
              value.moveToHomePage(context);
              return true;
             },
             
            child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            value.moveToHomePage(context);
                          },
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.arrow_back,
                                color: Appcolor.primaryColor,
                              )),
                        ),
                        Lottie.asset("assets/data.json", height: 250),
                      ],
                    ),
                    decoration: BoxDecoration(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                value.moveToHomePage(context);
                              },
                              icon: Icon(
                                Icons.home,
                                size: 35,
                                color: Appcolor.secondaryColor,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Appcolor.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                           value.moveToAddTask(context);
                            },
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: RefreshIndicator(
                    color: Appcolor.primaryColor,
                    onRefresh: () {
                      return client.getTasks();
                    },
                    child: FutureBuilder(
                      future: client.getTasks(),
                      // future: getTask(),
                      builder: (context, snapshot) {
                        final List<GetTask> posts = snapshot.data ?? [];
                        if (!snapshot.hasData) {
                          return Column(
                            children: [
                              CircularProgressIndicator(
                                color: Appcolor.primaryColor, //<-- SEE HERE
                                backgroundColor: Colors.grey, //<-- SEE HERE
                              ),
                            ],
                          );
                        } else {
                         
                  
                          return ListView.builder(
                              itemCount: posts.length,
                              // itemCount: getList.length,
                              itemBuilder: (context, index) {
                                final GetTask item = posts[index];
                                return Dismissible(
                                    background: leftEditIcon,
                                    secondaryBackground: rightEditIcon,
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      if (direction ==
                                          DismissDirection.startToEnd) {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Colors.transparent,
                                            context: context,
                                            builder: (_) {
                                              return Container(
                                                  height: 300,
                                                  decoration: BoxDecoration(
                                                      color: Appcolor.smallTextColor
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                      25),
                                                              topRight:
                                                                  Radius.circular(
                                                                      25))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        ActionButton(
                                                          text: "View",
                                                          backgroundColor:
                                                              Appcolor.primaryColor,
                                                          textColor: Colors.white,
                                                          isLoading: false,
                                                          onTap: () {
                                                            dialogBoxWidget(context,
                                                                index, posts);
                                                          }, onpressedOpen: () {  }, onpressedupdate: () {  }, onpressedDelete: () {  },
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        ActionButton(
                                                          text: "Edit",
                                                          backgroundColor:
                                                              Colors.white,
                                                          textColor:
                                                              Appcolor.primaryColor,
                                                          isLoading: false,
                                                          onTap: () {
                                                            showDialog(
                                                                context: context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    TaskEditScreen(
                                                                        item)
                                                                //     UpdateDialogBox(
                                                                //   taskId: item.id.toString(),
                                                                //   currentTitle:item.title.toString(),
                                                                //   currentDescription:
                                                                //      item.description.toString()
                                                                // ),
                                                                );
                                                          }, onpressedOpen: () {  }, onpressedupdate: () {  }, onpressedDelete: () {  },
                                                        )
                                                      ],
                                                    ),
                                                  ));
                                            });
                                        return false;
                                      } else {
                                        return Future.delayed(
                                            Duration(milliseconds: 200),
                                            () =>
                                                direction ==
                                                DismissDirection.endToStart);
                                      }
                                    },
                                    onDismissed: (DismissDirection direction) {
                                      value.deleteTask(context, item.id.toString());
                                     
                                    },
                                    key: UniqueKey(),
                                    child: ActionButton(
                                      listViewOpened: true,
                                    
                                      border: 10,
                                      backgroundColor: Colors.grey.shade200,
                                      textColor: Appcolor.smallTextColor,
                                      text: item.title.toString(),
                                      isLoading: false,
                                      onTap: () {
                
                                         dialogBoxWidget(context, index,posts);
                                      }, onpressedOpen: () {  
                                         dialogBoxWidget(context, index,posts);
                                      }, onpressedupdate: () { 
                                         showDialog(
                                                                context: context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    TaskEditScreen(
                                                                        item)
                                                           
                                                                );
                                       }, onpressedDelete: () {  

                                        value.deleteTask(context, item.id.toString());
                                         
                                       },
                                    ));
                              });
                        }
                      },
                    ),
                  ),
                )
              ]),
            ),
                  ),
          );

         },
       
      ),
    );
  }

  Future<String?> dialogBoxWidget(
      BuildContext context, int index, List<GetTask> posts) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            // border: Border.all(
            //   color:Appcolor.primaryColor,
            //   width: 2
            // ),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  // 'title',
                  posts[index].title.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                    decoration: BoxDecoration(
                      color: Appcolor.textHolder,
                       borderRadius: BorderRadius.circular(15)
          
                 
                  

              
                ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Text(
                      // 'dewsc',
                      posts[index].description.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton(
                    
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(
                      
                      'Cancel',
                      style: TextStyle(fontSize:17,color: Appcolor.primaryColor),
                    ),
                  ),
           
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
