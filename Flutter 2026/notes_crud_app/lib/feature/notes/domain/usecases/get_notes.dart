import 'package:notes_crud_app/core/usecases/usecase.dart';
import 'package:notes_crud_app/core/result/result.dart';
import 'package:notes_crud_app/core/error/failures.dart';
import 'package:notes_crud_app/feature/notes/domain/entities/note.dart';
import 'package:notes_crud_app/feature/notes/domain/repositories/notes_repository.dart';

class GetNotes implements UseCase<Result<List<Note>>, NoParams> {
  final NotesRepository repository;

  GetNotes(this.repository);

  @override
  Future<Result<List<Note>>> call(NoParams params) async {
    try {
      final notes = await repository.getNotes();
      return Success(notes);
    } catch (e) {
      return FailureResult(ServerFailure(e.toString()));
    }
  }
} 