import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  final int min, max;

  const RandomizerPage({Key? key, required this.min, required this.max})
      : super(key: key);

  @override
  _RandomizerPageState createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Randomizer'),
        ),
        body: Center(
          child: Text(
            _generatedNumber?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 42),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Generate'),
          onPressed: () {
            setState(() {
              _generatedNumber = widget.min +
                  randomGenerator.nextInt(widget.max - widget.min + 1);
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
