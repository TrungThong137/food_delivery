import 'package:flutter/material.dart';
import 'package:food_delivery/widget/widget.dart';

class PageDescriptions extends StatelessWidget {
  
  const PageDescriptions({super.key, this.onPress, this.isFavorite});
  final bool ? isFavorite;
  final Function ? onPress;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(244, 244, 244, 1),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(right: 40),
                    onPressed: (){},
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black,)
                  ),
                  IconButton(
                    onPressed: (){
                      onPress!();
                    }, 
                    icon: isFavorite??true ? 
                      const Icon(
                        Icons.favorite_border, 
                        size: 30,
                      )
                      :const Icon(
                        Icons.favorite, 
                        size: 30, 
                        color: Color.fromRGBO(250, 74, 12, 1),
                      )
                  )
                ],
              ),
          
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Image.asset("assets/largest_veggie.png"),
              ),
          
              const Text(
                "Delivery info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(154,154,156, 1)
                ),
              ),
              const SizedBox(height: 20,),
          
              const Text(
                "Return policy",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(154,154,156, 1)
                ),
              ),
          
              const SizedBox(height: 40,),
          
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: buttonFormWidget(
                  width: 300.0, 
                  color: Colors.white, 
                  fontSize: 18.0, 
                  fontWeight: FontWeight.normal,
                  text: "Add to cart",
                  background:const Color.fromRGBO(250, 74, 12, 1)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}