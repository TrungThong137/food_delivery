import 'package:flutter/material.dart';
import 'package:food_delivery/widget/string.dart';
import 'package:food_delivery/widget/widget.dart';

class FormPayment extends StatefulWidget {
  const FormPayment({super.key});

  @override
  State<FormPayment> createState() => _FormPaymentState();
}

class _FormPaymentState extends State<FormPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(235, 255, 255, 255),
      appBar: AppBar(
        leading:const Padding(
          padding:  EdgeInsets.only(left: 30),
          child: Icon(Icons.arrow_back_ios,),
        ),
        backgroundColor:const Color.fromARGB(194, 255, 255, 255),
        foregroundColor: Colors.black,
        elevation: 0.01,
        title:const Text("Checkout"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        children: [
          headerForm(
            textHeader: "Payment",
            textChild: "Payment method"
          ),

          cardRadioIcon(
            onChanged:  (value){
              setState(() {
                cartIcon=value!;
              });
            }, 
            groupValue: cartIcon,
            radio1: "Card", radio2: "Bank account",
            icon1: Icons.cast_rounded ,
            icon2: Icons.account_balance 
          ),
          const SizedBox(height: 20,),

          
          deliveryMethod(),
          const SizedBox(height: 10,),

          cardDeliveryMethod(
            groupValue: delivery,
            onChanged: (value){
              setState(() {
                delivery=value!;
              });
            },
          ),

          const SizedBox(height: 30,),
          price(price: "23,000"),

          const SizedBox(height: 50,),
          buttonFormWidget(
            width: 300.0, 
            color: Colors.white, 
            fontSize: 20.0, 
            fontWeight: FontWeight.bold,
            background: Colors.deepOrange,
            text: "Proceed to payment",
          )
        ],
      ),
    );
  }
  
}