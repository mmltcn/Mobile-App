import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularGraphBalanceMoney extends StatelessWidget {
  final double currentAmount;    
  final double totalAmount;      
  final String label;            
  final double size;             
  final double strokeWidth;      
  final Color progressColor;     
  final Color backgroundColor;   

  const CircularGraphBalanceMoney({
    Key? key,
    required this.currentAmount,
    required this.totalAmount,
    this.label = 'Balance',
    this.size = 200,
    this.strokeWidth = 20,
    this.progressColor = const Color(0xFF8ABEB9),
    this.backgroundColor = const Color(0xFFE0E0E0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double progress = totalAmount > 0 ? (currentAmount / totalAmount).clamp(0.0, 1.0) : 0.0;
    
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          
          CustomPaint(
            size: Size(size, size),
            painter: CircularProgressPainter(
              progress: progress,
              strokeWidth: strokeWidth,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5A7380),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(
                      '₱${currentAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF1A2E36),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ]
              ),
              Text(
                'of ₱${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5A7380),
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 18,
                  color: progressColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;

  CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    
    
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    
    canvas.drawCircle(center, radius, backgroundPaint);
    
    
    final progressPaint = Paint()
      ..color = Colors.green.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    
    
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,  
      sweepAngle,    
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}