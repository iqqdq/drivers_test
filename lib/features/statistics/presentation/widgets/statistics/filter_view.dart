import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

import 'drag_handle.dart';
import 'filter_tile.dart';

class FilterView extends StatefulWidget {
  final String title;
  final List<String> actions;
  final int? action;
  final Function(int index) onTap;

  const FilterView({
    super.key,

    required this.title,
    required this.actions,
    this.action,
    required this.onTap,
  });

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  int? _index;

  @override
  void initState() {
    _index = widget.action;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ).copyWith(bottom: getBottomPadding(context)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DragHandle(),
          const SizedBox(height: 16.0),

          /// TITLE
          Text(widget.title, style: AppTextStyles.headlineTitle2),
          const SizedBox(height: 24.0),

          /// ACTIONS
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: widget.actions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12.0),
            itemBuilder: (context, index) {
              return FilterTile(
                title: widget.actions[index],
                isSelected: _index == index,
                onTap: () => setState(() => _index = index),
              );
            },
          ),
          const SizedBox(height: 24.0),

          /// APPLY BUTTON
          PrimaryButton(
            title: AppTitles.apply,
            onTap: _index == null ? null : () => widget.onTap(_index!),
          ),
        ],
      ),
    );
  }
}
