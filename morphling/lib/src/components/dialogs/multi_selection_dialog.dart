import 'package:flutter/material.dart';

class MultiSelectionDialog<T> extends StatefulWidget {
  final String? title;
  final String? cancelMessage;
  final List<T> items;
  final String Function(T) label;
  final bool isMultiple;

  const MultiSelectionDialog({
    super.key,
    required this.title,
    required this.cancelMessage,
    required this.items,
    required this.label,
    this.isMultiple = true,
  });

  @override
  State<MultiSelectionDialog> createState() => _MultiSelectionDialogState<T>();
}

class _MultiSelectionDialogState<T> extends State<MultiSelectionDialog<T>> {
  late List<T> selectedItems = [];

  @override
  void initState() {
    selectedItems = [];
    super.initState();
  }

  void onChangedMultiple(bool? value, T item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    setState(() {});
  }

  void onChangeSingle(T item) {
    selectedItems
      ..clear()
      ..add(item);
    setState(() {});
  }

  void onChanged(bool? value, T item) {
    if (widget.isMultiple) {
      onChangedMultiple(value, item);
    } else {
      onChangeSingle(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title ?? 'Selecione'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.items
            .map(
              (item) => CheckboxListTile.adaptive(
                value: selectedItems.contains(item),
                title: Text(widget.label(item)),
                onChanged: (value) => onChanged(
                  value,
                  item,
                ),
              ),
            )
            .toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.cancelMessage ?? 'Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(selectedItems),
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
