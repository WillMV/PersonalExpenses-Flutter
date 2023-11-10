import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar({
    Key? key,
    required this.label,
    required this.value,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${value.toStringAsFixed(2)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            width: 10,
            height: constraints.maxHeight * 0.6,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label))),
        ],
      ),
    );
  }
}
