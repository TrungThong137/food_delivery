import 'package:flutter/material.dart';
import 'package:food_delivery/dialog/error_dialog.dart';
import 'package:food_delivery/dialog/loading_page.dart';
import 'package:food_delivery/firebase/firebase_auth.dart';
import 'package:food_delivery/page/home/home.dart';
import 'package:food_delivery/widget/string.dart';
import 'package:food_delivery/widget/widget.dart';

class BodyInputLogin extends StatefulWidget {
  const BodyInputLogin({super.key,});

  @override
  State<BodyInputLogin> createState() => _BodyInputLoginState();
}

class _BodyInputLoginState extends State<BodyInputLogin> {

  final FireAuth _fireAuth= FireAuth();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputWidget(
              lableText: "Email address", 
              controller: emailController,
              errorText: isEmail ? null : "Email Không Hợp Lệ",
            ),
            const SizedBox(height: 20,),
            inputWidget(
              lableText: "Password", 
              controller: passController,
              errorText: ispass ? null : "Mật Khẩu ít nhất 6 kí tự",
              obscureText: true
            ),
      
            const SizedBox(height: 20,),
            textWidget(color: Colors.deepOrange, fontSize: 20.0, fontWeight: FontWeight.w500, text: "Forgot passcode?"),

            const SizedBox(height: 130,),
            buttonFormWidget(
              width: 300.0,
              color: Colors.white, 
              fontSize: 20.0, 
              fontWeight: FontWeight.bold,
              onTap: (){
                setState(() {
                  
                });
                _onSignUpClicked();
              },
              text: "Login",
              background: Colors.deepOrange
            )
          ],
        ),
      ),
    );
  }
  void _onSignUpClicked(){
    if(emailController.text.contains('@') && emailController.text.length>6){
      isEmail=true;
    }else{
      isEmail=false;
    }
    if(passController.text.length>6){
      ispass=true;
    }else{
      ispass=false;
    }

    if(isEmail && ispass){
      
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      _fireAuth.signUp(
        emailController.text.trim(),
        passController.text.trim(),
        (){
          LoadingDialog.hideShowDialog(context);
          Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const PageHome()));
        }, (msg){
          LoadingDialog.hideShowDialog(context);
          ErrorDialog.showErrorDialog(context, 'Sign-In', msg);
        } 
      );
    }
  }
}