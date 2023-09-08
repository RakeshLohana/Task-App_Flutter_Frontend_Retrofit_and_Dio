import 'package:flutter/material.dart';
import 'package:notes_app/API/dio_client.dart';
import 'package:notes_app/API/get.dart';
import 'package:notes_app/API/post_model.dart';
import 'package:notes_app/Utils/snackBar.dart';
import 'package:notes_app/screens/HomePage.dart';
import 'package:notes_app/screens/addScreen2.dart';
import 'package:notes_app/screens/taskListScreen.dart';

class ProviderClass extends ChangeNotifier {
  bool isLoading = false;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void isLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
   void moveToHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void moveToAddTask(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => AddScreen2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void moveToListScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) =>
            TaskListScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void addTaskNew(BuildContext context) {
    client.AddTaskResquest(AddTask(
            title: titleController.text,
            description: descriptionController.text))
        .then((response) async {
      // Navigate to home screen
      if (response.completed == false) {
        isLoading = false;
        // SnackBarClass()
        //     .showSnackBar(context, 'Task added successfully', "View task", () {
        //        Navigator.pushReplacement(
        //   context,
        //   PageRouteBuilder(
        //     transitionDuration: const Duration(milliseconds: 200),
        //     pageBuilder: (context, animation, secondaryAnimation) =>
        //         TaskListScreen(),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       return SlideTransition(
        //         position: Tween<Offset>(
        //           begin: const Offset(1.0, 0.0),
        //           end: Offset.zero,
        //         ).animate(animation),
        //         child: child,
        //       );
        //     },
        //   ),
        // );

            // });
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) =>
                TaskListScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
        
        titleController.clear();
        descriptionController.clear();
                notifyListeners();


      } else {
        // Display error message
        SnackBarClass().showSnackBar(
            context, 'view task', 'Task not added successfully', () {

            });
        isLoading = false;
        notifyListeners();

      }
    }).catchError((error) {
      print("SomeThing Went Wrong");
       SnackBarClass().showSnackBar(
            context, ' Error occured', 'Task not added successfully', () {

            });
        isLoading = false;
        notifyListeners();
      isLoading = false;
      notifyListeners();
    });
  }

  void deleteTask(BuildContext context, String parameter) {
    client.deleteTask(parameter).then((_) {
      SnackBarClass()
          .showSnackBar(context, 'Add Task', 'Task deleted successfully', () {
            Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => AddScreen2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
    notifyListeners();
      });
    }).catchError((e) {
      print(e.toString());
      notifyListeners();
    });
  }


}
