import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile_app_project/features/auth/domain/model/login_models/login_model.dart';
import 'package:mobile_app_project/features/auth/domain/repository/login_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/base_usecase.dart';
import '../../model/login_models/login_inputs.dart';

class LoginWithEmailUsecase extends BaseUseCase<LoginModel, LoginInputs> {
  final LoginRepository _authRepository;

  LoginWithEmailUsecase(this._authRepository);

  @override
  Future<Either<Failure, LoginModel>> call(LoginInputs params) async {
    try {
      final result = await _authRepository.loginWithEmail(
          email: params.emailOrPhone,
          password: params.password,
          userType: params.userType,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}