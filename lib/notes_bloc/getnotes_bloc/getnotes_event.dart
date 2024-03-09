part of 'getnotes_bloc.dart';

@immutable
abstract class GetnotesEvent {}

class InitialEvent extends GetnotesEvent{}

class AddnoteEvent extends GetnotesEvent{
  final String note_name;
  final String note_content;
  final int user_id;

  AddnoteEvent({required this.note_name, required this.note_content, required this.user_id});
}

class DeleteNoteEvent extends GetnotesEvent{
  final int note_id ;

  DeleteNoteEvent({required this.note_id});
}

class UpdateNoteEvent extends GetnotesEvent{
  final int note_id;
  final String note_name;
  final String note_content;

  UpdateNoteEvent({required this.note_id, required this.note_name, required this.note_content});
}

