import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/core/database/Secure%20Storage/secure_storage_helper.dart';
import 'core/cubits/bool_cubit/bool_cubit.dart';
import 'core/injection/service_locator.dart';
import 'core/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'features/auth/ui/screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  SecureStorageHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: Locale('en'),
      saveLocale: true,
      fallbackLocale: Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ScreenUtilInit(
      designSize:
      MediaQuery.of(context).size.width < 600
          ? const Size(393, 853)
          : isLandscape
          ? const Size(1194, 834)
          : const Size(834, 1194),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<LoginCubit>()),
          BlocProvider(create: (context) => BoolCubit(startWith: false)),
        ],
        child: MaterialApp(
          title: 'Mobile App Project',
          supportedLocales: EasyLocalization.of(context)!.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: LoginScreen(),
        ),
      ),
    );
  }
}