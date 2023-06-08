import 'package:flutter/material.dart';
import 'package:food_delivery/firebase/firebase_auth.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool isActive=false;
  int isIndex=-1;
  final FireAuth _fireAuth=FireAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color.fromRGBO(250, 74, 12, 1),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Abu Anwar",
                profession: "YouTuber",
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70)
                  ,
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Divider(
                  height: 1.2,
                  color: Colors.white,
                ),
              ),

              slideMenuTitle(
                icon: Icons.home_outlined,
                text: "Home",
                index: 0
              ),

              slideMenuTitle(
                icon: Icons.search,
                text: "Search",
                index: 1
              ),

              slideMenuTitle(
                icon: Icons.star_outline,
                text: "Favorites",
                index: 2
              ),

              slideMenuTitle(
                icon: Icons.favorite_outline,
                text: "Heart",
                index: 3
              ),

              const SizedBox(height: 100,),
              slideMenuTitle(
                icon: Icons.logout_outlined,
                text: 'Log out',
                index: 4
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget slideMenuTitle({icon, text, ontap,required index}){
    return InkWell(
      onTap: (){
        if(index==4){
          setState(() {
            isIndex=index;
            _fireAuth.signOut();
          });
          Navigator.pop(context);
        }
        setState(() {
          isIndex=index;
        });
      },
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            height: 56,
            width: isIndex==index ? 288 : 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF6792FF),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            )
          ),
          ListTile(
            leading: SizedBox(
              height: 34,
              width: 34,
              child: Icon(icon, color: Colors.white,),
            ),
            title: Text(
              text??"",
            style: const TextStyle(color: Colors.white),
            )
          ),
        ]
      ),
    );
  }
}


class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key, required this.name, 
    required this.profession,
  });

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(Icons.person_outline, color: Colors.white,),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white
        ),
      ),

      subtitle: Text(
        profession,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}