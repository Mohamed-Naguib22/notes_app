import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xffAC3931);
  
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    note.color = color.value;
    
    try {
      var notesBox = Hive.box<NoteModel>("notes");
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } 
    catch(ex){
      emit(AddNoteFailure(errorMessage: ex.toString()));
    }
  }
}