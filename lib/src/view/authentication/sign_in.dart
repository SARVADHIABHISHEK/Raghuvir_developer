import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/app_routers.dart';
import 'package:raghuvir_developers/src/config/pre_fix_sizebox.dart';
import 'package:raghuvir_developers/src/config/strings.dart';
import 'package:raghuvir_developers/src/utils/extensions/media_query_extensions.dart';
import 'package:raghuvir_developers/src/config/pallete.dart';
import 'package:raghuvir_developers/src/view/authentication/forgot_pass.dart';
import 'package:raghuvir_developers/src/view/home/home_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _rememberMe = false;
  bool _showPassword = false;

  void _submit() {
    if (kDebugMode) {
      Navigate.to(HomeView());
    } else if (!_formKey.currentState!.validate()) {
      Navigate.to(HomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Palette.loginBgColor,
        bottomNavigationBar: SafeArea(
          child: Text(
            textAlign: TextAlign.center,
            Strings.copyRight,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.width,
              padding: EdgeInsets.all(10.0.w),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0.h,
                    horizontal: 14.0.w,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          Strings.welcomeBack,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        CustomSizedBox.h6,
                        Text(
                          Strings.signInToContinue,
                          style: TextStyle(
                            color: const Color(0xFF888A99),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CustomSizedBox.h6,
                        Row(
                          children: [
                            Text(
                              Strings.username,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              " *",
                              style: TextStyle(color: Palette.redColor),
                            ),
                          ],
                        ),
                        CustomSizedBox.h8,
                        TextFormField(
                          controller: _userNameController,
                          decoration: const InputDecoration(
                            hintText: Strings.usernameHint,
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return Strings.usernameRequired;
                            }
                            return null;
                          },
                        ),
                        CustomSizedBox.h10,
                        Row(
                          children: [
                            Text(
                              Strings.password,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Text(
                              " *",
                              style: TextStyle(color: Palette.redColor),
                            ),
                          ],
                        ),
                        CustomSizedBox.h8,
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            hintText: Strings.passwordHint,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                size: 18.0.sp,
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Strings.passwordRequired;
                            }
                            return null;
                          },
                        ),
                        CustomSizedBox.h6,
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20.0.h,
                                    width: 20.0.w,
                                    child: Transform.scale(
                                      scale: 1.5,
                                      child: CupertinoCheckbox(
                                        value: _rememberMe,
                                        onChanged: (val) {
                                          setState(() {
                                            _rememberMe = val ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  CustomSizedBox.w8,
                                  const Text(
                                    Strings.rememberMe,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigate.to(ForgetPassword());
                                },
                                child: const Text(
                                  Strings.forgotPassword,
                                  style: TextStyle(
                                    color: Color(0xFF888A99),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomSizedBox.h10,
                        ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0AB39C),
                          ),
                          child: const Text(Strings.signIn),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
