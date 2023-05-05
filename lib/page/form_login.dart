import 'package:flutter/material.dart';
import 'package:food_delivery/page/my_profile.dart';
import 'package:food_delivery/widget/string.dart';
import 'package:food_delivery/widget/widget.dart';

class BodyInputLogin extends StatefulWidget {
  const BodyInputLogin({super.key, this.onTap});
  final Function ? onTap;

  @override
  State<BodyInputLogin> createState() => _BodyInputLoginState();
}

class _BodyInputLoginState extends State<BodyInputLogin> {
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const MyProfile()));
              },
              text: "Login",
              background: Colors.deepOrange
            )
          ],
        ),
      ),
    );
  }
}