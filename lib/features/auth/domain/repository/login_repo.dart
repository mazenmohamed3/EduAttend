import '../../../../core/enums/login_user_type.dart';
import '../model/login_models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> loginWithEmail({
    required String email,
    required String password,
    required LoginUserType userType,
  });
  Future<LoginModel> loginWithGoogle();
  Future<LoginModel> loginWithApple();
  Future<LoginModel> loginWithPhoneNumber({required String phoneNumber});
}