import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notes_app/Provider/Provider.dart';
import 'package:notes_app/Utils/Colors.dart';
import 'package:notes_app/widgets/button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Consumer<ProviderClass>(
        builder: ( context,  value,child) {
           return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 60,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Streamline Your Tasks",
                              style: TextStyle(
                                  fontFamily: "AlegreyaSans",
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.primaryColor)),
                          Text(
                            "Simplify Your Life",
                            style: TextStyle(
                                fontFamily: "AlegreyaSans",
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Appcolor.smallTextColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Lottie.asset(
                        "assets/1.json",
                      ),
                      ActionButton(
                        backgroundColor: Appcolor.primaryColor,
                        textColor: Colors.white,
                        text: 'Add task',
                        isLoading: false,
                        onTap: () {
                          value.moveToAddTask(context);
      
             
                        },
                        onpressedOpen: () {},
                        onpressedupdate: () {},
                        onpressedDelete: () {},
                      ),
                      ActionButton(
                        backgroundColor: Colors.grey.shade200,
                        textColor: Appcolor.smallTextColor,
                        text: 'View all',
                        isLoading: false,
                        onTap: () {
                          value.moveToListScreen(context);
      
                        },
                        onpressedOpen: () {},
                        onpressedDelete: () {},
                        onpressedupdate: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );

          },
       
      ),
    );
  }
}
