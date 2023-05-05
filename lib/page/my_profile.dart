import 'package:flutter/material.dart';
import 'package:food_delivery/widget/widget.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(247, 255, 255, 255),
      appBar: AppBar(
        leading:const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18, ),
        backgroundColor:const Color.fromARGB(182, 255, 255, 255),
        elevation: 0.01,
        shadowColor: Colors.white.withOpacity(0.5),
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: ListView(
          physics:const BouncingScrollPhysics(),
          children: [
            headerForm(
              textButton: "change",
              textChild: "Personal details",
              textHeader: "My profile"
            ),
           
            profile(),

            listItem(text: "Orders"),
            listItem(text: "Pending reviews"),
            listItem(text: "Faq"),
            listItem(text: "Help"),
            const SizedBox(height: 60,),
            buttonFormWidget(
              width: 400.0, 
              color: Colors.white, 
              fontSize: 20.0, 
              fontWeight: FontWeight.w500,
              background: Colors.deepOrange,
              text: "Update",
              onTap: (){}
            )
          ],
        ),
      ),
    );
  }

  Widget listItem({text}){
    return Card(
      margin:const EdgeInsets.only(top: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 0.5,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: ListTile(
        title: Text(text),
        trailing:const Icon(Icons.arrow_forward_ios, size: 20,)
      ),
      
    );
  }

  Widget informationPerson(){
    return SizedBox(
      width: 190,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            text: "Marvis Ighedosa",
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10,),
          textWidget(
            text: "Dosamarvis@gmail.com",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color:const Color.fromARGB(97, 0, 0, 0)
          ),
          const Divider(color: Color.fromARGB(97, 0, 0, 0), height: 10, thickness: 1, endIndent: 10),
          textWidget(
            text: "+234 9011039271",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color:const Color.fromARGB(97, 0, 0, 0)
          ),
          const Divider(color: Color.fromARGB(97, 0, 0, 0), height: 10, thickness: 1, endIndent: 10),
          textWidget(
            text: "No 15 uti street off ovie palace road effurun delta state",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color:const Color.fromARGB(97, 0, 0, 0)
          ),
        ],
      ),
    );
  }

  Widget profile(){
    return Center(  
      child: SizedBox(  
        width: 400,  
        height: 200,   
        child: Card(  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0),  
          ),  
          color: Colors.white,  
          elevation: 0.2,  
          shadowColor: Colors.grey.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/avata.png"),
                const SizedBox(width: 13,),
                informationPerson()
              ],
            ),
          )
        ),  
      )  
    );  
  }
}