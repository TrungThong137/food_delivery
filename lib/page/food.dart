import 'package:flutter/material.dart';
import 'package:food_delivery/widget/widget.dart';

class Food extends StatelessWidget {
  Food({super.key,});

  final List _allFood=[
    {"text": "Veggie tomato mix",
    "price": "N1,900", "image": "assets/veggie.png"},
    {"text": "Egg and cucmber",
    "price": "N1,900", "image": "assets/EggAndRice.png"},
    {"text": "Fried chicken",
    "price": "N1,900", "image": "assets/FriedChicken.png"},
    {"text": "Moi-moi and ekpa.",
    "price": "N1,900", "image": "assets/RiceChicken.png"},
    {"text": "Veggie tomato mix",
    "price": "N1,900", "image": "assets/veggie.png"},
    {"text": "Egg and cucmber",
    "price": "N1,900", "image": "assets/EggAndRice.png"},
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color.fromARGB(240, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  style:const TextStyle(
                    fontSize: 25
                  ),
                  decoration:const InputDecoration(
                    hintText: "search",
                    prefixIcon: Icon(
                      Icons.arrow_back_ios_new, 
                      color: Colors.black, size: 18,
                    ),
                    border: InputBorder.none,
                  ),

                ),
              ),
              const SizedBox(height: 10,),
              Container(
                height: 635,
                decoration:const BoxDecoration(
                  color:Color.fromARGB(162, 255, 255, 255),
                  borderRadius:  BorderRadius.all(Radius.circular(30))
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    textWidget(
                      text: "Found 6 results",
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1/1.45,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          
                        ),
                        padding: const EdgeInsets.only(top: 20, left: 28, right: 28, bottom: 70),
                        
                        itemCount: _allFood.length,
                        itemBuilder: (context, index){
                          if(index%2==0){
                            return cardFood(
                              text: _allFood[index]["text"],
                              price: _allFood[index]["price"],
                              image: _allFood[index]["image"]
                            );
                          }else{
                            return cardFood(
                              text: _allFood[index]["text"],
                              price: _allFood[index]["price"],
                              image: _allFood[index]["image"],
                              baseLine: 230.0
                            );
                          }
                        }
                          
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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