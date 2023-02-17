class UserModel{
  String ?name;
  String ?email;
  String ?password;
  String ?mobile;

  UserModel({

    required this.name,
    required this.email,
    required this.password,
    required this.mobile,

  } );
  Map<String,dynamic>tomap() {
    var map = <String, dynamic>{
      'name':name,
      'email':email,
      'pass':password,
      'mob':mobile,



    };

    return map;
  }
  UserModel.fromMap(Map<String,dynamic>map){
    name=map['name'];
    email=map['email'];
    password=map['pass'];
    mobile=map['mob'];



  }



}