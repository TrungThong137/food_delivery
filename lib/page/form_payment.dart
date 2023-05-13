import 'package:flutter/material.dart';
import 'package:food_delivery/widget/string.dart';
import 'package:food_delivery/widget/widget.dart';

class FormPayment extends StatefulWidget {
  const FormPayment({super.key});

  @override
  State<FormPayment> createState() => _FormPaymentState();
}

class _FormPaymentState extends State<FormPayment> {

  late ProgrammingLanguage selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(244,244,244,1),
      appBar: AppBar(
        leading:const Padding(
          padding:  EdgeInsets.only(left: 30),
          child: Icon(Icons.arrow_back_ios,),
        ),
        backgroundColor:const Color.fromRGBO(244,244,244,1),
        foregroundColor: Colors.black,
        elevation: 0.01,
        title:const Text("Checkout"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 40),
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
            onTap: (){
              showMyAlertDialog(context);
            }
          )
        ],
      ),
    );
  }

  showMyAlertDialog(BuildContext context) {
    ProgrammingLanguage mainLand = ProgrammingLanguage("DELIVERY TO MAINLAND", "N1000 - N2000");
    ProgrammingLanguage isLand = ProgrammingLanguage("DELIVERY TO ISLAND", "N2000 - N3000");

    // Create SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Please note'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      
      children: <Widget>[
        SimpleDialogOption(
            onPressed: () {
              // Close and return value
              Navigator.pop(context, mainLand);
            },
            child: ListTile(
              title: Text(mainLand.name, style: const TextStyle(fontSize: 20, color: Color.fromARGB(125, 0, 0, 0))),
              subtitle: Text(mainLand.price, style: const TextStyle(fontSize: 20, color: Colors.black)),
            ),
        ),

        const Divider(height: 1.2, color: Colors.black, endIndent: 40, indent: 40),

        SimpleDialogOption(
          onPressed: () {
            // Close and return value
            Navigator.pop(context, isLand);
          },
          child:  ListTile(
            title: Text(isLand.name, style: const TextStyle(fontSize: 20, color: Color.fromARGB(125, 0, 0, 0)),),
            subtitle: Text(isLand.price, style: const TextStyle(fontSize: 20, color: Colors.black),),
          ),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            buttonFormWidget(
              width: 150.0, 
              color: const Color.fromARGB(136, 0, 0, 0), 
              fontSize: 20.0, 
              fontWeight: FontWeight.bold,
              text: "Cancel",
            ),

            buttonFormWidget(
              width: 150.0, 
              color: Colors.white, 
              fontSize: 20.0, 
              fontWeight: FontWeight.bold,
              text: "Proceed",
              background: const Color.fromRGBO(250, 74, 12, 1)
            )
          ],
        )

      ],
    );

    // Call showDialog function to show dialog.
    Future futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }
    );

    futureValue.then( (language) => {
      setState(() {
        selectedLanguage = language;
      })
    });
  }

}

class ProgrammingLanguage {
  String name;
  String price;

  ProgrammingLanguage(this.name, this.price) ;
}