import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled22/home_page.dart';
import 'package:untitled22/register.dart';



import 'Dbhelper.dart';
import 'Forgetpass.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> {
  final _email=TextEditingController();
  final _password=TextEditingController();
  var dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DbHelper();
    dd(context);

  }
  void  dd(BuildContext context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('email');
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(stringValue!)));


    if(stringValue!=null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homepage()));
      }
  //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(stringValue!)));

  }

  Login()async{
    String email=_email.text;
    String password=_password.text;

    if(email.isEmpty && password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('plz enter email and password')));
    }
    else{
      await dbHelper.getLoginUser( email, password).then((userdata)async{
        if(userdata!=null){

           SharedPreferences pref = await SharedPreferences.getInstance();
           pref.setString('email', email);

          Navigator.push(context, MaterialPageRoute(builder: (context){
            return homepage();
          }));


        }
        else{ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Email and password')));
        }
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('image/background.png'),fit:BoxFit.cover),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(padding: EdgeInsets.only(left: 20,top: 70),
              child: Text('Welcome\nBack',style: TextStyle(color: Color(0xff4c505b),fontSize: 60),
              ),
            ),
            SingleChildScrollView(
              child:Container(padding:EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.5,
                  right: 70,left: 25),
                child: Column(
                  children: [
                    TextField(controller: _email,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    SizedBox(height: 13,),
                    TextField(controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35))),
                    ),
                    SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [Text('sign In',style: TextStyle(color:Color(0xff4c505b),fontSize: 40,fontWeight: FontWeight.w900),
                      ),
                        CircleAvatar(radius: 30,backgroundColor:Color(0xff4c505b) ,
                          child: IconButton(color: Colors.white,
                            onPressed: (){

                              Login();
                            },
                            icon: Icon(Icons.arrow_forward),
                          ),),

                      ],),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> myregisterpage()));
                        },
                            child:Text('Sign Up',style: TextStyle(
                                decoration: TextDecoration.underline,fontSize: 25,fontWeight:FontWeight.w100,color: Color(0xff4c505b)
                            ),
                            )),
                        TextButton(onPressed:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>forget()));
                        }, child:Text('Forget Password',style: TextStyle(
                            decoration: TextDecoration.underline,fontSize: 15,fontWeight:FontWeight.w800,color: Color(0xff4c505b)
                        ),
                        )),

                      ],)
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
