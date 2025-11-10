import 'package:flutter/material.dart';
import 'package:widgetdemo/color_palette/main_color_palette.dart';
import 'package:widgetdemo/home/circular_graph_balance_money.dart';
import 'package:widgetdemo/home/container_listview.dart';
import 'bottomtab.dart';
import 'horizontal_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'BizTracker',
          style: TextStyle(color: AppColors.textLight,
          fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: AppColors.accent),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout, color: AppColors.accent),
          ),
        ],
      ),
      body: Column(
        children: [
          
          HorizontalCalendar(
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() => selectedDate = date);
              
            },
          ),

          Expanded(child: CircularGraphBalanceMoney(currentAmount: 900, totalAmount: 1000)),
          Expanded(child: ContainerListview(),),
          Expanded(child: Bottomtab()),
        ],
      ),
    );
  }
}