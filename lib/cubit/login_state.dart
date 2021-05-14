
import 'package:cinema_ethiopia/model/MovieModel.dart';
import 'package:cinema_ethiopia/model/UserModel.dart';
import 'package:equatable/equatable.dart';


abstract class LoginState extends Equatable {}

class InitialState extends LoginState {
  InitialState();

  @override
  List<Object> get props => [];
}

class LoggingInState extends LoginState {

  @override
  List<Object> get props => [];
}

class LoggedInState extends LoginState {
  LoggedInState(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user.email,user.password];
}

class LogErrorState extends LoginState {
  @override
  List<Object> get props => [];
}
class LogOutState extends LoginState{
  @override
  List<Object> get props => [];
}