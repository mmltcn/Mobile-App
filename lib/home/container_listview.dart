import 'package:flutter/material.dart';

class ContainerListview extends StatelessWidget{
  const ContainerListview({super.key});

@override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          title: Text(index.toString()),
        )
      ),
    );
  }
}