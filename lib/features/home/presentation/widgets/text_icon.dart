import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final double spacing;

  const TextIcon({
    super.key,
    required this.icon,
    required this.text,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurfaceVariant;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: color),
        SizedBox(width: spacing),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
