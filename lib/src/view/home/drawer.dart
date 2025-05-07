import 'package:flutter/material.dart';
import 'package:raghuvir_developers/src/config/app_routers.dart';
import 'package:raghuvir_developers/src/view/automation_data/automation_data.dart';
import 'package:raghuvir_developers/src/view/automation_process/automation_process.dart';
import 'package:raghuvir_developers/src/view/projects/project_list_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF3F5289), // Dark blue background
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MENU',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 24),

              _buildMenuItem(
                Icons.work_outline,
                'Projects',
                onTap: () {
                  Navigate.to(ProjectListView());
                },
              ),
              _buildMenuItem(
                Icons.settings_suggest_outlined,
                'Automation Process',
                onTap: () {
                  Navigate.to(AutomationProcess());
                },
              ),
              _buildMenuItem(
                Icons.analytics_outlined,
                'Automation Data',
                onTap: () {
                  Navigate.to(AutomationDetailPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
            SizedBox(width: 12),
            Text(label, style: TextStyle(color: Colors.white70, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
