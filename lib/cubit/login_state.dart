
import 'package:cinema_ethiopia/model/MovieModel.dart';
import 'package:cinema_ethiopia/model/UserModel.dart';
import 'package:equatable/equatable.dart';


abstract class LoginState extends Equatable {}

class InitialState extends LoginState {
  InitialState();

  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {

  @override
  List<Object> get props => [];
}

class LoadedState extends LoginState {
  LoadedState(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user.email,user.password];
}

class ErrorState extends LoginState {
  @override
  List<Object> get props => [];
}