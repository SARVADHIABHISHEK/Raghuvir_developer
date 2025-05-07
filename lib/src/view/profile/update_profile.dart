// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raghuvir_developers/src/config/config.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  ///Personal Info

  final _personalInfoformKey = GlobalKey<FormState>();
  final _passwordInfoformKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final ValueNotifier<AutovalidateMode> _personalInfoAutoValidateMode =
      ValueNotifier(AutovalidateMode.onUnfocus);

  final ValueNotifier<AutovalidateMode> _changePasswordInfoValidateMode =
      ValueNotifier(AutovalidateMode.onUnfocus);

  ///Change password
  final currentPassCtrl = TextEditingController();
  final newPassCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    currentPassCtrl.dispose();
    newPassCtrl.dispose();
    confirmPassCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F8),
      appBar: AppBar(
        title: Text(Strings.updatePasswordButton),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: _updateProfileImage()),
              CustomSizedBox.h20,
              _updateProfileInfo(),
              CustomSizedBox.h20,
              _changePassword(),
              CustomSizedBox.h20,

              // _changePassword(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _updateProfileImage() {
    return Column(
      children: [
        CustomSizedBox.h32,
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 125.0.h,
              width: 125.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image:
                      _profileImage != null
                          ? FileImage(_profileImage!)
                          : AssetImage(ConstImages.dummyProfile)
                              as ImageProvider,
                  fit: BoxFit.fill,
                ),
                border: Border.all(color: Color(0xFFF3F3F8), width: 4.0.w),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: InkWell(
                onTap: () => _showImageSourceActionSheet(context),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.camera_alt, size: 20),
                ),
              ),
            ),
          ],
        ),
        CustomSizedBox.h20,
        Text(
          'Mobile Developer',
          style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          'RG SST project manager',
          style: TextStyle(fontSize: 16.0.sp, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _updateProfileInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.0.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0.r),
                topRight: Radius.circular(12.0.r),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Text(
                Strings.personalInformation,
                style: TextStyle(
                  fontSize: 18.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CustomSizedBox.h20,
          ValueListenableBuilder<AutovalidateMode>(
            valueListenable: _personalInfoAutoValidateMode,
            builder: (context, personalInfoAutoValidateMode, _) {
              return Form(
                key: _personalInfoformKey,
                autovalidateMode: personalInfoAutoValidateMode,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///First Name
                      Text(
                        Strings.firstName,
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSizedBox.h6,
                      TextFormField(
                        controller: _firstNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: Strings.enterFirstName,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return Strings.firstNameRequired;
                          }
                          return null;
                        },
                      ),

                      CustomSizedBox.h12,

                      ///Last Name
                      Text(
                        Strings.lastName,
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSizedBox.h6,
                      TextFormField(
                        controller: _lastNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Enter last name',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'The last name field is required.';
                          }
                          return null;
                        },
                      ),

                      CustomSizedBox.h12,

                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSizedBox.h6,
                      TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: 'Enter email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'The email field is required.';
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),

                      CustomSizedBox.h12,

                      Text(
                        'Mobile Number',
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSizedBox.h6,
                      TextFormField(
                        controller: _phoneController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'The mobile number field is required.';
                          }
                          if (value.length < 10) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                      ),

                      CustomSizedBox.h16,

                      /// Submit Button
                      ElevatedButton(
                        onPressed: _submitPersonalInfoForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2A9CDB),
                        ),
                        child: Text('Update Profile'),
                      ),

                      CustomSizedBox.h20,
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _changePassword() {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.0.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0.r),
                topRight: Radius.circular(12.0.r),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CustomSizedBox.h20,
          ValueListenableBuilder<AutovalidateMode>(
            valueListenable: _changePasswordInfoValidateMode,
            builder: (context, changePasswordInfoValidateMode, _) {
              return Form(
                key: _passwordInfoformKey,
                autovalidateMode: changePasswordInfoValidateMode,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///First Name
                      Text(
                        'Current Password',
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSizedBox.h6,
                      TextFormField(
                        controller: currentPassCtrl,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Enter current password',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'The current password field is required';
                          }
                          return null;
                        },
                      ),

                      CustomSizedBox.h12,

                      ///Last Name
                      Text(
                        'New Password*',
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSizedBox.h6,
                      TextFormField(
                        controller: newPassCtrl,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Enter new password',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'The new password field is required';
                          }
                          return null;
                        },
                      ),

                      CustomSizedBox.h12,

                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSizedBox.h6,
                      TextFormField(
                        controller: confirmPassCtrl,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Confirm password',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'The confirm password field is required';
                          }

                          return null;
                        },
                      ),

                      CustomSizedBox.h16,

                      /// Submit Button
                      ElevatedButton(
                        onPressed: _chagnePasswordForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2A9CDB),
                        ),
                        child: Text('Change Password'),
                      ),

                      CustomSizedBox.h20,
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _submitPersonalInfoForm() {
    if (_personalInfoformKey.currentState!.validate()) {
    } else {
      _personalInfoAutoValidateMode.value = AutovalidateMode.onUserInteraction;
    }
  }

  void _chagnePasswordForm() {
    if (_passwordInfoformKey.currentState!.validate()) {
      // Perform update logic
    } else {
      _changePasswordInfoValidateMode.value =
          AutovalidateMode.onUserInteraction;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a photo'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }
}
