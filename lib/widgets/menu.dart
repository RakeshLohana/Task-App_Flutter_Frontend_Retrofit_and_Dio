import 'package:flutter/material.dart';

class ContextMenuExample extends StatelessWidget {
  const ContextMenuExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Context Menu Sample'),
      ),
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'copy',
                  child: ListTile(
                    leading: Icon(Icons.content_copy),
                    title: Text('Copy'),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'share',
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share'),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'favorite',
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Favorite'),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                    // style: TextStyle(color: Colors.red), // Destructive action text color
                  ),
                ),
              ];
            },
            onSelected: (String result) {
              // Handle menu item selection here
              if (result == 'copy') {
                // Copy action
              } else if (result == 'share') {
                // Share action
              } else if (result == 'favorite') {
                // Favorite action
              } else if (result == 'delete') {
                // Delete action
              }
            },
          ),
        ),
      ),
    );
  }
}
