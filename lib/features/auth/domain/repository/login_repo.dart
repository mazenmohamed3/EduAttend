import '../model/login_models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> loginWithEmail({
    required String email,
    required String password,
  });
  Future<LoginModel> loginWithGoogle();
  Future<LoginModel> loginWithApple();
  Future<LoginModel> loginWithPhoneNumber({required String phoneNumber});
}