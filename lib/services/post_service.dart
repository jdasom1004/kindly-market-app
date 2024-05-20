import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class PostService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> createPost(String title, String content, String? mediaUrl) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('Not authenticated');
    }

    final response = await _supabaseClient
        .from('posts')
        .insert({
      'user_id': user.id,
      'title': title,
      'content': content,
      'media_url': mediaUrl,
    });
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  Future<String> uploadMedia(File file) async {
    try {
      final response = await _supabaseClient.storage
          .from('media')
          .upload(file.path, file);
      return response;
    } catch (error) {
      throw Exception('Upload failed: $error');
    }
  }
}
