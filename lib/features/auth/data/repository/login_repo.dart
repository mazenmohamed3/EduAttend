import 'package:mobile_app_project/features/auth/data/services/login_service.dart';
import '../../../../core/enums/login_user_type.dart';
import '../../domain/model/login_models/login_model.dart';
import '../datasources/remote/login_remote_datasources.dart';
import '../../domain/repository/login_repo.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({required this.datasource});

  // Login with email and password
  @override
  Future<LoginModel> loginWithEmail({
    required String email,
    required String password,
    required LoginUserType userType,
  }) async {
    try {
      final loginModel = await datasource.loginWithEmail(
        email: email,
        password: password,
        userType: userType,
      );

      // Save user data to secure storage
      await LoginService.saveUserDataToSecureStorage(loginModel);

      return loginModel;
    } catch (e) {
      rethrow;
    }
  }

  // Login with Google
  @override
  Future<LoginModel> loginWithGoogle() async {
    try {
      final loginModel = await datasource.loginWithGoogle();

      // Save user data to secure storage
      await LoginService.saveUserDataToSecureStorage(loginModel);

      return loginModel;
    } catch (e) {
      rethrow;
    }
  }

  // Login with Apple
  @override
  Future<LoginModel> loginWithApple() async {
    try {
      final loginModel = await datasource.loginWithApple();

      // Save user data to secure storage
      await LoginService.saveUserDataToSecureStorage(loginModel);

      return loginModel;
    } catch (e) {
      rethrow;
    }
  }

  // Login with Phone Number
  @override
  Future<LoginModel> loginWithPhoneNumber({required String phoneNumber}) async {
    try {
      final loginModel = await datasource.loginWithPhoneNumber(
        phoneNumber: phoneNumber,
      );

      // Save user data to secure storage
      await LoginService.saveUserDataToSecureStorage(loginModel);

      return loginModel;
    } catch (e) {
      rethrow;
    }
  }
}
