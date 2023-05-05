import 'package:flutter/material.dart';


Widget inputWidget({required lableText, required controller, 
required errorText, obscureText}){
  return TextFormField(
    controller: controller,
    obscureText: obscureText ?? false ,
    style:const TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.w500),
    decoration: InputDecoration(
      labelText: lableText,
      errorText: errorText,
      labelStyle:const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.grey)
    ),
  );
}

Widget imageCircleWidget({required image, backgroundcolor}){
  return CircleAvatar(
    radius: 40,
    backgroundColor: backgroundcolor,
    child: Image.asset(image,),
  );
}

Widget textWidget({color, fontSize, fontWeight, text, textAlign}){
  return Text(
    text??"", 
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(color: color??Colors.black, fontSize: fontSize, fontWeight: fontWeight),
  );
}

Widget buttonFormWidget({background,required width,required color,required fontSize,required fontWeight, text, onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: background??Colors.transparent,
        
      ),
      child: Text(
        text??"", 
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight
        ),
      ),
    ),
  );
}

Widget headerForm({textHeader, textChild, textButton}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget(
        text: textHeader,
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      ),

      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget(
            text: textChild,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),

          buttonFormWidget(
            width: 100.0, 
            color: Colors.deepOrange, 
            fontSize: 15.0, 
            fontWeight: FontWeight.w500,
            onTap: (){},
            text: textButton??""
          ),
        ],
      ),
    ],
  );
}

Widget cardDeliveryMethod({onChanged, groupValue}){
  return SizedBox(
    height: 150,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          RadioListTile(
            value: 0,
            groupValue: groupValue,
            onChanged: onChanged,
            title:const Text("Door delivery"),
          ),
          const Divider(color: Color.fromARGB(97, 0, 0, 0), height: 15, thickness: 1, endIndent: 40, indent: 40),
          RadioListTile(
            value: 1,
            groupValue: groupValue,
            onChanged: onChanged,
            title:const Text("Pick up"),
          ),
        ],
      ),
    ),
  );
}

Widget cardRadioIcon({ onChanged,required groupValue,
  icon1, icon2, required radio1, required radio2}){
    return SizedBox(
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            RadioListTile(
              value: 0,
              groupValue: groupValue,
              onChanged: onChanged,
              title:Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(icon1, color: Colors.white, size: 18,),
                  ),
                  const SizedBox(width: 20,),
                  Text(radio1)
                ],
              ),
            ),
            const Divider(color: Color.fromARGB(97, 0, 0, 0), height: 15, thickness: 1, endIndent: 40, indent: 40),
            RadioListTile(
              value: 1,
              groupValue: groupValue,
              onChanged: onChanged,
              title:Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(icon2, size: 18, color: Colors.white,),
                  ),
                  const SizedBox(width: 20,),
                  Text(radio2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget deliveryMethod(){
  return textWidget(
    text: "Delivery method.",
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
}

Widget price({required price}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      textWidget(
        text: "Total",
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
      ),
      textWidget(
        text: price,
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
      ),
    ],
  );
}
