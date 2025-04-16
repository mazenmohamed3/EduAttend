import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../core/database/Secure Storage/secure_storage_helper.dart';
import '../../domain/model/login_models/login_model.dart';

class LoginService {
  final FirebaseAuth firebaseAuth;

  LoginService(this.firebaseAuth);

  // Function to verify the phone number and retrieve the credential
  Future<PhoneAuthCredential?> verifyPhoneNumber(String phoneNumber) async {
    Completer<PhoneAuthCredential> completer =
        Completer<PhoneAuthCredential>(); // To handle async completion

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        // Automatically sign in if verified immediately
        completer.complete(phoneAuthCredential); // Complete with the credential
      },
      verificationFailed: (FirebaseAuthException e) {
        completer.completeError(
          handleFirebaseAuthException(e),
        ); // Complete with error if failed
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode =
            await getSmsCodeFromUser(); // Prompt user for the SMS code
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        completer.complete(phoneAuthCredential); // Complete with the credential
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completer.completeError(
          TimeoutException("OTP auto retrieval timed out"),
        );
      },
    );

    return completer.future; // Returns the completed Future
  }

  // Helper function to prompt the user to input the SMS code
  Future<String> getSmsCodeFromUser() async {
    // You should implement custom logic here for the user to input SMS code
    return '123456'; // Placeholder: Simulated SMS code for now
  }

  // Helper function to convert the Firebase User to a LoginModel
  LoginModel userToLoginModel(User? user) {
    return LoginModel(
      data: Data(
        username: user?.email,
        id: user?.uid.hashCode,
        subjects: [], // Can be customized if needed
      ),
    );
  }

  // Function to handle FirebaseAuthException and map them to custom exceptions
  ServerException handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return UnauthorizedException("Invalid email or password.");
      case 'user-disabled':
        return UnauthorizedException("User account has been disabled.");
      case 'too-many-requests':
        return ConflictException("Too many login attempts. Try again later.");
      case 'network-request-failed':
        return NoInternetConnectionException();
      case 'email-already-in-use':
        return ConflictException("Email is already in use.");
      case 'weak-password':
        return BadRequestException("Weak password.");
      default:
        return InternalServerErrorException("An unknown error occurred.");
    }
  }

  static Future<void> saveUserDataToSecureStorage(LoginModel loginModel) async {
    await SecureStorageHelper.put(key: 'username', value: loginModel.data!.username);
    await SecureStorageHelper.put(key: 'id', value: loginModel.data!.id.toString());
    await SecureStorageHelper.put(key: 'subjects', value: loginModel.data!.subjects?.join(",") ?? "");
  }
}
