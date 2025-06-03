import 'dart:ui';

import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final double progress;
  final String title;
  final String value;
  final bool isValueHidden;
  final Color? color;

  const CustomProgressIndicator({
    super.key,
    required this.progress,
    required this.title,
    required this.value,
    required this.isValueHidden,
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
    _controller = AnimationController(
      duration: _calculateDuration(0.0, widget.progress),
      vsync: this,
    );

    _updateAnimation();
  }

  @override
  void didUpdateWidget(CustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _updateAnimation();
    }
  }

  Duration _calculateDuration(double start, double end) {
    // Базовое время для анимации 1.0 разницы прогресса (в секундах)
    const baseDurationPerUnit = 1.0;
    // Вычисляем разницу между текущим и целевым значением
    final difference = (end - start).abs();
    // Рассчитываем длительность пропорционально разнице
    final durationInSeconds = difference * baseDurationPerUnit;
    // Устанавливаем минимальную и максимальную длительность
    final clampedDurationInSeconds = durationInSeconds.clamp(0.3, 2.0);
    return Duration(milliseconds: (clampedDurationInSeconds * 1000).round());
  }

  void _updateAnimation() {
    final newDuration = _calculateDuration(_currentProgress, widget.progress);
    _controller.duration = newDuration;

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
    final blur = widget.isValueHidden ? 5.0 : 0.0;

    return Container(
      height: 56.0,
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
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
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

                    /// VALUE
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                      child: Text(
                        widget.value,
                        style: AppTextStyles.headlineHeadline.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
