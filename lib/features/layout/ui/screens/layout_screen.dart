import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/features/layout/ui/tabs/attendance_tab.dart';
import 'package:mobile_app_project/features/layout/ui/tabs/home_tab.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectIndex = 0;
  List<Widget> selectedPage = [HomeTab(), AttendanceTab()];
  List<MapEntry<String, String>> selectedAppBarData = [
    MapEntry(
      'homeAppbarTitle'.tr(),
      DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
    ),
    MapEntry('attendanceAppBarTitle'.tr(), ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedAppBarData[selectIndex].key,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            selectedAppBarData[selectIndex].value.isNotEmpty
                ? Text(
                  selectedAppBarData[selectIndex].value.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
                : SizedBox(),
          ],
        ),
        elevation: 0.1,
        // or 1–4 to match NavBar subtle shadow
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        // disables M3 tint
        shadowColor: Colors.grey[100]?.withAlpha(
          (0.7 * 255).round(),
        ), // subtle shadow like NavBar
      ),
      body: selectedPage[selectIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,

        backgroundColor: Theme.of(context).colorScheme.surface,
        overlayColor: WidgetStateColor.transparent,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'homeLabel'.tr(),
          ),
          NavigationDestination(
            icon: Icon(Icons.fact_check_outlined),
            selectedIcon: Icon(Icons.fact_check),
            label: 'attendanceLabel'.tr(),
          ),
        ],
        onDestinationSelected: (value) {
          setState(() {
            selectIndex = value;
          });
        },
        selectedIndex: selectIndex,
      ),
    );
  }
}
