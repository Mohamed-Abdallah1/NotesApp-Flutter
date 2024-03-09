import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:phpcourse/api/api_repo.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  var repo = ApiRepo();

  SignupBloc(this.repo) : super(SignupInitial())  {
    on<SignupEvent>((event, emit) async {
      if(event is SignUpChangeEvent){
        emit(LoadingSignupState());
        bool ch = await repo.sign_api(name: event.username, pass: event.password, email: event.email);
        if(ch){
          emit(SucsessSignUpState());
        }
        else{
          emit(ErrorSignUpState());
        }
      }
      // TODO: implement event handler
    });
  }
}
