import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class RowCharacterStatusComponent extends StatelessWidget {
  final CharacterStatus? status;
  final Function(CharacterStatus?) onStatusPressed;

  const RowCharacterStatusComponent({
    required this.status,
    required this.onStatusPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.0,
        children: [
          GestureDetector(
            onTap: () => onStatusPressed(null),
            child: Chip(
              label: Text('Todos'),
              backgroundColor: status == null
                  ? null
                  : Theme.of(
                      context,
                    ).colorScheme.inversePrimary.withValues(alpha: .10),
            ),
          ),
          ...CharacterStatus.values.map(
            (e) => GestureDetector(
              onTap: () => onStatusPressed(e),
              child: Chip(
                label: Text(e.label),
                backgroundColor: e == status
                    ? null
                    : Theme.of(
                        context,
                      ).colorScheme.inversePrimary.withValues(alpha: .10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
