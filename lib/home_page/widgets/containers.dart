import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/core/utils/images_res.dart';
import 'package:untitled8/core/widget/image_widgets.dart';
import 'package:untitled8/home_page/models/quick_action.dart';

import '../../core/constants/colors.dart';

Widget homePageBoxIcons(List<QuickAction> quickActions) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: quickActions.map((quickAction) {
      return _QuickActionCards(quickAction: quickAction);
    }).toList(),
  );
}

Widget homePageBoxIconsTwo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        padding: const EdgeInsets.all(3),
        // height: 20,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            appImage(imagePath: ImageRes.arrowImgIcon),
            const Text("Text")
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        height: 20,
        width: 2,
        decoration: BoxDecoration(
          color: AppColors.lightRed,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(3),
        // height: 20,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            appImage(imagePath: ImageRes.arrowImgIcon),
            const Text("Text")
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        height: 20,
        width: 2,
        decoration: BoxDecoration(
          color: AppColors.blueColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(3),
        // height: 20,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            appImage(imagePath: ImageRes.arrowImgIcon),
            const Text("Text")
          ],
        ),
      )
    ],
  );
}

class _QuickActionCards extends StatelessWidget {
  const _QuickActionCards({super.key, required this.quickAction});

  final QuickAction quickAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              quickAction.icon,
              width: 20,
              height: 20,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Text(
              quickAction.name,
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'GothamLight'),
              textAlign: TextAlign.center, // Optional: center the text
              overflow: TextOverflow
                  .ellipsis, // Optional: Add ellipsis if text overflows
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildFabCircularMenu(
  BuildContext context,
  GlobalKey<FabCircularMenuPlusState> fabKey,
) {
  return Builder(
    builder: (context) => FabCircularMenuPlus(
      key: fabKey,
      alignment: Alignment.bottomRight,
      ringColor: AppColors.unionColor.withAlpha(95),
      ringDiameter: 400.0,
      ringWidth: 100.0,
      fabSize: 44.0,
      fabElevation: 8.0,
      fabIconBorder: const CircleBorder(),
      fabColor: AppColors.unionBlueColor,
      // Replace Icon with Image for fabOpenIcon and fabCloseIcon
      fabOpenIcon: Image.asset(ImageRes.fabImgIcon,
          color: Theme.of(context).primaryColor),
      fabCloseIcon: Image.asset(ImageRes.fabImgIcon,
          color: Theme.of(context).primaryColor),
      fabMargin: const EdgeInsets.all(16.0),
      animationDuration: const Duration(milliseconds: 600),
      animationCurve: Curves.easeInOutCirc,
      children: [],
    ),
  );
}
