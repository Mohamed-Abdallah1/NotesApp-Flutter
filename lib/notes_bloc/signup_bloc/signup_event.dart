part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpChangeEvent extends SignupEvent{
  final String username;
  final String password;
  final String email;

  SignUpChangeEvent({required this.username , required this.password , required this.email}){}
}
