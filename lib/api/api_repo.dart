
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phpcourse/cash_helper.dart';
import 'package:phpcourse/model/notes.dart';

class ApiRepo{
   Future<bool> logapi(String user , String pass)async{
    var url = Uri.parse("http://notesapp.coinly-app.com/mohamed/signin.php");
    var headres = {
      'Accept': '*/*',
    };
    var req = http.MultipartRequest("POST",url);
    req.headers.addAll(headres);
    req.fields.addAll(
        {
          'email':user,
          'pass':pass,
        }

    );
    var res = await req.send();
    var response = await http.Response.fromStream(res);
    if(res.statusCode==200){
      print(response.body);

      if(response.body.contains("id")){
        //print(json.decode(response.body)[0]["id"]);
        Cash_Helper.setusr_id(json.decode(response.body)[0]["id"]);
        Cash_Helper.set_user(json.decode(response.body)[0]["name"]);
        return true;
      }
      return false;
    }
    return false;

  }


  Future<bool> sign_api({required String name , required String pass , required String email}) async {
    var url = Uri.parse("https://notesapp.coinly-app.com/mohamed/signup.php");
    var header = {"Accept": "*/*"};
    var content = {"name": name, "pass": pass, "email": email};
    var req = http.MultipartRequest("POST", url);
    req.headers.addAll(header);
    req.fields.addAll(content);
    var ressponseee = await req.send();
    var res = await http.Response.fromStream(ressponseee);
    if(ressponseee.statusCode == 200){
      if(res.body.contains("done")){
        return true;
      }
      else{
        return false;
      }


    }
    else{
      return false;
    }
  }


   Future<List<Notes>> getnotes(int id)async{
     List<Notes> nn = [];

     var url = Uri.parse("http://notesapp.coinly-app.com/mohamed/selectnote.php");
     var headers = {"Accept": "*/*"};
     var field = {"user_id" : id.toString()};
     var request = http.MultipartRequest("POST",url);
     request.headers.addAll(headers);
     request.fields.addAll(field);
     var response = await request.send();
     var res = await http.Response.fromStream(response);
     if(res.statusCode ==200){
       if(res.body.contains("id")){
         List<dynamic> convertjstolist= json.decode(res.body);
         nn = convertjstolist.map((data)=>Notes.fromJson(data)).toList();
         print(nn);

         return nn;

       }
       else{
         return nn;
       }

     }
     else{
       return nn;
     }






   }
   
   Future<bool>add_note(int user_id , String note_name , String note_content)async{
     var url = Uri.parse("http://notesapp.coinly-app.com/mohamed/addnote.php");
     var headers = {"Accept":"*/*"};
     var fields = {
       "user_id":user_id.toString(),
       "note_content":note_content,
       "note_name":note_name,
     };
     var req = http.MultipartRequest("POST",url);
     req.headers.addAll(headers);
     req.fields.addAll(fields);
     var res = await req.send();
     var response = await http.Response.fromStream(res);
     print(response.body);
     if(response.statusCode==200){
       if(response.body.contains("done")){
         return true;
       }
       else{
         return false;
       }
     }
     else{
       return false;
     }
   }

   Future<bool>delete_note(int note_id)async{
     var url = Uri.parse("http://notesapp.coinly-app.com/mohamed/deletenote.php");
     var header = {"Accept":"*/*"};
     var field = {"note_id":note_id.toString()};
     var req = http.MultipartRequest("POST",url);
     req.headers.addAll(header);
     req.fields.addAll(field);
     var resp = await req.send();
     var response = await http.Response.fromStream(resp);
     if(response.statusCode == 200){
       if(response.body.contains("done")){
         return true;
       }
       else{
         return false;
       }
     }
     else{
       return false;
     }
     

   }
   
   Future<bool>update_note(int note_id , String note_content , String note_name)async{
     var url = Uri.parse("http://notesapp.coinly-app.com/mohamed/updatenote.php");
     var header = {"Accept":"*/*"};
     var field = {
       "note_id":note_id.toString(),
       "notes_content":note_content,
       "notes_name":note_name,
     };
     var req = http.MultipartRequest("POST",url);
     req.headers.addAll(header);
     req.fields.addAll(field);
     var resp = await req.send();
     var response = await http.Response.fromStream(resp);
     print(response.body);
     if(response.statusCode==200){
       if(response.body.contains("done")){
         return true;
       }
       else{
         return false;
       }
     }
     else{
       return false;
     }
     
   }




}

