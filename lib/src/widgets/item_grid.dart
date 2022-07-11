import 'package:flutter/material.dart';

class ItemGrid extends StatelessWidget {
  final String name;
  final String subtitle;
  final Icon? icon;
  final bool hasChildren;
  final VoidCallback? onPressedNext;

  ItemGrid({
    required this.name,
    required this.subtitle,
    this.icon,
    this.hasChildren = false,
    this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(name);
    Widget subtitleWidget = Text(subtitle);

    IconButton expandButton = IconButton(
      icon: Icon(Icons.navigate_next),
      onPressed: onPressedNext,
    );

    return Card(
      child: ListTile(
        leading: icon,
        title: titleWidget,
        subtitle: subtitleWidget,
        trailing: hasChildren ? expandButton : null,
        onTap: (() => print(name)),
      ),
    );
  }
}
