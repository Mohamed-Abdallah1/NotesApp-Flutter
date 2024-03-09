import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phpcourse/constants/app_colors.dart';

class Constant_Widget {



  Widget EmailCustomField(
      {required TextEditingController controller,
      required IconData suficon,
      required String hint,
     }){
    return TextFormField(

      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType:TextInputType.emailAddress,


      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white,width: 2)
        ),
        labelText: hint,

        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: Icon(suficon),
        suffixIconColor: Colors.white,
      ),

      // initialValue: "username",

    );
  }

  Widget PasswordCustomField(
      {required TextEditingController controller,
        required IconData suficon,
        required String hint,
        required bool secure}){

    return TextFormField(

      controller: controller,
      style: const TextStyle(color: Colors.white),
      obscureText: secure,


      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white,width: 2)
        ),
        labelText: hint,


        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(suficon),
          onPressed: (){


          },
        ),
        suffixIconColor: Colors.white,
      ),

      // initialValue: "username",

    );
  }










  Widget CustomButton({required  Function() onpress , required String title}) {
    return Container(
      width: 120,
      height: 50,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(main_color),






        ),
       onPressed: onpress,
        child:  Text(title,style: const TextStyle(color: Colors.white,fontSize: 20),),


      ),
    );
  }
}
