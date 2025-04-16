import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../asihfbiwufh.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_text.dart';
import '../../../../core/cubits/bool_cubit/bool_cubit.dart';
import '../../../../core/enums/login_user_type.dart';
import '../../../../core/injection/service_locator.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/custom_radio_tile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late BoolCubit buttonCubit;

  late BoolCubit radioCubit;

  @override
  void initState() {
    super.initState();
    if (sl.isRegistered<BoolCubit>(instanceName: 'buttonCubit')) {
      sl.unregister<BoolCubit>(instanceName: 'buttonCubit');
    }
    buttonCubit = ServiceLocator.createBoolCubitInstance(
      startWith: false,
      instanceName: 'buttonCubit',
    );
    if (sl.isRegistered<BoolCubit>(instanceName: 'radioCubit')) {
      sl.unregister<BoolCubit>(instanceName: 'radioCubit');
    }
    radioCubit = ServiceLocator.createBoolCubitInstance(
      startWith: true,
      instanceName: 'radioCubit',
    );
  }

  @override
  void dispose() {
    super.dispose();
    sl.unregister<BoolCubit>(instanceName: 'buttonCubit');
    sl.unregister<BoolCubit>(instanceName: 'radioCubit');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(16.0.sp),
        actions: [
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  });
                },
                icon: Icon(Icons.language),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'EduAttend',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: 'loginSubtitle',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'email'),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            if (_passwordController.text.trim().isNotEmpty &&
                                _emailController.text.trim().isNotEmpty) {
                              buttonCubit.changeState(newState: true);
                            } else {
                              buttonCubit.changeState(newState: false);
                            }
                          },
                          onTapOutside: (event) => _emailFocusNode.unfocus(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email or phone';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'emailHintText'.tr(),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        CustomText(text: 'password'),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            if (_passwordController.text.trim().isNotEmpty &&
                                _emailController.text.trim().isNotEmpty) {
                              buttonCubit.changeState(newState: true);
                            } else {
                              buttonCubit.changeState(newState: false);
                            }
                          },
                          onTapOutside: (event) => _passwordFocusNode.unfocus(),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'passwordHintText'.tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // Wrap radio buttons in BlocBuilder to make it reactive
                BlocProvider(
                  create: (context) => BoolCubit(startWith: true),
                  child: BlocBuilder<BoolCubit, bool>(
                    bloc: radioCubit,
                    builder: (context, isStudentSelected) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRadioTile<String>(
                            text: 'student'.tr(),
                            value: 'Student',
                            groupValue:
                                isStudentSelected ? 'Student' : 'Instructor',
                            // Dynamically set group value
                            onChanged: (value) {
                              if (value != null) {
                                radioCubit.changeState(
                                  newState: value == 'Student',
                                );
                              }
                            },
                          ),
                          CustomRadioTile<String>(
                            text: 'instructor'.tr(),
                            value: 'Instructor',
                            groupValue:
                                isStudentSelected ? 'Student' : 'Instructor',
                            // Dynamically set group value
                            onChanged: (value) {
                              if (value != null) {
                                radioCubit.changeState(
                                  newState: value == 'Student',
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    } else if (state is LoginSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PlaceHolder()),
                      );
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<BoolCubit, bool>(
                      bloc: buttonCubit,
                      builder: (context, isButtonEnabled) {
                        return CustomButton(
                          onPressed: () {
                            print("the user type is : ${radioCubit.state}");
                            if (state is! LoginLoading &&
                                _formKey.currentState!.validate() &&
                                isButtonEnabled) {
                              context.read<LoginCubit>().loginWithEmail(
                                emailOrPhone: _emailController.text,
                                password: _passwordController.text,
                                userType:
                                    radioCubit.state
                                        ? LoginUserType.student
                                        : LoginUserType.instructor,
                              );
                            }
                          },
                          title: 'signIn'.tr(),
                          isLoading: state is LoginLoading,
                          noAction: isButtonEnabled,
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    text: 'forgotPassword'.tr(),
                    style: GoogleFonts.figtree(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    children: [
                      TextSpan(
                        text: 'resetPassword'.tr(),
                        style: GoogleFonts.figtree(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO: Navigate to password reset screen
                          },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}