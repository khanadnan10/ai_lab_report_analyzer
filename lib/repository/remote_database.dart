import 'package:ai_lab_report_analyzer/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///SUPABASE
class RemoteDatabase {
  final SupabaseClient _client;

  RemoteDatabase(this._client);

  /// USER CURRENT SESSION
  Session? get currentUserSession => _client.auth.currentSession;

  /// REGISTER USER
  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );
      if (response.user == null) {
        throw Exception('User is null!');
      }
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// LOGIN USER
  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw Exception('User is null!');
      }
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// GET PROFILE
  Future getProfile() async {
    throw UnimplementedError('GET PROFILE NOT  IMPLEMENTED');
  }

  /// ANALYZE REPORT
  Future analyzeReport() async {
    throw UnimplementedError('REPORT ANALYZER NOT  IMPLEMENTED');
  }
}
