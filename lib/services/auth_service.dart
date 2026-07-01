import '../dummy/dummy_data.dart';
import '../models/user.dart';

class AuthResult {
  const AuthResult({required this.success, this.message, this.user});

  final bool success;
  final String? message;
  final User? user;
}

class AuthService {
  static AuthResult login({
    required String username,
    required String password,
  }) {
    final trimmedUser = username.trim();
    final trimmedPass = password.trim();

    if (trimmedUser.isEmpty || trimmedPass.isEmpty) {
      return const AuthResult(
        success: false,
        message: 'Username dan password harus diisi',
      );
    }

    if (trimmedUser == DummyData.demoUsername &&
        trimmedPass == DummyData.demoPassword) {
      return AuthResult(success: true, user: DummyData.currentUser);
    }

    return const AuthResult(
      success: false,
      message: 'Username atau password salah',
    );
  }

  static AuthResult loginWithGoogle() {
    return AuthResult(success: true, user: DummyData.currentUser);
  }
}
