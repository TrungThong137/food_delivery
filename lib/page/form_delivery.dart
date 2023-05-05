import 'package:flutter/material.dart';
import 'package:food_delivery/widget/string.dart';
import 'package:food_delivery/widget/widget.dart';

class FormDelivery extends StatefulWidget {
  const FormDelivery({super.key,});

  @override
  State<FormDelivery> createState() => _FormDeliveryState();
}

class _FormDeliveryState extends State<FormDelivery> {

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
            textHeader: "Delivery",
            textChild: "Address details",
            textButton: "change"
          ),

          information(),
          const SizedBox(height: 30,),
          deliveryMethod(),
          const SizedBox(height: 15,),
          cardDeliveryMethod(
            groupValue: delivery,
            onChanged: (value){
              setState(() {
                delivery=value!;
              });
            },
          ),
          
          const SizedBox(height: 40,),
          price(price: "23,000"),

          const SizedBox(height: 40,),
          buttonFormWidget(
            width: 300.0,
            color: Colors.white, 
            fontSize: 18.0, 
            fontWeight: FontWeight.normal,
            background: Colors.deepOrange,
            text: "Proceed to payment"
          )
        ],
      ),
    );
  }

  Widget information(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              text: "Marvis Kparobo",
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
            const Divider(color: Color.fromARGB(97, 0, 0, 0), height: 15, thickness: 1, endIndent: 10),
            textWidget(
              text: "Km 5 refinery road oppsite re public road, effurun, detail state",
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
            const Divider(color: Color.fromARGB(97, 0, 0, 0), height: 15, thickness: 1, endIndent: 10),
            textWidget(
              text: "+234 9011039271",
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}