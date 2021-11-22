import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {
  late SharedPreferences sharedPreferences;

   init() async{
    sharedPreferences = await  SharedPreferences.getInstance();
  }

  Future<bool> putData( String key, bool value)async{
     return await sharedPreferences.setBool(key, value);
  }

  bool? getData( String key){
     return  sharedPreferences.getBool(key);
  }


}