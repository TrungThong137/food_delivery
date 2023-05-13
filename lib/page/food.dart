import 'package:flutter/material.dart';
import 'package:food_delivery/widget/string.dart';

class Food extends StatelessWidget {
  const Food({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color.fromRGBO(242,242,242,1),
        body: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style:const TextStyle(
                  fontSize: 25,
                ),
                decoration:const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18,),
                  border: InputBorder.none
                ),
              ),
            ),
            Container(
              height: 635,
              width: double.infinity,
              decoration:const BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 1),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  const Text(
                    "Found 6 results",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1/1.45,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20
                      ),
                      padding: const EdgeInsets.only(top: 20, left: 28, right: 28, bottom: 70),
                      itemCount: allFood.length,
                      itemBuilder: (context, index) {
                        if(index%2==0){
                          return cardFood(index);
                        }else{
                          return cardFood(index, baseline: 230.0);
                        }
                      },
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardFood(int index, {baseline}){
    return Baseline(
      baseline: baseline?? 180,
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
                bottomRight: Radius.circular(25)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    allFood[index]["text"],
                    style:const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    allFood[index]["price"],
                    style:const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(250, 74, 12, 1)
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset(allFood[index]["image"])
          )
        ]
      ),
    );
  }
}