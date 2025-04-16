import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app_project/core/cubits/bool_cubit/bool_cubit.dart';
import 'package:mobile_app_project/core/generated/dataconnect/connector/db.dart';

import 'package:mobile_app_project/features/auth/domain/repository/login_repo.dart';

import '../../features/auth/data/repository/login_repo.dart';
import '../../features/auth/data/sources/remote/login_remote_datasources.dart';
import '../../features/auth/domain/usecases/login_usecases/email_login_usecase.dart';
import '../../features/auth/ui/cubits/login_cubit/login_cubit.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  static BoolCubit createBoolCubitInstance({
    required bool startWith,
    required String instanceName,
  }) {
    if (!sl.isRegistered<BoolCubit>(instanceName: instanceName)) {
      createBoolSingleton(startWith: startWith, instanceName: instanceName);
    }
    return sl<BoolCubit>(instanceName: instanceName);
  }

  static void createBoolSingleton({
    required bool startWith,
    required String instanceName,
  }) {
    sl.registerLazySingleton<BoolCubit>(
      () => BoolCubit(startWith: startWith),
      instanceName: instanceName,
    );
  }

  static Future<void> init() async {
    sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    sl.registerLazySingleton<DbConnector>(() => DbConnector.instance);
    sl.registerFactory<BoolCubit>(() => BoolCubit(startWith: false),);

    await initLoginModule();
  }

  static Future<void> initLoginModule() async {
    sl.registerLazySingleton<LoginDatasource>(
      () => LoginDataSourceImpl(sl(), sl()),
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
