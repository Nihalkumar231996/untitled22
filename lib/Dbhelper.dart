import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io'as io;
import 'package:path/path.dart';

import 'Usermodel.dart';

class DbHelper{

  static Database ? _db;
  static const String DB_NAME="test.db";
  static const String TABLE_USER="user";
  static const int DB_VERSION=1;




  static const String col1="name";
  static const String col2="email";
  static const String col3="pass";
  static const String col4="mob";


  Future<Database> get db async{
    if(_db!=null){
      return _db!;
    }
    _db=await initiDb();

    return _db!;


  }

  initiDb() async{
    io.Directory documentDirectory=await getApplicationDocumentsDirectory();
    String path=join(documentDirectory.path,DB_NAME);

    var db=await openDatabase(path,version: DB_VERSION,onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async{
    await db.execute("create table $TABLE_USER("

        "$col1 TEXT,"
        "$col2 TEXT,"
        "$col3 TEXT,"
        "$col4 TEXT,"
        "PRIMARY KEY ($col4)"

        ")");
  }
  Future<int>saveData(UserModel user)async{
    var dbClient= await db;

    var res=await dbClient.insert(TABLE_USER, user.tomap());
    return res;
  }
  Future<UserModel?>getLoginUser(String email,String password)async{
    var dbClient= await db;
    var res=await dbClient.rawQuery(" Select * from  $TABLE_USER  where $col2='$email' And  $col3='$password' ");
    if (res.length >0) {

      return UserModel.fromMap(res.first);
    }
    return null;
  }

  Future<int>updateUser(UserModel user)async{
    var dbClient= await db;
    var res=await dbClient.update(TABLE_USER, user.tomap(),where: '$col4=?',whereArgs: [user.mobile]);
    return res;


  }


}



