import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile_app_project/features/auth/domain/model/login_models/login_model.dart';
import 'package:mobile_app_project/features/auth/domain/repository/login_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/base_usecase.dart';
import '../../../../../core/usecases/no_param.dart';

class LoginWithAppleUsecase extends BaseUseCase<LoginModel, NoParams> {
  final LoginRepository _authRepository;

  LoginWithAppleUsecase(this._authRepository);

  @override
  Future<Either<Failure, LoginModel>> call(NoParams params) async {
    try {
      final result = await _authRepository.loginWithApple();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}