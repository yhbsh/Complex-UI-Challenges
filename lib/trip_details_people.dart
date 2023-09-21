import 'package:flutter/material.dart';

class TripDetailsPeople extends StatelessWidget {
  const TripDetailsPeople({super.key});

  static const List<String> _names = ['John', 'Jane', 'Jack'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Hero(
      tag: 'people',
      child: Wrap(
        spacing: 10,
        children: [
          for (var i = 0; i < 3; i++)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: Colors.black.withOpacity(.4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/p${i + 1}.jpg'),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _names[i],
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
