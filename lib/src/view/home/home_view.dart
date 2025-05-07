import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/config.dart';
import 'package:raghuvir_developers/src/view/home/drawer.dart';
import 'package:raghuvir_developers/src/view/profile/update_profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Raghuvir Developer'),

        actions: [
          GestureDetector(
            onTap: () {
              Navigate.to(UpdateProfile());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 18.0.w, bottom: 10.0.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0.r),
                child: Image.asset(ConstImages.dummyProfile),
              ),
            ),
          ),
        ],
      ),
      body: Center(child: Text('Center text')),
    );
  }
}


