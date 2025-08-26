import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

//dart run build_runner build

@JsonSerializable()
class NoteModel extends Equatable {
  final String? id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPinned;

  const NoteModel({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.isPinned = false,
  });

  // Factory method for creating a new note
  factory NoteModel.create({
    required String title,
    required String content,
    List<String> tags = const [],
  }) {
    final now = DateTime.now();
    return NoteModel(
      title: title,
      content: content,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  factory NoteModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NoteModel(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      isPinned: data['isPinned'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'content': content,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'isPinned': isPinned,
    };
  }

  NoteModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPinned,
    List<String>? tags,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPinned: isPinned ?? this.isPinned,
    );
  }

  @override
  List<Object?> get props => [id, title, content, createdAt, updatedAt, isPinned];

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, isPinned: $isPinned)';
  }
}
