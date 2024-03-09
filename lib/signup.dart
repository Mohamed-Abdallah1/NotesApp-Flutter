import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:phpcourse/cash_helper.dart';
import 'package:phpcourse/constants/constant.dart';
import 'package:phpcourse/notes_bloc/login_bloc.dart';
import 'package:phpcourse/notes_bloc/signup_bloc/signup_bloc.dart';

import 'constants/app_colors.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final TextEditingController name = TextEditingController(text: "");

  final TextEditingController email = TextEditingController(text: "");

  final TextEditingController pass = TextEditingController(text: "");

  final msg = BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
    if (state is ErrorSignUpState) {
      return const Text(
        "Error Signup ",
        style: TextStyle(color: Colors.red),
      );
    } else {
      return const SizedBox();
    }
  });


  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if(state is SucsessSignUpState){
          Navigator.pushNamed(context, '/');
        }
        // TODO: implement listener
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
                child: BlocBuilder<SignupBloc,SignupState>(
                  builder: (context,state){
                    if(state is LoadingSignupState){
                       return LoadingAnimationWidget.discreteCircle(color: Colors.white,secondRingColor: Colors.yellow, size: 50);
                    }
                    else{
                      return const SizedBox();
                    }
                  },
                )
            ),



            Padding(

              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(

                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Image(
                      alignment: Alignment.topCenter,
                      image: AssetImage('images/mynotes.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Constant_Widget().EmailCustomField(
                      controller: name,
                      suficon: Icons.person_2_outlined,
                      hint: "Username"),
                  const SizedBox(
                    height: 20,
                  ),
                  Constant_Widget().EmailCustomField(
                      controller: email,
                      suficon: Icons.email_outlined,
                      hint: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  Constant_Widget().EmailCustomField(
                      controller: pass,
                      suficon: Icons.password,
                      hint: "Password"),
                  const SizedBox(
                    height: 40,
                  ),
                  Constant_Widget().CustomButton(
                      onpress: () async {

                        if (email.text != "" && name.text != "" &&
                            pass.text != "") {
                          BlocProvider.of<SignupBloc>(context).add(
                              SignUpChangeEvent(username: name.text,
                                  password: pass.text,
                                  email: email.text));
                        }
                      },
                      title: "SignUp")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
