import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream untuk memantau apakah user sedang login atau logout secara real-time
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Mengambil data user yang sedang aktif
  User? get currentUser => _auth.currentUser;

  // 1. LOGIN: Masuk dengan Email & Password
  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // 2. REGISTER: Mendaftarkan akun baru
  Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // 3. LOGOUT: Keluar dari akun
  Future<void> signOut() async {
    await _auth.signOut();
  }
}