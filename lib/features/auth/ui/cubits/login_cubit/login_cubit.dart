import 'package:bloc/bloc.dart';
import 'package:mobile_app_project/features/auth/domain/model/login_models/login_model.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/login_models/login_inputs.dart';
import '../../../domain/usecases/login_usecases/email_login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailUsecase loginWithEmailUsecase;

  LoginCubit({required this.loginWithEmailUsecase}) : super(LoginInitial());

  Future<void> loginWithEmail(String email, String password) async {
    emit(LoginLoading());

    final result = await loginWithEmailUsecase.call(
      LoginInputs(emailOrPhone: email, password: password),
    );

    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (loginModel) => emit(LoginSuccess(loginModel: loginModel)),
    );
  }
}