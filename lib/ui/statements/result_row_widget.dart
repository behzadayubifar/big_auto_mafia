import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:flutter/material.dart';

class ResultRow extends StatelessWidget {
  const ResultRow({
    super.key,
    required this.width,
    required this.names,
    required this.topic,
  });

  final double width;
  final List<String> names;
  // determine color and image based on topic
  final String topic;

  @override
  Widget build(BuildContext context) {
    final imageAndColorAndScale =
        MyAssets.getImageAndRelatedColorByTopic(topic);
    final image = imageAndColorAndScale['image'];
    final color = imageAndColorAndScale['color'];
    final scale = imageAndColorAndScale['scale'];

    return Row(
      children: [
        // symbol
        SizedBox.square(
          dimension: width / 5,
          child: Image.asset(
            image,
            scale: scale,
          ),
        ),

        // space
        SizedBox(width: width / 32),

        // name(s)
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                MyAssets.tornPaper,
                color: color,
                colorBlendMode: BlendMode.srcATop,
                // scale: .5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (String name in names)
                    Text(
                      name,
                      style: MyTextStyles.bodyMD.copyWith(
                        color: AppColors.darkText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: width / 24),
      ],
    );
  }
}
