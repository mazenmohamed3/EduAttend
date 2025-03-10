import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mobile_app_project/features/auth/domain/repository/login_repo.dart';

import '../../features/auth/data/datasources/remote/login_remote_datasources.dart';
import '../../features/auth/data/repository/login_repo.dart';
import '../../features/auth/domain/usecases/login_usecases/email_login_usecase.dart';
import '../../features/auth/ui/cubits/login_cubit/login_cubit.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    sl.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance
    );

    await initLoginModule();
  }

  static Future<void> initLoginModule() async {
    sl.registerLazySingleton<LoginDatasource>(
      () => LoginDataSourceImpl(sl()),
    );

    sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(datasource: sl()),
    );

    sl.registerLazySingleton<LoginWithEmailUsecase>(
      () => LoginWithEmailUsecase(sl()),
    );

    sl.registerFactory<LoginCubit>(
      () => LoginCubit(loginWithEmailUsecase: sl()),
    );
  }
}