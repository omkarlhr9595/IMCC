import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_crud_app/feature/notes/domain/entities/note.dart';
import 'package:notes_crud_app/feature/notes/presentation/bloc/notes_bloc.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note? note; // null for creating new note

  const NoteDetailScreen({super.key, this.note});

  // Factory constructor to handle named route arguments
  static NoteDetailScreen fromArguments(Object? arguments) {
    if (arguments is Note) {
      return NoteDetailScreen(note: arguments);
    }
    return const NoteDetailScreen();
  }

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(text: widget.note?.content ?? '');
    _isEditing = widget.note == null;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveNote() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Title and content cannot be empty'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (widget.note == null) {
      // Create new note
      context.read<NotesBloc>().add(
            CreateNote(
              title: title,
              content: content,
            ),
          );
    } else {
      // Update existing note
      final updatedNote = widget.note!.copyWith(
        title: title,
        content: content,
        updatedAt: DateTime.now(),
      );
      context.read<NotesBloc>().add(UpdateNote(updatedNote));
    }

    Navigator.of(context).pop();
  }

  void _deleteNote() {
    if (widget.note?.id != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Note'),
          content: const Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<NotesBloc>().add(DeleteNote(widget.note!.id!));
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNewNote = widget.note == null;
    final title = isNewNote ? 'New Note' : 'Edit Note';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          if (!isNewNote) ...[
            IconButton(
              onPressed: _toggleEdit,
              icon: Icon(_isEditing ? Icons.visibility : Icons.edit),
            ),
            IconButton(
              onPressed: _deleteNote,
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Title field
            TextField(
              controller: _titleController,
              enabled: _isEditing,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: 'Note title',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 16),

            // Content field
            Expanded(
              child: TextField(
                controller: _contentController,
                enabled: _isEditing,
                maxLines: null,
                expands: true,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  hintText: 'Write your note here...',
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
              ),
            ),

            // Save button
            if (_isEditing) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveNote,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(isNewNote ? 'Create Note' : 'Save Changes'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
