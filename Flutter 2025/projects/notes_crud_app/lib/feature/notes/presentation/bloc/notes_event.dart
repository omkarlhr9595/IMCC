part of 'notes_bloc.dart';

sealed class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class LoadNotes extends NotesEvent {}

class CreateNote extends NotesEvent {
  final String title;
  final String content;
  final List<String> tags;

  const CreateNote({
    required this.title,
    required this.content,
    this.tags = const [],
  });

  @override
  List<Object> get props => [title, content, tags];
}

class UpdateNote extends NotesEvent {
  final Note note;

  const UpdateNote(this.note);

  @override
  List<Object> get props => [note];
}

class DeleteNote extends NotesEvent {
  final String noteId;

  const DeleteNote(this.noteId);

  @override
  List<Object> get props => [noteId];
}

class SearchNotes extends NotesEvent {
  final String query;

  const SearchNotes(this.query);

  @override
  List<Object> get props => [query];
}

class ToggleNotePin extends NotesEvent {
  final String noteId;
  final bool isPinned;

  const ToggleNotePin({
    required this.noteId,
    required this.isPinned,
  });

  @override
  List<Object> get props => [noteId, isPinned];
}
