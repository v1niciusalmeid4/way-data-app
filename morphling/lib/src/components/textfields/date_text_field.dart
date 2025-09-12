import 'package:flutter/material.dart';
import 'package:morphling/morphling.dart';

class DateTextField extends StatefulWidget {
  final String labelText;

  final DateTime startDate;
  final DateTime lastDate;

  final Function(DateTime?) onDatePicked;

  final DateTime? initialDate;
  final String? placeHolder;

  final DatePickerMode mode;

  const DateTextField({
    required this.labelText,
    required this.startDate,
    required this.lastDate,
    required this.onDatePicked,
    this.initialDate,
    this.placeHolder,
    this.mode = DatePickerMode.day,
    super.key,
  });

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late DateTime? currentDate = widget.initialDate;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: currentDate?.formatToDisplayCompact ?? widget.placeHolder,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> onPickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: widget.startDate,
      initialDate: widget.initialDate,
      lastDate: widget.lastDate,
      initialDatePickerMode: widget.mode,
    );

    if (date == null) {
      return;
    }

    currentDate = date;
    controller.text = date.formatToDisplayCompact;

    widget.onDatePicked(currentDate);
  }

  void onClearDate() {
    if (currentDate == null) {
      return;
    }

    currentDate = null;
    controller.clear();
    widget.onDatePicked(currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onPickDate,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: onClearDate,
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
