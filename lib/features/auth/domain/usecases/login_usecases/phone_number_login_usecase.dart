import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile_app_project/features/auth/domain/model/login_models/login_model.dart';
import 'package:mobile_app_project/features/auth/domain/repository/login_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/base_usecase.dart';

class LoginWithPhoneNumberUsecase extends BaseUseCase<LoginModel, String> {
  final LoginRepository _authRepository;

  LoginWithPhoneNumberUsecase(this._authRepository);

  @override
  Future<Either<Failure, LoginModel>> call(String phoneNumber) async {
    try {
      final result = await _authRepository.loginWithPhoneNumber(phoneNumber: phoneNumber);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}