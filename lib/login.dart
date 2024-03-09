import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:phpcourse/constants/app_colors.dart';
import 'package:phpcourse/constants/constant.dart';
import 'package:phpcourse/notes_bloc/login_bloc.dart';
import 'package:phpcourse/signup.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  // void logapi()async{
  final TextEditingController user = TextEditingController();

  final TextEditingController pass = TextEditingController();

  final msg = BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
     if (state is ErrorLoginState) {
      return Text(
        "Error Login Email or Password",
        style: TextStyle(color: Colors.red),
      );
    } else {
      return SizedBox();
    }
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ChangeLoginState) {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
          Navigator.pushNamed(context, '/home');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [


            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft, //begin of the gradient color
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    main_color,
                    Colors.black,
                    Colors.deepPurpleAccent
                  ])),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/2,
              right: MediaQuery.of(context).size.width/2.2,
              child: BlocBuilder<LoginBloc,LoginState>(builder: (context,state){
                if(state is LoadingLoginState){
                  return LoadingAnimationWidget.discreteCircle(color: Colors.white,secondRingColor: Colors.yellow, size: 50);
                }
                else{
                  return SizedBox();
                }
              }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: const Image(
                      alignment: Alignment.topCenter,
                      image: AssetImage('images/mynotes.png'),
                    ),
                  ),
                  msg,
                  SizedBox(
                    height: 60,
                  ),
                  Constant_Widget().EmailCustomField(
                    controller: user,
                    suficon: Icons.email_outlined,
                    hint: "email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Constant_Widget().PasswordCustomField(
                    secure: true,
                    controller: pass,
                    suficon: Icons.password,
                    hint: "password",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Constant_Widget().CustomButton(
                    title: "Login",
                    onpress: () {
                      if (user.text != "" && pass.text != "") {
                        BlocProvider.of<LoginBloc>(context).add(
                            SubmittedEventLogin(
                                username: user.text, password: pass.text));
                      } else {}
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Dont have account ?",style: TextStyle(color: Colors.white),textAlign: TextAlign.right,),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/siqnup');
                          },
                          child: Text(


                            "SignUp",
                            style: TextStyle(color: Colors.deepPurple[200]),
                            textAlign: TextAlign.left,

                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
