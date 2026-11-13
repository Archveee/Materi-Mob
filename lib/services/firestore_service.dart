import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class FirestoreService {
  // Referensi ke koleksi 'notes' di Cloud Firestore
  final CollectionReference _notesRef =
      FirebaseFirestore.instance.collection('notes');

  // 1. CREATE: Tambah dokumen baru
  Future<void> addNote(Note note) {
    return _notesRef.add(note.toMap());
  }

  // 2. READ: Mengambil stream data real-time
  Stream<List<Note>> getNotes() {
    return _notesRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromDocument(doc)).toList();
    });
  }

  // 3. UPDATE: Perbarui dokumen berdasarkan Document ID
  Future<void> updateNote(String docId, Note note) {
    return _notesRef.doc(docId).update({
      'title': note.title,
      'content': note.content,
    });
  }

  // 4. DELETE: Hapus dokumen berdasarkan Document ID
  Future<void> deleteNote(String docId) {
    return _notesRef.doc(docId).delete();
  }
}