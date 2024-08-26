import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/app_colors.dart';
import '../../../my_assets.dart';
import '../common/buttons/online_buttons.dart';
import '../common/fields/text_form_fields.dart';

class RoomEntry extends HookConsumerWidget {
  const RoomEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    // ------------------ Controllers ------------------
    final roomNameController = useTextEditingController();
    final roomPasswordController = useTextEditingController();
    final roomConfirmPasswordController = useTextEditingController();

    // ------------------ Form Key ------------------
    final _formKey = GlobalKey<FormState>();

    return FormBlock(
      height: height,
      formKey: _formKey,
      children: [
        // Room Name
        MyTextField(
          textDirection: TextDirection.ltr,
          labelText: 'نام اتاق',
          controller: roomNameController,
          validator: (content) {
            if (content == null || content.isEmpty) {
              return 'لطفا نام اتاق را وارد کنید';
            }
            return null;
          },
        ),
        SizedBox(height: height / 32),
        // Room Password
        MyTextField(
          textDirection: TextDirection.ltr,
          labelText: 'رمز اتاق',
          controller: roomPasswordController,
          validator: (content) {
            if (content == null || content.isEmpty) {
              return 'لطفا رمز اتاق را وارد کنید';
            }
            return null;
          },
        ),
        SizedBox(height: height / 32),
        // Confirm Room Password
        MyTextField(
          textDirection: TextDirection.ltr,
          labelText: 'تکرار رمز اتاق',
          controller: roomConfirmPasswordController,
          validator: (content) {
            if (content == null || content.isEmpty) {
              return 'لطفا رمز اتاق را تکرار کنید';
            }
            if (content != roomPasswordController.text) {
              return 'رمز اتاق و تکرار آن باید یکسان باشند';
            }
            return null;
          },
        ),
        SizedBox(height: height / 32),
        // Create Room Button
        OnlineButton(
            height: height,
            width: width,
            title: 'ایجاد اتاق',
            provider: roomControllerProvider,
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            }),
      ],
    );
  }
}

class FormBlock extends StatelessWidget {
  const FormBlock({
    super.key,
    required this.height,
    required GlobalKey<FormState> formKey,
    required this.children,
  }) : _formKey = formKey;

  final double height;
  final GlobalKey<FormState> _formKey;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, height / 8, 16.0, 16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  MyAssets.logo,
                  width: 128.0,
                  height: 128.0,
                ),
                SizedBox(height: height / 32),
                ...children,
              ],
            ),
          ),
        ),
      )),
    );
  }
}
