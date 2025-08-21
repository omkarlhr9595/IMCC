import 'package:notes_crud_app/core/usecases/usecase.dart';
import 'package:notes_crud_app/core/result/result.dart';
import 'package:notes_crud_app/core/error/failures.dart';
import 'package:notes_crud_app/feature/notes/domain/entities/note.dart';
import 'package:notes_crud_app/feature/notes/domain/repositories/notes_repository.dart';

class CreateNote implements UseCase<Result<String>, Note> {
  final NotesRepository repository;

  CreateNote(this.repository);

  @override
  Future<Result<String>> call(Note note) async {
    try {
      final noteId = await repository.createNote(note);
      return Success(noteId);
    } catch (e) {
      return FailureResult(ServerFailure(e.toString()));
    }
  }
} 