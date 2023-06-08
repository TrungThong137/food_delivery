import 'package:flutter/material.dart';

class LoadingDialog{
  static void showLoadingDialog(BuildContext context, String msg){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: Container(
          color: Colors.white,
          height: 100,
          child: Column(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20,),
              Text(
                msg,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  static void hideShowDialog(BuildContext context){
    Navigator.pop(context);
  }
}