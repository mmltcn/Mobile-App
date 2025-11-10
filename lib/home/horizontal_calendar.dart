import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgetdemo/color_palette/main_color_palette.dart';

class HorizontalCalendar extends StatelessWidget {
  final Function(DateTime) onDateSelected;
  final DateTime selectedDate;

  const HorizontalCalendar({
    Key? key,
    required this.onDateSelected,
    required this.selectedDate,
  }) : super(key: key);

  List<DateTime> _generateDays() {
    final today = DateTime.now();
    return List.generate(
      365 * 2, // 1 year backward + 1 year forward
      (index) => today.subtract(Duration(days: 365)).add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = _generateDays();

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final isSelected = DateUtils.isSameDay(day, selectedDate);

          return GestureDetector(
            onTap: () => onDateSelected(day),
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.textInteractive : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(day), // Mon, Tue...
                    style: TextStyle(
                      color: isSelected ? AppColors.primary : AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('d').format(day),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.textLight : AppColors.accent,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}