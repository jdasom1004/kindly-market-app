import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> signIn(String email, String password) async {
    final response = await _supabaseClient.auth.signInWithPassword(email: email, password: password);
    if (response.session == null) {
      throw Exception('Sign in failed');
    }
  }

  Future<void> signUp(String email, String password) async {
    final response = await _supabaseClient.auth.signUp(email: email, password: password);
    if (response.user == null) {
      throw Exception('Sign up failed');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(email);
    } catch (error) {
      throw Exception('Password reset failed: $error');
    }
  }

  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (error) {
      throw Exception('Logout failed: $error');
    }
  }
}
