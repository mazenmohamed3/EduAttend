import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/exception.dart';
import '../../../domain/model/login_models/login_model.dart';
import '../../services/login_service.dart';

abstract class LoginDatasource {
  Future<LoginModel> loginWithEmail({
    required String email,
    required String password,
  });

  Future<LoginModel> loginWithGoogle();

  Future<LoginModel> loginWithApple();

  Future<LoginModel> loginWithPhoneNumber({required String phoneNumber});
}

class LoginDataSourceImpl implements LoginDatasource {
  final FirebaseAuth _firebaseAuth;
  final LoginService _loginService;

  LoginDataSourceImpl(this._firebaseAuth)
    : _loginService = LoginService(_firebaseAuth);

  @override
  Future<LoginModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.toString());
      return _loginService.userToLoginModel(userCredential.user);
    } on FirebaseAuthException catch (e) {
      throw _loginService.handleFirebaseAuthException(e);
    } on Exception {
      throw FetchDataException();
    }
  }

  @override
  Future<LoginModel> loginWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      UserCredential userCredential = await _firebaseAuth.signInWithProvider(
        googleProvider,
      );
      return _loginService.userToLoginModel(userCredential.user);
    } on FirebaseAuthException catch (e) {
      throw _loginService.handleFirebaseAuthException(e);
    } on Exception {
      throw FetchDataException();
    }
  }

  @override
  Future<LoginModel> loginWithApple() async {
    try {
      final AppleAuthProvider appleProvider = AppleAuthProvider();
      UserCredential userCredential = await _firebaseAuth.signInWithProvider(
        appleProvider,
      );
      return _loginService.userToLoginModel(
        userCredential.user,
      ); // Placeholder to avoid errors
    } on FirebaseAuthException catch (e) {
      throw _loginService.handleFirebaseAuthException(e);
    } on Exception {
      throw FetchDataException();
    }
  }

  @override
  Future<LoginModel> loginWithPhoneNumber({required String phoneNumber}) async {
    try {
      final PhoneAuthCredential? credential = await _loginService
          .verifyPhoneNumber(phoneNumber);

      if (credential != null) {
        UserCredential userCredential = await _firebaseAuth
            .signInWithCredential(credential);
        return _loginService.userToLoginModel(userCredential.user);
      } else {
        throw FetchDataException(); // If no credential was returned, throw an exception
      }
    } on FirebaseAuthException catch (e) {
      throw _loginService.handleFirebaseAuthException(e);
    } on Exception {
      throw FetchDataException();
    }
  }
}
