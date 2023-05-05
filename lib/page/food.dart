import 'package:flutter/material.dart';
import 'package:food_delivery/widget/widget.dart';

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(240, 255, 255, 255),
      body: GridView.count(
        padding: const EdgeInsets.only(top: 100, left: 28, right: 28, bottom: 70),
        crossAxisCount: 2,
        childAspectRatio: 1/1.6,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        
        children: [
          cardFood(
            text: "Veggie tomato mix",
            price: "N1,900",
            image: "assets/veggie.png"
          ),
          
          cardFood(
            text: "Egg and cucmber",
            price: "N1,900",
            image: "assets/EggAndRice.png",
            baseLine: 230.0
          ),

          cardFood(
            text: "Fried chicken",
            price: "N1,900",
            image: "assets/FriedChicken.png",
          ),

          cardFood(
            text: "Moi-moi and ekpa.",
            price: "N1,900",
            image: "assets/RiceChicken.png",
            baseLine: 230.0
          ),

          cardFood(
            text: "Veggie tomato mix",
            price: "N1,900",
            image: "assets/veggie.png",
          ),

          cardFood(
            text: "Egg and cucmber",
            price: "N1,900",
            image: "assets/EggAndRice.png",
            baseLine: 230.0
          ),
        ],
      ),
    );
  }
  Widget cardFood({text, price, image, baseLine}){
    return Baseline(
      baseline: baseLine?? 180,
      baselineType: TextBaseline.alphabetic,
      child: Stack(
        alignment: Alignment.center,
        children:[
          Card(
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80), 
                topRight: Radius.circular(80),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  textWidget(
                    text: text,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 12,),
                  textWidget(
                    color: Colors.deepOrange,
                    text: price,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset(image)
          )
        ] 
      ),
    );
  }
}