import 'package:flutter/material.dart';
import 'package:untitled22/PostAppBar.dart';

import 'Post_Bottom_Bar.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/city1.jpg'),
          fit: BoxFit.cover,
          opacity: 0.7,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(),
        ),
        bottomNavigationBar: PostBottomBar(),
      ),

    );
  }
}
