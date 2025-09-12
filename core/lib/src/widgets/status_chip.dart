import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String label;
  final Color foreground;
  final TextStyle? style;

  const StatusChip({
    super.key,
    required this.label,
    required this.foreground,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: foreground.withValues(alpha: .2)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(label, style: style),
      ),
    );
  }
}
