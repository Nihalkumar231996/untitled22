

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled22/loginpage.dart';
 class Bottombar extends StatefulWidget {


  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
   Future<dynamic>logout() async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.remove('email');
     Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>login()));
     }

   @override
   Widget build(BuildContext context) {
     return CurvedNavigationBar(
       backgroundColor: Colors.transparent,
       items: [
         Icon(Icons.person_outline,size: 30),
         Icon(Icons.favorite_outline,size: 30),
         Icon(Icons.home,size: 30,color: Colors.redAccent,),
         Icon(Icons.location_on_outlined,size: 30),
         InkWell(
             onTap: (){
               logout();
             },
             child: Icon(Icons.logout,size: 30)),
       ],
     );
   }
}
