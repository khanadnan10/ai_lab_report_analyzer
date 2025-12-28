import 'package:ai_lab_report_analyzer/model/user_model.dart';
import 'package:ai_lab_report_analyzer/repository/remote_database.dart';
import 'package:ai_lab_report_analyzer/utils/snack_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends ChangeNotifier {
  final RemoteDatabase _remoteDatabase;

  AuthController(this._remoteDatabase);

  /// LOADING
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// USER
  UserModel? user;

  /// CURRENT USER SESSION
  Session? get currentUserSession => _remoteDatabase.currentUserSession;

  /// REGISTER USER
  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      if ([name, email, password].any((e) {
        return e.isEmpty;
      })) {
        showSnackBar('Please fill all fields');

        _isLoading = false;
        notifyListeners();
        return;
      }

      final registeredUser = await _remoteDatabase.registerUser(
        name: name,
        email: email,
        password: password,
      );
      if (registeredUser.id.isNotEmpty) {
        showSnackBar("Your account has been created successfully!");
      }
      user = registeredUser;
      notifyListeners();
    } catch (e) {
      user = null;
      showSnackBar(e.toString());
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
