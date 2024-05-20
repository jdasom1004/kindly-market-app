import 'package:supabase_flutter/supabase_flutter.dart';

class ChatService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> sendMessage(String receiverId, String content) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('Not authenticated');
    }

    final response = await _supabaseClient
        .from('messages')
        .insert({
      'sender_id': user.id,
      'receiver_id': receiverId,
      'content': content,
    });

    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  Future<List<Map<String, dynamic>>> getMessages(String chatId) async {
    try {
      final response = await _supabaseClient
          .from('messages')
          .select()
          .eq('chat_id', chatId)
          .order('created_at', ascending: true);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch messages: $e');
    }
  }
}
