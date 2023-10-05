import 'package:flutter/material.dart';

import 'trip_details_people.dart';

class SecondDetailsPage extends StatefulWidget {
  const SecondDetailsPage({super.key});

  @override
  State<SecondDetailsPage> createState() => _SecondDetailsPageState();
}

class _SecondDetailsPageState extends State<SecondDetailsPage> {
  late double top = 0;

  static const double _initialTop = 150;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                size: 35,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: const Hero(
              tag: 'profile',
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/p1.jpg'),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          final dy = details.delta.dy;
          if (dy < 0 || top > 200) return;

          setState(() => top += 2 * dy);
        },
        onVerticalDragEnd: (_) {
          if (top > 200) Navigator.of(context).pop();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                left: 20,
                right: 20,
                top: _initialTop + top,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: 'riding',
                      child: Text(
                        'Riding through the\nlands of the legends',
                        style: textTheme.headlineLarge?.copyWith(
                          height: 1.4,
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TripDetailsPeople()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
