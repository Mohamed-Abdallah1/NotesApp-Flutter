part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
    @override
    // TODO: implement props
    List<Object?> get props => [];
}
class LoginInitial extends LoginState{

}
class LoadingLoginState extends LoginState{}
class ErrorLoginState extends LoginState{}

class ChangeLoginState extends LoginState{
    ChangeLoginState();
}

