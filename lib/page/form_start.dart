

import 'package:flutter/material.dart';
import 'package:food_delivery/page/login.dart';
import 'package:food_delivery/widget/widget.dart';

class FormStart extends StatefulWidget {
  const FormStart({super.key});

  @override
  State<FormStart> createState() => _FormStartState();
}

class _FormStartState extends State<FormStart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 220, top: 110),
                    child: Image.asset("assets/male.png", width: 190,),
                  ),
                  Image.asset("assets/female.png", width: 297,),
                  layoutButton()
                ]
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget header(){
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageCircleWidget(image: "assets/cook.png", backgroundcolor: Colors.white),
          const SizedBox(height: 25,),
          textWidget(
            text: "Food for Everyone",
            color: Colors.white, 
            fontSize: 60.0,
            fontWeight: FontWeight.w900,
          )
        ],
      ),
    );
  }

  Widget layoutButton(){
    return Positioned(
      bottom: 0,
      child:Stack(
        children:[
          Container(
            height: 150,
            width: 400,
            color: Colors.red.withOpacity(0.89),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 45),
            child: buttonFormWidget(
              width: 300.0, 
              color: Colors.deepOrange, 
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              background: Colors.white,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const FormLogin()));
              },
              text: "Get started"
            )
          ),
        ] 
      )
    );
  }
}