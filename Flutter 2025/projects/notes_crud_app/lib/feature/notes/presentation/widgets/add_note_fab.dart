import 'package:flutter/material.dart';
import 'package:notes_crud_app/feature/notes/presentation/screens/note_detail_screen.dart';

class AddNoteFab extends StatelessWidget {
  const AddNoteFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
                        onPressed: () {
                    Navigator.of(context).pushNamed('/note-detail');
                  },
      icon: const Icon(Icons.add),
      label: const Text('New Note'),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
} 