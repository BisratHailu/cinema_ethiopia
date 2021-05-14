import 'package:cinema_ethiopia/cubit/movie_state.dart';
import 'package:cinema_ethiopia/model/RequestTicket.dart';
import 'package:cinema_ethiopia/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({this.repository}) : super(InitialState()) {
    getTrendingMovies();
  }

  final MovieRepository repository;

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await repository.getMovies();

      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
  void requestTicket(RequestTicket ticket) async{
    try{
      emit(LoadingState());
      final request = await repository.requestTicket(ticket.toJson());
      emit(LoadedState(request));
    }catch(e){
      print(e);
      emit(ErrorState());
    }
  }
}