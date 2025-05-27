import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int lenght;
  final int index;

  const StepIndicator({super.key, required this.lenght, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(lenght, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            width: 37.5,
            decoration: BoxDecoration(
              color: index == this.index ? AppColors.blue100 : AppColors.blue10,
              borderRadius: BorderRadius.circular(100.0),
            ),
          );
        }),
      ),
    );
  }
}
