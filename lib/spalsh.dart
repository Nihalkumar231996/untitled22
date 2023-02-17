import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled22/loginpage.dart';



class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
        return login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child:Lottie.network('https://assets5.lottiefiles.com/packages/lf20_hy4txm7l.json'),);

  }
}
