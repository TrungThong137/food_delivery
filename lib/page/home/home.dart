

import 'package:flutter/material.dart';
import 'package:food_delivery/page/description_food/descriptions_food.dart';
import 'package:food_delivery/page/home/page_home.dart';
import 'package:food_delivery/page/home/side_menu.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with SingleTickerProviderStateMixin{

  int selectedIndex = 0;
  bool isMenuClose=false;
  final Widget _myEmails = const MyEmails();
  final Widget _myProfile = const MyProfile();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor:const Color.fromRGBO(242,242,242,1),
          body: getBody(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(242,242,242,1),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme:const IconThemeData(
              color: Color.fromRGBO(250, 74, 12, 1),
              size: 30,
              shadows: [
                Shadow(
                  color: Color.fromRGBO(250, 75, 12, 0.532),
                  blurRadius: 60.0,
                )],
            ),
            unselectedIconTheme: const IconThemeData(
              color: Color.fromRGBO(173, 173, 175, 1),
              size: 27,
            ),
            items:const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:"Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label:"Home",
              ),
            ],
            onTap: (int index) {
              setState(() {
                selectedIndex=index;
              });
            },
          ),
        ),
      ),
    );
  }
  
  Widget getBody( )  {
    if(selectedIndex == 0) {
      return Stack(
        children:[
          Positioned(
            width: isMenuClose? 288:0,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu()
          ),
          Transform.translate(
            offset: Offset(isMenuClose? 288:0, 0),
            child: Home(
              onTapCloseMenu: (){
                setState(() {
                  isMenuClose=!isMenuClose;
                });
              },

              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const DescriptionsFood()));
              },
            ),
          )
        ] 
      );
    } else if(selectedIndex==1) {
      return _myEmails;
    } else {
      return _myProfile;
    }
  }
}

class MyEmails extends StatelessWidget {
  const MyEmails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Emails"));
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile"));
  }
}

