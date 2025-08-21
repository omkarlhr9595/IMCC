import 'package:notes_crud_app/core/usecases/usecase.dart';
import 'package:notes_crud_app/core/result/result.dart';
import 'package:notes_crud_app/core/error/failures.dart';
import 'package:notes_crud_app/feature/notes/domain/entities/note.dart';
import 'package:notes_crud_app/feature/notes/domain/repositories/notes_repository.dart';

class SearchNotes implements UseCase<Result<List<Note>>, String> {
  final NotesRepository repository;

  SearchNotes(this.repository);

  @override
  Future<Result<List<Note>>> call(String query) async {
    try {
      final notes = await repository.searchNotes(query);
      return Success(notes);
    } catch (e) {
      return FailureResult(ServerFailure(e.toString()));
    }
  }
} 