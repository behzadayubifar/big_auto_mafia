import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/online/users.dart';
import 'package:auto_mafia/ui/common/buttons/online_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../common/fields/text_form_fields.dart';

class SignUpPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final fNameController = useTextEditingController();
    final lNameController = useTextEditingController();
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      backgroundColor:
          AppColors.lightestGrey, // Replace with your custom background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your custom logo here png
                Image.asset(
                  MyAssets.logo,
                  width: 128.0,
                  height: 128.0,
                ),
                MyTextFormField(
                  labelText: 'نام',
                  controller: fNameController,
                  nextController: lNameController,
                  validator: (content) {
                    if (content == null || content.isEmpty) {
                      return 'لطفا نام خود را وارد کنید';
                    } else if (!RegExp(r'^[\u0600-\u06FF\s\u200C]+$')
                        .hasMatch(content)) {
                      return 'لطفا نام خود را به فارسی وارد کنید';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                MyTextFormField(
                  labelText: 'نام خانوادگی',
                  controller: lNameController,
                  nextController: usernameController,
                  validator: (content) {
                    if (content == null || content.isEmpty) {
                      return 'لطفا نام خانوادگی خود را وارد کنید';
                    } /* check to be persion */ else if (!RegExp(
                            r'^[\u0600-\u06FF\s]+$')
                        .hasMatch(content)) {
                      return 'لطفا نام خود را به فارسی وارد کنید';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                MyTextFormField(
                  labelText: 'یوزرنیم',
                  textDirection: TextDirection.ltr,
                  controller: usernameController,
                  nextController: emailController,
                  maxLength: 32,
                  validator: (content) {
                    if (content == null || content.isEmpty) {
                      return 'لطفا یوزرنیم خود را وارد کنید';
                    } else if (content.length < 6) {
                      return 'یوزرنیم باید حداقل 6 کاراکتر باشد';
                    } /* check if username is english */ else if (!RegExp(
                            r'^[a-zA-Z0-9_]*$')
                        .hasMatch(content)) {
                      return 'یوزرنیم باید فقط شامل حروف انگلیسی، اعداد و زیرخط باشد';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                MyTextFormField(
                  textDirection: TextDirection.ltr,
                  labelText: 'ایمیل',
                  controller: emailController,
                  nextController: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (content) {
                    if (content == null || content.isEmpty) {
                      return 'لطفا ایمیل خود را وارد کنید';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(content)) {
                      return 'لطفا یک ایمیل معتبر وارد کنید';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                MyTextFormField(
                  maxLength: 32,
                  textDirection: TextDirection.ltr,
                  controller: passwordController,
                  nextController: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: 'رمز عبور',
                  obscureText: true,
                  validator: (content) {
                    if (content == null || content.isEmpty) {
                      return 'لطفا رمز عبور خود را وارد کنید';
                    } else if (content.length < 8) {
                      return 'رمز عبور باید حداقل 8 کاراکتر باشد';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                MyTextFormField(
                  labelText: 'تکرار رمز عبور',
                  textDirection: TextDirection.ltr,
                  controller: confirmPasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (content) {
                    if (content != passwordController.text) {
                      return 'رمز عبور و تکرار آن باید یکسان باشند';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 32.0),
                OnlineButton(
                  title: 'ثبت نام',
                  onPressed: () async {
                    await register(
                      userName: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      firstName: fNameController.text,
                      lastName: lNameController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
