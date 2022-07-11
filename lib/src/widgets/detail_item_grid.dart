import 'package:flutter/material.dart';

class DetailItemGrid extends StatelessWidget {
  final List<String> items;

  DetailItemGrid({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60.0),
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [...items.map((item) => Text(item))],
          ),
        ),
      ),
    );
  }
}
