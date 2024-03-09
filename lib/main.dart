import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:phpcourse/home.dart';
import 'package:phpcourse/login.dart';
import 'package:phpcourse/notes_bloc/getnotes_bloc/getnotes_bloc.dart';
import 'package:phpcourse/notes_bloc/signup_bloc/signup_bloc.dart';
import 'package:phpcourse/signup.dart';

import 'api/api_repo.dart';
import 'notes_bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:  (context) =>  LoginBloc(ApiRepo()),),
        BlocProvider(create: (context)=>SignupBloc(ApiRepo())),
        BlocProvider(create: (context)=>GetnotesBloc(ApiRepo())..add(InitialEvent())),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context)=>Login(),
          '/siqnup': (context)=>Signup(),
          '/home' : (context)=>Home_Page(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home.dart:  MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

