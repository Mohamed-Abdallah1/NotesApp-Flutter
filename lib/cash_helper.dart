import 'package:shared_preferences/shared_preferences.dart';

class Cash_Helper{


  static const  _key_id = "keyid";
  static const _key_user = "key_user";


  static Future remove_all()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(_key_id);
    sharedPreferences.remove(_key_user);
  }

  static Future set_user(String user)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_key_user, user);
  }

  static Future<String> get_user()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getString(_key_user)!;
  }

  static Future setusr_id(int id)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(_key_id, id);

  }
  static Future<int> get_id() async {
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    return sharedPreferences.getInt(_key_id)!;
  }








}