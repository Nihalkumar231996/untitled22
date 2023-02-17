import 'package:flutter/material.dart';
import 'package:untitled22/Home_bottom_bar.dart';
import 'package:untitled22/Postscreen.dart';

import 'homeappbar.dart';

class scren1 extends StatelessWidget {

  List<String>category=["Red Fort",
    "Lotous temple",
    "Humayun Tomb",
    "Qutub Minar",
    "India gate"
      ];
  List<String> home=[
    "Best Palce",
    "Most Visited",
    "Favourites",
    "Hotels",
    "Restaurants",
  ];
  // const scren1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(preferredSize: Size.fromHeight(200),
      child:HomeAppBar(),
    ),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(children: [
          Expanded(child: Container(
            height: 700,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 120,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index){
                            return InkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(
                                    builder: (context)=>PostScreen()));
                              },
                              child: Container(
                                width: 170,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),

                                  image: DecorationImage(image: AssetImage("image/city${index+1}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.8,


                                  )
                                ),
                                child: Column(children: [
                                  Container(alignment: Alignment.topRight,
                                  child: Icon(Icons.bookmark_border_outlined,color: Colors.white,
                                  size:20,
                                  ),
                                  ),
                                  Spacer(),
                                  Container(alignment: Alignment.bottomLeft,
                                    child: Text(category[index],style: TextStyle(color: Colors.white,
                                    fontSize: 16,fontWeight: FontWeight.w900),

                                    ),
                                  )
                                ],),

                              ),
                            );
                          }
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(padding: EdgeInsets.all(8),
                      child: Row(children: [
                        for(int i=0;i<5;i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration:BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            boxShadow:[
                              BoxShadow(color: Colors.black26,blurRadius: 4)
                            ]
                          ),
                          child: Text(home[i],style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),


                        ),

                      ],),

                    ),
                  ),
                  SizedBox(height: 10,),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder:(BuildContext context,int index){
                  return Padding(
                    padding:EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>PostScreen()));
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage('image/city${index+1}.jpg'),
                            fit: BoxFit.cover
                          )),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(category[index],style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.w600),),
                          Icon(Icons.more_vert,size: 30),
                        
                        
                      ],),
                      ),
                      SizedBox(height: 5),
                      Row(children: [
                        Icon(Icons.star,
                        color: Colors.amber,
                        size: 20,),
                        Text('4.5',style: TextStyle(fontWeight: FontWeight.w500),)
                      ],)
                    ],
                  ),
                    
                  );
                  })
                ],
              ),
            ),
          ))
        ],),
      ),
    ),
      bottomNavigationBar: Bottombar()


    );

  }
}
