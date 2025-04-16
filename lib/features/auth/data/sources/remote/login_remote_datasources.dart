import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app_project/core/generated/dataconnect/connector/db.dart';
import '../../../../../core/enums/login_user_type.dart';
import '../../../../../core/errors/exception.dart';
import '../../../domain/model/login_models/login_model.dart';
import '../../services/login_service.dart';

abstract class LoginDatasource {
  Future<LoginModel> loginWithEmail({
    required String email,
    required String password,
    required LoginUserType userType,

  });

  Future<LoginModel> loginWithGoogle();

  Future<LoginModel> loginWithApple();

  Future<LoginModel> loginWithPhoneNumber({required String phoneNumber});
}

class LoginDataSourceImpl implements LoginDatasource {
  final FirebaseAuth _firebaseAuth;
  final LoginService _loginService;
  final DbConnector _dbConnector;

  LoginDataSourceImpl(this._firebaseAuth, this._dbConnector)
    : _loginService = LoginService(_firebaseAuth);

  @override
  Future<LoginModel> loginWithEmail({
    required String email,
    required String password,
    required LoginUserType userType,
  }) async {
    try {
      late List<dynamic> userList;

      if (userType == LoginUserType.student) {
        final result = await _dbConnector.listStudents().email(email).execute();
        userList = result.data.students;
      } else {
        final result = await _dbConnector.listInstructors().email(email).execute();
        userList = result.data.instructors;
      }

      // Validate user presence
      if (userList.isEmpty || !userList.any((user) => user.email == email)) {
        throw NotFoundException("User not found");
      }

      // Firebase Authentication
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return _loginService.userToLoginModel(userCredential.user);
    } on FirebaseAuthException catch (e) {
      throw _loginService.handleFirebaseAuthException(e);
    } on Exception catch (e){
      throw FetchDataException(e.toString());
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
