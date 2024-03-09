part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class SubmittedEventLogin extends LoginEvent{
  final String username;
  final String password;

  SubmittedEventLogin({required this.username,required  this.password});
}




