import 'package:mobile_app_project/core/enums/login_user_type.dart';

class LoginInputs {
  final String emailOrPhone;
  final String password;
  final LoginUserType userType;

  LoginInputs({
    required this.emailOrPhone,
    required this.password,
    required this.userType,
  });

  @override
  String toString() {
    return 'LoginInputs{emailOrPhone: $emailOrPhone, password: $password, userType: $userType}';
  }
}