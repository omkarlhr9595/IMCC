import 'package:notes_crud_app/core/usecases/usecase.dart';
import 'package:notes_crud_app/core/result/result.dart';
import 'package:notes_crud_app/core/error/failures.dart';
import 'package:notes_crud_app/feature/notes/domain/entities/note.dart';
import 'package:notes_crud_app/feature/notes/domain/repositories/notes_repository.dart';

class UpdateNote implements UseCase<Result<void>, Note> {
  final NotesRepository repository;

  UpdateNote(this.repository);

  @override
  Future<Result<void>> call(Note note) async {
    try {
      await repository.updateNote(note);
      return const Success(null);
    } catch (e) {
      return FailureResult(ServerFailure(e.toString()));
    }
  }
} 