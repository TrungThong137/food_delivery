import 'package:flutter/material.dart';
import 'package:food_delivery/page/form_login.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, bottom: 20),
            child: Image.asset("assets/cook_largest.png",),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          toolbarHeight: 230,
          // flexibleSpace: SafeArea(child: Image.asset("assets/cook_largest.png")),
          bottom:const TabBar(
            tabs: [
              Tab(text: "Login",),
              Tab(text: "Sign-up")
            ],
            indicatorWeight: 5,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            unselectedLabelStyle: TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
          ),
        ),
        body:const TabBarView(
          children: [
            BodyInputLogin(),
            BodyInputLogin()
          ],
        ),
      ),
    );
  }
}