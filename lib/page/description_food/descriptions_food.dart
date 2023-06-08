import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/page/description_food/page_descriptions.dart';
import 'package:food_delivery/page/home/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DescriptionsFood extends StatefulWidget {
  const DescriptionsFood({super.key, });

  @override
  State<DescriptionsFood> createState() => _DescriptionsFoodState();
}

class _DescriptionsFoodState extends State<DescriptionsFood> {
  
  final PageController _controller= PageController();
  bool onLastPage = false;
  bool isFavorite=true;
  late Timer timer;
  int currentIndex = 0;

  @override
  void initState(){
    super.initState();
  
    timer =Timer.periodic(
      const Duration(seconds: 3), (timer) { 
        currentIndex++;
        if (currentIndex >= 3) {
          currentIndex = 0;
          _controller.jumpToPage(0);
        }else{
          _controller.nextPage(
            duration: const Duration(milliseconds: 500), 
            curve: Curves.easeIn
          );
        }
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) => 
              PageDescriptions(
                onPress: (){
                  setState(() {
                    isFavorite=!isFavorite;
                  });
                },
                isFavorite: isFavorite,
              ),
            ),
    
            Container(
              alignment: const Alignment(0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text("skip")
                  ),
              
                  SmoothPageIndicator(
                    controller: _controller, 
                    count: 3,
                    effect: WormEffect(
                      spacing: 16,
                      dotColor: Colors.black,
                      activeDotColor: Colors.teal.shade700
                    ),
                    onDotClicked: (index) => _controller.animateToPage(
                      index, 
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.linear
                    ),
                  ),
              
                  onLastPage ?
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> const PageHome()));
                      },
                      child: const Text("done")
                    )
                    :InkWell(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500), 
                          curve: Curves.easeIn
                        );
                      },
                      child: const Text("next")
                    ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}