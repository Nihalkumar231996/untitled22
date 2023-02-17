import 'package:flutter/material.dart';
import 'package:untitled22/loginpage.dart';


import 'Dbhelper.dart';

import 'Usermodel.dart';

class myregisterpage extends StatefulWidget {
  const myregisterpage({Key? key}) : super(key: key);

  @override
  State<myregisterpage> createState() => _myregisterpageState();
}

class _myregisterpageState extends State<myregisterpage> {
  var dbHelper;

  final TextEditingController _name=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _mobile=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dbHelper=DbHelper();
  }

  signup()async {
    String name = _name.text;
    String email = _email.text;
    String password = _password.text;
    String mobile = _mobile.text;

    UserModel userModel = UserModel(
        name: name, email: email, password: password, mobile: mobile);
    await dbHelper.saveData(userModel).then((userData) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Save Sucessfully')));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

    });
  }




  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('image/pen.png'),fit:BoxFit.cover),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(padding: EdgeInsets.only(left: 20,top: 70),
              child: Text('Registration\n Page',style: TextStyle(color: Color(0xff4c505b),fontSize: 50),
              ),
            ),
            SingleChildScrollView(
              child:Container(padding:EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.4,
                  right: 70,left: 25),
                child: Column(
                  children: [
                    TextField(controller: _name,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    SizedBox(height: 13,),
                    TextField(controller:_email,

                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35))),
                    ),
                    SizedBox(height: 10,),
                    TextField(obscureText: true,
                      controller:_password,

                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35))),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: _mobile,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'mobile no',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [Text('Submit',style: TextStyle(color:Color(0xff4c505b),fontSize: 30,fontWeight: FontWeight.w900),
                      ),
                        CircleAvatar(radius: 30,backgroundColor:Color(0xff4c505b) ,
                          child: IconButton(color: Colors.white,
                            onPressed: (){

                              signup();

                            },
                            icon: Icon(Icons.arrow_forward),
                          ),),

                      ],),

                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}


