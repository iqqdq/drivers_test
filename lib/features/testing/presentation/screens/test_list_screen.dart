import 'package:drivers_test/app/routes.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/presentation/presentation.dart';
import 'package:drivers_test/features/settings/settings.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestListScreen extends StatefulWidget {
  const TestListScreen({super.key});

  @override
  State<TestListScreen> createState() => _TestListScreenState();
}

class _TestListScreenState extends State<TestListScreen> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsChangeNotifier>().settings?.state;

    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          CustomAppBarAction(icon: AppIcons.stats, onTap: _onStatisticsTap),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '$state ${AppTitles.stateTestCatalog}',
              style: AppTextStyles.headlineTitle1,
            ),
          ),
          const SizedBox(height: 24.0),

          /// TEST CATEGORY LIST VIEW
          SizedBox(
            height: 40.0,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return TestCategoryTile(
                  title: 'Category name',
                  isSelected: index == 0,
                  onTap: () => _onTestCategoryTap(index),
                );
              },
            ),
          ),
          const SizedBox(height: 12.0),

          /// PRACTICAL TEST LIST VIEW
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                top: 12.0,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(height: 12.0),
              itemBuilder: (context, index) {
                return TestTile(
                  index: index,
                  name: 'Test name',
                  accuracy:
                      index == 0
                          ? 70
                          : index == 1
                          ? 80
                          : 0,
                  current: 0,
                  total: 0,
                  onTap: () => _onTestTap(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onStatisticsTap() {} // TODO OPEN STATISTICS SCREEN

  void _onTestCategoryTap(int index) {} // TODO SELECT TEST CATEGORY

  void _onTestTap(int index) {
    // TODO SET SELECTED TEST
    Navigator.pushNamed(context, AppRoutes.testPage);
  }
}
