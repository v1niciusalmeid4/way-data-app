import 'package:flutter/material.dart';
import 'package:morphling/morphling.dart';

class LoadingStepDialog<T> extends StatefulWidget {
  final List<Future<T>> futures;
  final String message;

  const LoadingStepDialog({
    required this.futures,
    required this.message,
    super.key,
  });

  @override
  State<LoadingStepDialog> createState() => _LoadingStepDialogState<T>();
}

class _LoadingStepDialogState<T> extends State<LoadingStepDialog> {
  late int completed;
  late List<T> results;

  @override
  void initState() {
    completed = 0;
    onInit();
    super.initState();
  }

  Future<void> onInit() async {
    results = await Future.wait<T>(widget.futures.map((f) => onFuture(f)));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(results);
  }

  Future<T> onFuture(Future future) async {
    final result = await future;

    setState(() {
      completed++;
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.message),
            const VSpacer(),
            Text('$completed/${widget.futures.length}'),
            const VSpacer(),
            LinearProgressIndicator(
              value: completed / widget.futures.length,
            )
          ],
        ),
      ),
    );
  }
}
