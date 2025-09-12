import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class RowCharacterGenderComponent extends StatelessWidget {
  final CharacterGender? gender;
  final Function(CharacterGender?) onGenderPressed;

  const RowCharacterGenderComponent({
    required this.gender,
    required this.onGenderPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 5.0,
        children: [
          GestureDetector(
            onTap: () => onGenderPressed(null),
            child: Chip(
              label: Text('Todos'),
              backgroundColor: gender == null
                  ? null
                  : Theme.of(
                      context,
                    ).colorScheme.inversePrimary.withValues(alpha: .10),
            ),
          ),
          ...CharacterGender.values.map(
            (e) => GestureDetector(
              onTap: () => onGenderPressed(e),
              child: Chip(
                label: Text(e.label),
                backgroundColor: e == gender
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
