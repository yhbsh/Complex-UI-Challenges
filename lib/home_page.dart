import 'package:flutter/material.dart';

import 'current_trip_period.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            height: 400,
            child: _HomePageCurrentTripCard(),
          ),
        ],
      ),
    );
  }
}

class _HomePageCurrentTripCard extends StatelessWidget {
  const _HomePageCurrentTripCard();

  void _onTap(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (_) => const TripDetailsPage()));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              top: 0,
              child: _CurrentTripImage(),
            ),
            Positioned(
              left: 20,
              bottom: 100,
              child: CurrenTripPeriod(textColor: Colors.white),
            ),
            Positioned(
              left: 20,
              right: 0,
              bottom: 0,
              height: 40,
              child: _CurrentTripPeople(),
            )
          ],
        ),
      ),
    );
  }
}

class _CurrentTripPeople extends StatelessWidget {
  const _CurrentTripPeople();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'people',
      child: Stack(
        children: [
          for (var i = 0; i < 3; i++)
            Positioned(
              left: i * 30,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: const Border.fromBorderSide(BorderSide(color: Colors.white, width: 3)),
                  image: DecorationImage(
                    image: AssetImage('assets/p${i + 1}.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CurrentTripImage extends StatelessWidget {
  const _CurrentTripImage();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image',
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: AssetImage('assets/m1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
