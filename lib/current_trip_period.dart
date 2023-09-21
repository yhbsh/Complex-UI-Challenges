import 'package:flutter/material.dart';

class CurrenTripPeriod extends StatelessWidget {
  const CurrenTripPeriod({super.key, required this.textColor});

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'period',
          child: Text(
            'May 8-19',
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.grey.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Hero(
          tag: 'riding',
          child: Text(
            'Riding through the\nlands of the legends',
            style: textTheme.headlineLarge?.copyWith(
              height: 1.4,
              color: textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
