import 'package:flutter/material.dart';

import 'trip_details_people.dart';

class SecondDetailsPage extends StatefulWidget {
  const SecondDetailsPage({super.key});

  @override
  State<SecondDetailsPage> createState() => _SecondDetailsPageState();
}

class _SecondDetailsPageState extends State<SecondDetailsPage> {
  late double top = 0;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
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
          if (dy > 0 || top < -80) return;

          setState(() => top += dy);
        },
        onVerticalDragEnd: (details) {
          if (top < -80) Navigator.pop(context);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 130 + top,
                child: Hero(
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
              ),
              Positioned(
                top: 250 + top,
                left: 20,
                child: const TripDetailsPeople(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
