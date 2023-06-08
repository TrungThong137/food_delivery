import 'package:flutter/material.dart';

class ErrorDialog{
  static void showErrorDialog(BuildContext context, String title, String msg){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Okke'))
        ],
      )
    );

  }
}