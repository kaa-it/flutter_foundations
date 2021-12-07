import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min, max;
  final randomGenerator = Random();

  RandomizerPage({Key? key, required this.min, required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Randomizer'),
        ),
        body: Center(
          child: Text(
            generatedNumber.value?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 42),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Generate'),
          onPressed: () {
            generatedNumber.value =
                min + randomGenerator.nextInt(max - min + 1);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
