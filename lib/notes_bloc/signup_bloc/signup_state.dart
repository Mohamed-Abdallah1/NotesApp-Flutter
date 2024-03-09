part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class LoadingSignupState extends SignupState{}
class ErrorSignUpState extends SignupState{}
class SucsessSignUpState extends SignupState{}

