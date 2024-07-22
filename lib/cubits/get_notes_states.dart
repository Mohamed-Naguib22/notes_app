abstract class GetNoteState {}

class GetNoteLoading extends GetNoteState {}

class GetNoteInitial extends GetNoteState {}

class GetNoteSuccess extends GetNoteState {}

class GetNoteFailure extends GetNoteState {
  final String errorMessage;
  GetNoteFailure({required this.errorMessage});
}
