import 'package:flutter/material.dart';

class EmptyExpenses extends StatelessWidget {
  const EmptyExpenses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No registered expenses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.1,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.4,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.contain,
            ),
          )
        ],
      )),
    );
  }
}
