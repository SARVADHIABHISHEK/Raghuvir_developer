// ignore_for_file: library_private_types_in_public_api

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/pallete.dart';
import 'package:raghuvir_developers/src/config/pre_fix_sizebox.dart';
import 'package:raghuvir_developers/src/config/strings.dart';

class AutomationDetailPage extends StatefulWidget {
  const AutomationDetailPage({super.key});

  @override
  _AutomationDetailPageState createState() => _AutomationDetailPageState();
}

class _AutomationDetailPageState extends State<AutomationDetailPage> {
  final ValueNotifier<String?> _selectedProject = ValueNotifier(null);
  final ValueNotifier<String?> _selectedProcess = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F8),
      appBar: AppBar(title: const Text('Automation process details')),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.38,
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Automation Detail',
              style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.w500),
            ),
            const Divider(),
            CustomSizedBox.h6,

            // Projects Label
            Row(
              children: [
                Text(
                  'Projects',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0.sp,
                  ),
                ),
                Text(" *", style: TextStyle(color: Palette.redColor)),
              ],
            ),
            CustomSizedBox.h6,

            // Projects Dropdown
            ValueListenableBuilder<String?>(
              valueListenable: _selectedProject,
              builder: (context, selectedProject, _) {
                return DropdownSearch<String>(
                  selectedItem: selectedProject,
                  items: (filter, _) => Strings.projects,
                  onChanged: (value) => _selectedProject.value = value,
                  decoratorProps: const DropDownDecoratorProps(
                    decoration: InputDecoration(
                      hintText: 'Select Project Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    searchFieldProps: const TextFieldProps(
                      decoration: InputDecoration(hintText: 'Search Project'),
                    ),
                  ),
                );
              },
            ),
            CustomSizedBox.h16,

            // Process Label
            Row(
              children: [
                Text(
                  'Process',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0.sp,
                  ),
                ),
                Text(" *", style: TextStyle(color: Palette.redColor)),
              ],
            ),
            CustomSizedBox.h6,

            // Process Dropdown
            ValueListenableBuilder<String?>(
              valueListenable: _selectedProcess,
              builder: (context, selectedProcess, _) {
                return DropdownSearch<String>(
                  selectedItem: selectedProcess,
                  items: (filter, _) => Strings.processes,
                  onChanged: (value) => _selectedProcess.value = value,
                  decoratorProps: const DropDownDecoratorProps(
                    decoration: InputDecoration(
                      hintText: 'Select Process',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    searchFieldProps: const TextFieldProps(
                      decoration: InputDecoration(hintText: 'Search process'),
                    ),
                  ),
                );
              },
            ),
            CustomSizedBox.h28,

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle search
                    },
                    child: const Text('Search'),
                  ),
                ),
                CustomSizedBox.w10,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle reset
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF06547),
                    ),
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
            CustomSizedBox.h6,
          ],
        ),
      ),
    );
  }
}
