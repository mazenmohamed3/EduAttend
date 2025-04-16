import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../asihfbiwufh.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_text.dart';
import '../../../../core/cubits/bool_cubit/bool_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    BoolCubit buttonCubit = BlocProvider.of<BoolCubit>(context);
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
                        cursorColor: Colors.blue,
                        controller: _emailController,
                        focusNode: _emailFocusNode,
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
                        cursorColor: Colors.blue,
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
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
                  builder: (context, isStudentSelected) {
                    BoolCubit radioCubit = BlocProvider.of<BoolCubit>(context);
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlaceHolder()),
                    );
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<BoolCubit, bool>(
                    builder: (context, isButtonEnabled) {
                      return CustomButton(
                        onPressed: () {
                          if (state is! LoginLoading &&
                              _formKey.currentState!.validate() &&
                              isButtonEnabled) {
                            context.read<LoginCubit>().loginWithEmail(
                              _emailController.text,
                              _passwordController.text,
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
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'resetPassword'.tr(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer:
                          TapGestureRecognizer()
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
    );
  }
}
