part of 'getnotes_bloc.dart';

@immutable
abstract class GetnotesState {}

class GetnotesInitial extends GetnotesState {}

class LoadingGetnotesState extends GetnotesState{}

class ErrorGetnotesState extends GetnotesState{}



class SucsessGetnotesState extends GetnotesState{
  final List<Notes> notes;

  SucsessGetnotesState({required this.notes});
}
