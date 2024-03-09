
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:phpcourse/api/api_repo.dart';
import 'package:phpcourse/cash_helper.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

   var repo = ApiRepo();





  LoginBloc(this.repo) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {

      // TODO: implement event handler

      //  print(username);
      //  print(password);
     // bool ch = await repo.logapi(username, password);
       if(event is SubmittedEventLogin){

         // if(ch){
         //   print("true");
         // }
         emit(LoadingLoginState());
         var ch = await repo.logapi(event.username, event.password);
         if(ch){


           emit(ChangeLoginState());
           print("sucsess");

         }
         else{
           emit(ErrorLoginState());
           print("error");
         }




       }

        //bool ch = true;

    });
  }


}

