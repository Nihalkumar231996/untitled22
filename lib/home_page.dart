import 'package:flutter/material.dart';
import 'package:untitled22/screen1.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(decoration: BoxDecoration(borderRadius: BorderRadius.zero,
        image: DecorationImage(
          image: AssetImage('image/world.jpg'),
          
          fit: BoxFit.cover,
          opacity: 120,

        )),
        child: SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(vertical: 100,horizontal: 10),
            child: Column(
              children: [Text('Tourism',style: TextStyle(color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),),
             SizedBox(height: 5,),
             Text('New Delhi',style: TextStyle(color: Colors.black,
             fontSize: 20,
               fontWeight: FontWeight.w800,
               letterSpacing: 1.5,

             ),),
             SizedBox(height: 20,),
             Text('Delhi, officially the National Capital Territory of Delhi,'
                  'is a city and a union territory of India containing New Delhi, the capital of India.',
               style: TextStyle(color: Colors.black,
               fontSize: 20,
               fontWeight: FontWeight.bold,
               letterSpacing: 1.2,
               ),
             ) ,
             SizedBox(height: 10),
             InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>scren1(),
             ));
               },
             child: Ink(padding: EdgeInsets.all(10),
             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),

               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Icon(Icons.arrow_forward_ios,
                   color: Colors.black54,
                   size: 70,),
                 ],
               ),
             ),

             ),


              ],
            ),

          ),
        ),
      ),

    );
  }
}
