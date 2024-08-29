import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/online/presentation/common/dialogs/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/buttons/online_buttons.dart';
import '../common/fields/text_form_fields.dart';
import '../common/forms_block.dart';
import 'controllers/rooms_controller.dart';

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
    final numberOfPlayersController = useTextEditingController();

    final isNumberOfPlayersControllerValid = useState(false);

    // ------------------ Form Key ------------------
    final _formKey = GlobalKey<FormState>();

    numberOfPlayersController.addListener(() {
      print('number of players controller: ${numberOfPlayersController.text}');
      isNumberOfPlayersControllerValid.value =
          int.tryParse(numberOfPlayersController.text) != null &&
              int.tryParse(numberOfPlayersController.text)! >= 7 &&
              int.tryParse(numberOfPlayersController.text)! <= 11;
      return null;
    });

    return FormBlock(
      height: height,
      formKey: _formKey,
      children: [
        // Room Name
        MyTextField(
          textDirection: TextDirection.ltr,
          labelText: 'نام روم',
          controller: roomNameController,
          fillColor: AppColors.lightestGrey,
          // labelColor: const Color.fromARGB(207, 189, 68, 88),
          validator: (content) {
            if (content == null || content.isEmpty) {
              return 'لطفا نام روم را وارد کنید';
            }
            return null;
          },
        ),
        SizedBox(height: height / 32),
        // Room Password
        MyTextField(
          textDirection: TextDirection.ltr,
          labelText: 'رمز روم',
          controller: roomPasswordController,
          fillColor: AppColors.lightestGrey,
          validator: (content) {
            if (content == null || content.isEmpty) {
              return 'لطفا رمز روم را وارد کنید';
            }
            return null;
          },
        ),
        SizedBox(height: height / 32),
        // Confirm Room Password
        MyTextField(
          textDirection: TextDirection.ltr,
          labelText: 'تکرار رمز روم',
          controller: roomConfirmPasswordController,
          fillColor: AppColors.lightestGrey,
          validator: (content) {
            if (content == null || content.isEmpty) {
              return 'لطفا رمز روم را تکرار کنید';
            }
            if (content != roomPasswordController.text) {
              return 'رمز روم و تکرار آن باید یکسان باشند';
            }
            return null;
          },
        ),
        SizedBox(height: height / 32),
        // number of players
        MyTextField(
          textDirection: TextDirection.ltr,
          labelText: 'تعداد بازیکنان',
          controller: numberOfPlayersController,
          fillColor: AppColors.lightestGrey,
          textInputAction: TextInputAction.done,
          validator: (content) {
            if (content == null || content.isEmpty) {
              return 'لطفا تعداد بازیکنان را وارد کنید';
            } else if (int.tryParse(content) == null) {
              return 'لطفا تعداد بازیکنان را به صورت عدد وارد کنید';
            } else if (int.tryParse(content)! < 7) {
              return 'تعداد بازیکنان باید حداقل 7 نفر باشد';
            } else if (int.tryParse(content)! > 11) {
              return 'تعداد بازیکنان باید حداکثر 11 نفر باشد';
            }
            return null;
          },
        ),
        SizedBox(height: height / 32),
        // select the roles
        OnlineButton(
          height: height / 12,
          width: width / 1.6,
          backgroundColor: AppColors.primaries[2],
          textColor: AppColors.primaries[0],
          elevation: 12,
          shadowColor: AppColors.primaries[0],
          title: 'انتخاب نقش‌ها',
          onPressed: isNumberOfPlayersControllerValid.value
              ? () {
                  // show a dialog to select the roles
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AppDialog.rolesSelection(
                        height: height,
                        width: width,
                        numberOfPlayers:
                            int.tryParse(numberOfPlayersController.text)!,
                        ref: ref,
                        context: context,
                      );
                    },
                  );
                }
              : null,
        ),
      ],
      actions: [
        // Create Room Button
        OnlineButton(
            height: height / 12,
            width: width / 1.6,
            backgroundColor: AppColors.greens[2],
            textColor: AppColors.lightestGrey,
            elevation: 12,
            shadowColor: AppColors.greens[0],
            title: 'ایجاد روم',
            provider: roomsControllerProvider,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref.read(roomsControllerProvider.notifier).createRoom(
                      name: roomNameController.text,
                      password: roomPasswordController.text,
                      numberOfPlayers:
                          int.tryParse(numberOfPlayersController.text)!,
                    );
              }
            }),
      ],
    );
  }
}
