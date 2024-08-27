import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/my_assets.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/fields/text_form_fields.dart';
import '../controller/users_controller.dart';

class UserEntry extends HookConsumerWidget {
  /* const */ UserEntry({
    required this.isLogin,
    this.userName,
    Key? key,
  }) : super(key: key);

  final bool isLogin;
  final String? userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    // ------------------ Controllers ------------------
    final fNameController = useTextEditingController();
    final lNameController = useTextEditingController();
    final userNameController = useTextEditingController(text: userName);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final _formKey = GlobalKey<FormState>();
    // -------------------------------------------------

    final isLogining = useState(isLogin);
    final isProcessing = useState(false);

    return Scaffold(
      backgroundColor: AppColors.lightestGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              16.0, isLogining.value ? height / 16 : 8, 16.0, 16.0),
          child: Form(
            key: _formKey,
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
                  isLogining.value
                      ? SizedBox(
                          height: height / 16,
                        )
                      : MyTextField(
                          labelText: 'نام',
                          controller: fNameController,
                          nextController: lNameController,
                          validator: (content) {
                            if (content == null || content.isEmpty) {
                              return 'لطفا نام خود را وارد کنید';
                            } else if (!RegExp(r'^[\u0600-\u06FF\s\u200C]+$')
                                .hasMatch(content.replaceAll(
                              // remove half-space
                              String.fromCharCode(8204),
                              '',
                            ))) {
                              return 'لطفا نام خود را به فارسی وارد کنید';
                            }
                            return null;
                          },
                        ),
                  SizedBox(height: 16.0),
                  isLogining.value
                      ? SizedBox()
                      : MyTextField(
                          labelText: 'نام خانوادگی',
                          controller: lNameController,
                          nextController: userNameController,
                          validator: (content) {
                            if (content == null || content.isEmpty) {
                              return 'لطفا نام خانوادگی خود را وارد کنید';
                            } /* check to be persion */ else if (!RegExp(
                                    r'^[\u0600-\u06FF\s]+$')
                                .hasMatch(content.replaceAll(
                              // remove half-space
                              String.fromCharCode(8204),
                              '',
                            ))) {
                              return 'لطفا نام خود را به فارسی وارد کنید';
                            }
                            return null;
                          },
                        ),
                  SizedBox(height: 8.0),
                  MyTextField(
                    labelText: 'نام کاربری',
                    textDirection: TextDirection.ltr,
                    controller: userNameController,
                    nextController:
                        isLogining.value ? passwordController : emailController,
                    maxLength: 32,
                    validator: (content) {
                      if (content != null) {
                        content = content
                            .trim()
                            .replaceAll(String.fromCharCode(8204), '');
                        if (content.isEmpty) {
                          return 'لطفا نام کاربری خود را وارد کنید';
                        } else if (content.length < 6) {
                          return 'نام کاربری باید حداقل 6 کاراکتر باشد';
                        } /* check if userName is english */ else if (!RegExp(
                                r'^[a-zA-Z0-9_]*$')
                            .hasMatch(content)) {
                          return 'نام کاربری باید فقط شامل حروف انگلیسی، اعداد و زیرخط باشد';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.0),
                  isLogining.value
                      ? SizedBox()
                      : MyTextField(
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
                  SizedBox(height: 8.0),
                  MyTextField(
                    maxLength: 32,
                    textDirection: TextDirection.ltr,
                    controller: passwordController,
                    nextController: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'رمز عبور',
                    obscureText: true,
                    textInputAction: isLogining.value
                        ? TextInputAction.done
                        : TextInputAction.next,
                    validator: (content) {
                      if (content == null || content.isEmpty) {
                        return 'لطفا رمز عبور خود را وارد کنید';
                      } else if (content.length < 8) {
                        return 'رمز عبور باید حداقل 8 کاراکتر باشد';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.0),
                  isLogining.value
                      ? SizedBox()
                      : MyTextField(
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
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OnlineButton(
                        title: isLogining.value ? 'ورود' : 'ثبت نام',
                        height: height / 12,
                        width: width / 2.4,
                        provider: usersControllerProvider,
                        onPressed: () {
                          isProcessing.value = true;
                          if (_formKey.currentState!.validate()) {
                            isLogining.value
                                ? () async {
                                    await ref
                                        .read(usersControllerProvider.notifier)
                                        .loginUser(
                                          userName: userNameController.text,
                                          password: passwordController.text,
                                        );
                                    isProcessing.value = false;
                                  }()
                                : () async {
                                    await ref
                                        .read(usersControllerProvider.notifier)
                                        .registerUser(
                                          userNameController.text,
                                          emailController.text,
                                          passwordController.text,
                                          fNameController.text,
                                          lNameController.text,
                                        );

                                    isProcessing.value = false;
                                  }();
                          }
                        },
                      ),
                      SizedBox(height: height / 48),
                      // a button to switch between login and register
                      TextButton(
                        child: Text(isLogining.value
                            ? 'ایجاد حساب جدید'
                            : 'اکانت داری؟ وارد شو'),
                        onPressed: isProcessing.value == true
                            ? null
                            : () => isLogining.value = !isLogining.value,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
