import 'package:flutter/material.dart';
import 'package:food_delivery/widget/string.dart';
import 'package:food_delivery/widget/widget.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.onTap, this.onTapCloseMenu});
  final Function ? onTap;
  final Function ? onTapCloseMenu;

  Widget inputSearch(){
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: TextField(
        style:const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),
        cursorColor: Colors.black,
        
        decoration: InputDecoration(
          filled: true,
          fillColor:const Color.fromRGBO(239, 238, 238, 1),
          hintText: "Search",
          prefixIcon:const Icon(
            Icons.search, color: Colors.black, 
            size: 30,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:const BorderSide(color: Color.fromRGBO(239, 238, 238, 1), width: 1)
          )
        ),
      ),
    );
  }

  Widget cardFood(int index){
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(width: 230,),
        Container(
          width: 210,
          padding: const EdgeInsets.only(top: 40),
          child: Card(
            elevation: 0.8,
            shadowColor: Colors.white.withOpacity(0.8),
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    allFood[index]["text"],
                    style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15,),
                  Text(allFood[index]["price"],
                    style:const TextStyle(
                      fontSize: 16,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w700
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Image.asset(allFood[index]["image"])
        )
      ]
    );
  }

  Widget listFoods(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: allFood.length,
      itemBuilder: (context, index) => cardFood(index),
    );
  }

  Widget header(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding:const EdgeInsets.only(right:15),
          onPressed: (){
            onTapCloseMenu!();
          }, 
          icon:const Icon(Icons.menu, size: 30,)
        ),
        IconButton(
          padding:const EdgeInsets.only(right: 40),
          onPressed: (){}, 
          icon:const Icon(Icons.shopping_cart_outlined, size: 30, color: Color.fromRGBO(0, 0, 0, 0.219),)
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 50, bottom: 40),
        child: Column(
          children: [
            header(),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: textWidget(
                text: "Delicious food for you",
                fontSize: 33.0,
                fontWeight: FontWeight.bold,    
              ),
            ),
            const SizedBox(height: 25,),
            inputSearch(),
            const SizedBox(height: 25,),
            const TabBar( 
              tabs:  [
                Tab(text: "Foods"),
                Tab(text: "Drinks",),
                Tab(text: "Snack",),
                Tab(text: "Sauch",),
              ],
              labelColor: Color.fromRGBO(250, 74, 12, 1),
              labelStyle: TextStyle(
                fontSize: 18
              ),
              isScrollable: true,
              indicatorWeight: 3.2,
              unselectedLabelColor: Color.fromRGBO(154, 154, 157, 1),
              labelPadding: EdgeInsets.only( left: 20, right: 20,),
            ),
            const SizedBox(height: 15,),
            TextButton(
              style: TextButton.styleFrom(
                padding:const EdgeInsets.only(left: 220)
              ),
              onPressed: (){
                onTap!();
              },
              child:const Text("see more",
                style: TextStyle(
                  color: Color.fromRGBO(250, 74, 12, 1),
                  fontWeight: FontWeight.w400
                ),
              ),
            ),

            SizedBox(
              height: 280,
              child: TabBarView(
                children: [
                  listFoods(),
                  listFoods(),
                  const Center(child: Text("Bike")),
                  const Center(child: Text("Boat")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}