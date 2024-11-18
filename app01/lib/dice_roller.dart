import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int activeDice = 1;

  void onButtonPressed() {
    dev.log("button pressed");
    setState(() {
      activeDice = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('images/dice-$activeDice.png', width: 100),
        const SizedBox(height: 20),
        TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: onButtonPressed,
            child: const Text(
              'Roll Dice',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
