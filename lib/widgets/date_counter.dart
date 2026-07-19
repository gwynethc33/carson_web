import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';
import 'dart:async';


class DateCounter extends StatefulWidget {
  const DateCounter({super.key});

  @override
  State<DateCounter> createState() => _DateCounterState();
}

class _DateCounterState extends State<DateCounter> {
   final DateTime startDate = DateTime(2026, 3, 17);

     Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
     final r = Responsive.scale(context);
    final now = DateTime.now();


    int years = now.year - startDate.year;
    int months = now.month - startDate.month;
    int days = now.day - startDate.day;

    
    if (days < 0) {
      months--;
      days += DateTime(now.year, now.month, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }
    
    final difference = now.difference(startDate);
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    
return Container(
      color: const Color(0xFFD9D9D9),
      padding: EdgeInsets.all(24 * r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "03 . 17 . 2026",
            style: TextStyle(
              fontSize: 28 * r,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 4 * r),

          Text(
            "March Seventeenth Twenty Twenty-Six",
            style: TextStyle(
              fontSize: 10 * r,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 18 * r),

          Image.asset(
            'assets/images/bouquet.png',
            width: 200 * r,
            height: 205 * r,
            fit: BoxFit.contain,
          ),

          SizedBox(height: 18 * r),

          Text(
            "$years years • $months months • $days days",
            style: TextStyle(
              fontSize: 22 * r,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 6 * r),

          Text(
            "$hours hours • $minutes minutes",
            style: TextStyle(
              fontSize: 18 * r,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}