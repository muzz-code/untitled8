import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home_page/widgets/bottom_tabs.dart';
import '../constants/colors.dart';
import '../provider/application_nav_notifier.dart';
import '../widget/app_shadow.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});
  static const routeName = '/Dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);

    return Scaffold(
      // body: const DashBoardPage(),
      body: appScreens(index: index),
      bottomNavigationBar: Container(
        width: 375.w,
        height: 58.h,
        decoration: appBoxShadowWithRadius(),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: index,
          onTap: (value) {
            ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
          },
          elevation: 0,
          items: bottomTabs,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryElement,
          unselectedItemColor: AppColors.primaryFourthElementText,
        ),
      ),
    );
  }
}
