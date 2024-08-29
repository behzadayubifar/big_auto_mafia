import 'package:flutter/material.dart';

import '../../../offline/constants/app_colors.dart';
import '../../../offline/my_assets.dart';

class FormBlock extends StatelessWidget {
  const FormBlock({
    super.key,
    required this.height,
    required GlobalKey<FormState> formKey,
    required this.children,
    this.actions,
  }) : _formKey = formKey;

  final double height;
  final GlobalKey<FormState> _formKey;
  final List<Widget> children;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;
    return Scaffold(
      backgroundColor: AppColors.backGround,
      resizeToAvoidBottomInset:
          true, // Ensure the body resizes when the keyboard appears
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, height / 64, 16.0, 16.0),
          child: Column(
            children: [
              // Logo
              Image.asset(
                MyAssets.logo,
                width: 128.0,
                height: 128.0,
              ),
              SizedBox(height: height / 64),
              // Form
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: children,
                    ),
                  ),
                ),
              ),
              // Actions
              if (actions != null && !isKeyboardVisible)
                SizedBox(height: height / 24),
              if (actions != null && !isKeyboardVisible) ...actions!,
            ],
          ),
        ),
      ),
    );
  }
}
