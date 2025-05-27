import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      child: Center(
        child: Container(
          width: 40.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: AppColors.black20,
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}
