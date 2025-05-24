import 'package:drivers_test/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final Duration duration;
  final double progress;
  final String title;
  final String value;
  final Color? color;

  const CustomProgressIndicator({
    super.key,
    required this.duration,
    required this.progress,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _updateAnimation();
  }

  @override
  void didUpdateWidget(CustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    _animation = Tween<double>(
      begin: _currentProgress,
      end: widget.progress,
    ).animate(_controller)..addListener(() {
      setState(() => _currentProgress = _animation.value);
    });

    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);
    final color =
        widget.color ??
        (widget.progress <= 0.9 ? AppColors.orange100 : AppColors.green100);

    return Container(
      height: 72.0,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.12),
        border: Border.all(width: 1.0, color: AppColors.border),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            /// ANIMATED CONTAINER
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * _currentProgress,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadius,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
              child: Row(
                children: [
                  /// TITLE
                  Expanded(
                    child: Text(
                      widget.title,
                      style: AppTextStyles.headlineHeadline.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),

                  /// VALUE
                  Text(
                    widget.value,
                    style: AppTextStyles.headlineHeadline.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
