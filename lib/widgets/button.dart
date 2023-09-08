import 'package:flutter/material.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';

class ActionButton extends StatelessWidget {
  
final VoidCallback onTap;
final VoidCallback onpressedOpen;
final VoidCallback onpressedupdate;
final VoidCallback onpressedDelete;
final bool listViewOpened;
final   bool isLoading;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double border;
  
   ActionButton({super.key, required this.text, required this.backgroundColor, required this.textColor, required this.isLoading, this.border=30, required this.onTap,this.listViewOpened=false, required this.onpressedOpen, required this.onpressedupdate, required this.onpressedDelete});

  @override
  Widget build(BuildContext context) {
    return listViewOpened==true ? FocusedMenuHolder(
     
  menuItems: <FocusedMenuItem>[
    FocusedMenuItem(
        title: Text("Open"),
        trailingIcon: Icon(Icons.open_in_new),
        onPressed: onpressedOpen),
    FocusedMenuItem(
        title: Text("Update"),
        trailingIcon: Icon(Icons.update),
        
        onPressed: onpressedupdate),
  
    FocusedMenuItem(
        title: Text("Delete",
          style: TextStyle(color: Colors.redAccent),),
        trailingIcon: Icon(Icons.delete,color: Colors.redAccent,),
        onPressed: onpressedDelete),
  ],

      onPressed: (){},
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 14,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: 24,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    ): GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 14,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: 24,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      );

  }
}