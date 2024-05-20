import 'package:supabase_flutter/supabase_flutter.dart';

class CommentService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> createComment(String postId, String content) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('Not authenticated');
    }

    final response = await _supabaseClient
        .from('comments')
        .insert({
      'post_id': postId,
      'user_id': user.id,
      'content': content,
    });

    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }
}
