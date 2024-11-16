import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 105, 27, 208),
            Color.fromARGB(255, 209, 54, 244),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyleText(),
      ),
    );
  }
}

class StyleText extends StatelessWidget {
  const StyleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "hello world",
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
    );
  }
}
