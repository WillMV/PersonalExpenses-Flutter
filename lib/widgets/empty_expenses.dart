import 'package:flutter/material.dart';

class EmptyExpenses extends StatelessWidget {
  const EmptyExpenses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'No registered expenses',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.contain,
          ),
        )
      ],
    ));
  }
}
