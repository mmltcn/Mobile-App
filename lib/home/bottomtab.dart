import 'package:flutter/material.dart';
import 'package:widgetdemo/color_palette/main_color_palette.dart';

class Bottomtab extends StatelessWidget{
  const Bottomtab({super.key});

@override
Widget build(BuildContext context){
  return Stack(
  children: <Widget>[
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        height: 70,
        color: AppColors.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: AppColors.accent, size: 30),
                    onPressed: () {},
                  ),
                  Text('Home', style: TextStyle(color: AppColors.textLight,fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.align_vertical_bottom, 
                    color: AppColors.accent, size: 30),
                    onPressed: () {},
                  ),
                  Text('Stats', style: TextStyle(color: AppColors.textLight,fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.settings, color: AppColors.accent, size: 30),
                    onPressed: () {},
                  ),
                  Text('Settings', style: TextStyle(color: AppColors.textLight,fontSize: 12)),
                ],
              ),
          ],
        ),
      ),
    ),
  ],
);
}
}