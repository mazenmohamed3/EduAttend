import 'package:bloc/bloc.dart';
import 'package:mobile_app_project/features/auth/domain/model/login_models/login_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/enums/login_user_type.dart';
import '../../../domain/model/login_models/login_inputs.dart';
import '../../../domain/usecases/login_usecases/email_login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailUsecase loginWithEmailUsecase;

  LoginCubit({required this.loginWithEmailUsecase}) : super(LoginInitial());

  Future<void> loginWithEmail({
    required String emailOrPhone,
    required String password,
    required LoginUserType userType,
  }) async {
    emit(LoginLoading());

    final result = await loginWithEmailUsecase.call(
      LoginInputs(
        emailOrPhone: emailOrPhone,
        password: password,
        userType: userType,
      ),
    );

    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (loginModel) => emit(LoginSuccess(loginModel: loginModel)),
    );
  }
}
