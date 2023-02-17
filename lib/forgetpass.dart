import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled22/Dbhelper.dart';
import 'package:untitled22/Usermodel.dart';
import 'package:untitled22/loginpage.dart';



class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {

  DbHelper? dbHelper;


  final TextEditingController _cpassword=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _mobile=TextEditingController();

  Future<SharedPreferences>_pref=SharedPreferences.getInstance();
  String? name;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    dbHelper=DbHelper();
    final SharedPreferences sp=await  _pref;
    setState((){
      name=sp.getString("email");
      // if(name!=null){
      //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>login()), (route) => false);
      //
      // }


    });
  }
  update()async{

    String password = _password.text;
    String mobile = _mobile.text;
    String cpassword=_cpassword.text;

    if(password==cpassword){

      UserModel user=UserModel(name:null, email:name, password: password, mobile: mobile);
      await dbHelper?. updateUser(user).then((value) {
        if (value == 1) {
          setSp(user).whenComplete(() => {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => login()), (route) => false)

          });

        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error update')));
        }


        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$value')));




      });

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrct Password')));
    }
  }
  Future setSp(UserModel user)async{
    final SharedPreferences sp=await _pref;
    sp.setString("name ", user.name!);
    sp.setString("email ", user.email!);
    sp.setString("password ", user.password!);
    sp.setString("mobile", user.mobile!);

  }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('image/light.png'),fit:BoxFit.cover),),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
              children: [
                Container(padding: EdgeInsets.only(left: 20,top: 70),
                  child: Text('Reset\n Password',style: TextStyle(color: Color(0xff4c505b),fontSize: 60),
                  ),
                ),
                SingleChildScrollView(
                  child:Container(padding:EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.5,
                      right: 70,left: 25),
                    child: Column(
                        children: [
                          TextField(controller: _mobile,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                hintText: 'Mobile no',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                          SizedBox(height: 13,),
                          TextField(controller: _password,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                hintText: 'new password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35))),
                          ),
                          SizedBox(height: 13,),
                          TextField(controller: _cpassword,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                hintText: ' Conform new password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35))),
                          ),

                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [Text('Submit',style: TextStyle(color:Color(0xff4c505b),fontSize: 30,fontWeight: FontWeight.w900),
                            ),
                              CircleAvatar(radius: 30,backgroundColor:Color(0xff4c505b) ,
                                child: IconButton(color: Colors.white,
                                  onPressed: (){

                                    update();

                                  },
                                  icon: Icon(Icons.arrow_forward),
                                ),),

                            ],),


                        ]
                    ),
                  ),
                )
              ]
          )
      ),
    );
  }
}
