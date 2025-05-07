import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/pre_fix_sizebox.dart';
import 'package:raghuvir_developers/src/config/strings.dart';
import 'package:raghuvir_developers/src/utils/extensions/media_query_extensions.dart';
import 'package:raghuvir_developers/src/config/pallete.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailCtrl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic
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
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        CustomSizedBox.h6,
                        Text(
                          'Reset password with velzon',
                          style: TextStyle(
                            color: const Color(0xFF888A99),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CustomSizedBox.h12,

                        Container(
                          height: 80.h,
                          width: context.width,
                          decoration: BoxDecoration(
                            color: Color(0xFFFEF4E4),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Color(0xFFFCE3B7)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Enter your email and instructions will be sent to you!',
                            style: TextStyle(
                              color: Color(0xFFB57A2A),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        CustomSizedBox.h16,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0.sp,
                            ),
                          ),
                        ),
                        CustomSizedBox.h8,
                        TextFormField(
                          controller: _emailCtrl,
                          decoration: const InputDecoration(
                            hintText:
                                Strings.emailHint, // Add this in Strings class
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return Strings
                                  .emailRequired; // Add this in Strings class
                            }

                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value.trim())) {
                              return Strings
                                  .invalidEmail; // Add this in Strings class
                            }

                            return null;
                          },
                        ),
                        CustomSizedBox.h16,

                        ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomSizedBox.h16,

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Wait, I Remember my password..',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Click here',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
