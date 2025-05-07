import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/config.dart';
import 'package:raghuvir_developers/src/view/automation_process/possession_enquiry.dart';

class AutomationProcess extends StatefulWidget {
  const AutomationProcess({super.key});

  @override
  State<AutomationProcess> createState() => _AutomationProcessState();
}

class _AutomationProcessState extends State<AutomationProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F8),
      appBar: AppBar(title: Text('Automation Process')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            children: [
              CustomSizedBox.h24,
              PossessionEnquiry(),
              CustomSizedBox.h24,
            ],
          ),
        ),
      ),
    );
  }
}
