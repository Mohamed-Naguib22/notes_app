abstract class AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errorMessage;
  AddNoteFailure({required this.errorMessage});
}
