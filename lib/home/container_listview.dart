import 'package:flutter/material.dart';
import 'package:widgetdemo/color_palette/main_color_palette.dart';

class ContainerListview extends StatelessWidget{
  const ContainerListview({super.key});

@override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Positioned(
          child: Container(
            height: 20,
            width: 20,
            color: AppColors.primary,
          )
        )
      ],
    );
  }
}