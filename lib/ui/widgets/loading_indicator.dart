import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final Color color;

  const LoadingIndicator({super.key, required this.color});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDot(
          animation: _controller,
          isMiddleDot: false,
          color: widget.color,
        ),
        AnimatedDot(
          animation: _controller,
          isMiddleDot: true,
          color: widget.color,
        ),
        AnimatedDot(
          animation: _controller,
          isMiddleDot: false,
          color: widget.color,
        ),
      ],
    );
  }
}

class AnimatedDot extends StatelessWidget {
  final Animation<double> animation;
  final bool isMiddleDot;
  final Color color;

  const AnimatedDot({
    super.key,
    required this.animation,
    required this.isMiddleDot,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final scale =
            isMiddleDot
                ? 0.5 + 0.5 * animation.value
                : 1.0 - 0.5 * animation.value;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        );
      },
    );
  }
}
