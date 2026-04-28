import 'package:flutter_demo/services/auth/auth.dart';
import 'package:flutter_demo/services/service_locator.dart';

class UserLoginManager {
  final _authService = getIt<Auth>();

  Future<bool> login({required String email, required String password}) async {
    return await _authService.login(email: email, password: password);
  }

  /// Registers a new user.
  Future<bool> signUp({required String email, required String password}) async {
    return await _authService.signup(email: email, password: password);
  }

  /// Logs out the current user.
  Future<void> logout() async {
    await _authService.logout();
  }

  /// Checks if a user is currently logged in.
  Future<bool> isLoggedIn() async {
    return _authService.isLoggedIn();
  }
}
