import 'package:flutter/material.dart';

import 'current_trip_period.dart';
import 'second_details_page.dart';
import 'trip_details_people.dart';

class TripDetailsPage extends StatefulWidget {
  const TripDetailsPage({super.key});

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  late double top = 0;
  late double bottom = 0;

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    final dy = details.delta.dy;
    if (dy > 0 && dy < 100) setState(() => top += dy);
    if (dy < 0 && dy > -200) setState(() => bottom -= dy);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (top > 100) Navigator.pop(context);
    if (bottom > 200) Navigator.push(context, MaterialPageRoute(builder: (_) => const SecondDetailsPage()));
    setState(() => top = 0);
    setState(() => bottom = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, size: 35),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: top,
            bottom: bottom,
            left: 0,
            right: 0,
            child: _TripDetailsImage(
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: 20,
            bottom: 200 + bottom,
            child: const CurrenTripPeriod(textColor: Colors.white),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: 20,
            bottom: 100 + bottom,
            child: const TripDetailsPeople(),
          ),
        ],
      ),
    );
  }
}

class _TripDetailsImage extends StatelessWidget {
  const _TripDetailsImage({required this.onVerticalDragUpdate, required this.onVerticalDragEnd});

  final void Function(DragUpdateDetails details) onVerticalDragUpdate;
  final void Function(DragEndDetails details) onVerticalDragEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: const Hero(
        tag: 'image',
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/m1.jpg'), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
