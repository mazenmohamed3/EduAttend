class LoginInputs {
  final String emailOrPhone; // Can be either username or phone number
  final String password;

  LoginInputs({
    required this.emailOrPhone,
    required this.password,
  });

  // From JSON
  factory LoginInputs.fromJson(Map<String, dynamic> json) {
    return LoginInputs(
      emailOrPhone: json['emailOrPhone'],
      password: json['password'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'emailOrPhone': emailOrPhone,
      'password': password,
    };
  }

  // Optional: To String for easy logging/debugging
  @override
  String toString() {
    return 'LoginInputModel{emailOrPhone: $emailOrPhone, password: $password}';
  }
}