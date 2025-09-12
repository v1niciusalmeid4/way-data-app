import 'package:core/app_way_data_core.dart';

import 'package:flutter/material.dart';

class SearchCharacterComponent extends StatelessWidget {
  final Function(String query) onSearch;

  const SearchCharacterComponent({required this.onSearch, super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return TextFieldDelayed(
      onChanged: onSearch,
      decoration: InputDecoration(
        hintText: 'Buscar personagem por nome',
        prefixIcon: const Icon(Icons.search),
        isDense: true,
        filled: true,
        fillColor: cs.surfaceContainerHighest.withValues(alpha: .35),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: cs.primary),
        ),
      ),
    );
  }
}
