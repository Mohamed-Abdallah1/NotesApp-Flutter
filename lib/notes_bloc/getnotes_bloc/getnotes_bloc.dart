import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:phpcourse/api/api_repo.dart';
import 'package:phpcourse/cash_helper.dart';
import 'package:phpcourse/model/notes.dart';

part 'getnotes_event.dart';
part 'getnotes_state.dart';

class GetnotesBloc extends Bloc<GetnotesEvent, GetnotesState> {
  var repo = ApiRepo();
  GetnotesBloc(this.repo) : super(GetnotesInitial()) {
    on<GetnotesEvent>((event, emit) async {

      if(event is InitialEvent){
        emit(LoadingGetnotesState());


        List<Notes> list = await repo.getnotes(await Cash_Helper.get_id() );
       if(list.length>0){
         emit(SucsessGetnotesState(notes: list));
       }
       else{
         emit(ErrorGetnotesState());
       }
      }
      else if(event is AddnoteEvent){

         await repo.add_note(event.user_id, event.note_name, event.note_content);

      }
      else if(event is DeleteNoteEvent){
        await repo.delete_note(event.note_id);
      }
      else if(event is UpdateNoteEvent){
        await repo.update_note(event.note_id, event.note_content, event.note_name);
      }



      // TODO: implement event handler
    });
  }
}
