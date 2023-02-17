import 'package:flutter/material.dart';

class PostBottomBar extends StatelessWidget {
  const PostBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      padding: EdgeInsets.only(top: 20,left: 20,right: 20),
      decoration: BoxDecoration(
        color: Color(0XFFEDF2F6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      ),
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [Text('Red Fort,New Delhi',style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300
              ),),
                Row(children: [Icon(Icons.star,color: Colors.amber,size: 25,),
                Text('4.5',style: TextStyle(fontWeight: FontWeight.w600),)
                
                ],)
              
              ],
              ),
              SizedBox(height: 25,),
              Text('The Red Fort or Lal Qila (Hindustani: [laːlqiːlaː]) is a historic fort in Old Delhi, Delhi in India that served as the main residence of the Mughal Emperors. '
                  'Emperor Shah Jahan commissioned construction of'
                  ' the Red Fort on 12 May 1638, when he decided to shift his capital from Agra to Delhi.'
                  ' Originally red and white, its design is credited to architect Ustad Ahmad Lahori, '
                  'who also constructed the Taj Mahal. The fort represents the peak in Mughal architecture under Shah Jahan and combines '
                  'Persianate palace architecture with Indian traditions.',style: TextStyle(
                color: Colors.black54,fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20,),
              Row(children: [
                Padding(padding: EdgeInsets.only(right: 5),
                child: Expanded(
                  child: ClipRRect(borderRadius: BorderRadius.circular(15),
                  child: Image.asset('image/city2.jpg',fit: BoxFit.cover,width: 120,height: 90,),
                  ),
                ),
                ),
                Padding(padding: EdgeInsets.only(right: 5),
                  child: Expanded(
                    child: ClipRRect(borderRadius: BorderRadius.circular(15),
                      child: Image.asset('image/city3.jpg',fit: BoxFit.cover,width: 120,height: 90,),
                    ),
                  ),
                ),
                Expanded(child: Container(alignment: Alignment.center,width: 120,height: 90,
                margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage('image/city1.jpg'),
                    fit: BoxFit.cover,opacity: 0.4),
                  ),
                  child: Text('10+',style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                ),)
              ],),
              SizedBox(height: 15),
              Container(height: 80,
              child: Row(mainAxisAlignment:
                MainAxisAlignment.spaceAround,
              children:[
                Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black26,blurRadius: 4),
                  ]
                ),
                child: Icon(Icons.bookmark_outline,size: 40,),
                ),
                Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                    )
                  ]
                ),
                child: Text('Book Now',style: TextStyle(color: Colors.white,
                fontSize: 26,fontWeight: FontWeight.w500),),
                )
              ],),)
            ],
          ),
          )
        ],
      ),
    );
  }
}
