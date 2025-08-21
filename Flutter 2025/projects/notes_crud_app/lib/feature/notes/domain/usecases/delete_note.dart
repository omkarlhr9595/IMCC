import 'package:notes_crud_app/core/usecases/usecase.dart';
import 'package:notes_crud_app/core/result/result.dart';
import 'package:notes_crud_app/core/error/failures.dart';
import 'package:notes_crud_app/feature/notes/domain/repositories/notes_repository.dart';

class DeleteNote implements UseCase<Result<void>, String> {
  final NotesRepository repository;

  DeleteNote(this.repository);

  @override
  Future<Result<void>> call(String noteId) async {
    try {
      await repository.deleteNote(noteId);
      return const Success(null);
    } catch (e) {
      return FailureResult(ServerFailure(e.toString()));
    }
  }
} 