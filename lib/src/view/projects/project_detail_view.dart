// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/config.dart';

class ProjectDetailsView extends StatefulWidget {
  const ProjectDetailsView({super.key});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.loginBgColor,
      appBar: AppBar(title: Text('Testing project')),
      body: Column(
        children: [
          CustomSizedBox.h20,
          Center(child: CustomTabBar()),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [BuildingBlockView(), BuildingBlockView()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  final List<String> tabs = ['My Work', 'My View', 'Full View'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.loginBgColor,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(tabs.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF417BFB) : Colors.transparent,
                border: Border.all(color: Color(0xFF417BFB)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(index == 0 ? 6 : 0),
                  bottomLeft: Radius.circular(index == 0 ? 6 : 0),
                  topRight: Radius.circular(index == tabs.length - 1 ? 6 : 0),
                  bottomRight: Radius.circular(
                    index == tabs.length - 1 ? 6 : 0,
                  ),
                ),
              ),
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 250),
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF417BFB),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
                child: Text(tabs[index]),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BuildingBlockView extends StatelessWidget {
  final String buildingName = "B Building";
  final List<List<int>> wings = [
    [105, 205, 305, 405, 505, 605, 705, 805, 905, 1005, 1105, 1205, 1305],
    [106, 206, 306, 406, 506, 606, 706, 806, 906, 1006, 1106, 1206, 1306],
  ];

  BuildingBlockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Column(
              children: [
                Text(
                  buildingName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(),

                Container(
                  height: 30.0.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 12.0.w),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide.none,
                      top: BorderSide(color: Colors.black12),
                      left: BorderSide(color: Colors.black12),
                      right: BorderSide(color: Colors.black12),
                    ),
                  ),
                  child: Text(
                    'Wing - 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0.sp,
                    ),
                  ),
                ),

                for (int i = 0; i < wings.first.length; i++) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: Table(
                      border: TableBorder.all(
                        width: 0.5,
                        color: Colors.black12,
                      ),
                      columnWidths: <int, TableColumnWidth>{
                        0: FixedColumnWidth(50.0.w),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,

                      children: [
                        TableRow(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                wings.first[i].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            Text(''),

                            Padding(
                              padding: EdgeInsets.all(10.0.r),
                              child: Container(
                                height: 35.0.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff417bfb),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  value: null,
                                  dropdownColor: Colors.white,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  hint: Text(
                                    'DEFAULT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  underline: SizedBox(),
                                  style: TextStyle(
                                    color: Palette.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onChanged: (val) {},
                                  items:
                                      ['DEFAULT', 'OPTION 1', 'OPTION 2']
                                          .map(
                                            (e) => DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                  color: Palette.black,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
