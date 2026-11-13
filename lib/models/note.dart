import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? id;
  final String title;
  final String content;

  Note({
    this.id,
    required this.title,
    required this.content,
  });

  // Konversi dari Object ke Map (Disimpan ke Firestore)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': FieldValue.serverTimestamp(), // Untuk pengurutan data
    };
  }

  // Konversi dari DocumentSnapshot (Firestore) ke Object Note
  factory Note.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Note(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
    );
  }
}