import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/colors.dart';
import '../../core/utils/images_res.dart';
import '../../core/widget/app_bar.dart';
import '../../core/widget/text_widgets.dart';
import '../../home_page/utils/quick_action_cards_data.dart';
import '../../home_page/widgets/containers.dart';
import '../../home_page/widgets/cutom_row_widget.dart';
import '../controllers/login_controller.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  static const routeName = '/HomePageScreen';

  @override
  ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    log("home page called");
    _loginController = LoginController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(
        context,
        "Welcome, Sam",
        iconName: ImageRes.notificationIcon,
        prefixedImage: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 35),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryElementBg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    ),
                    child: const DashboardHeaderWidget(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 54.0, bottom: 36.0, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text18Heading(text: "Quick Actions", color: Colors.white),
                    const SizedBox(height: 10),
                    homePageBoxIcons(quickActionsData),
                    const SizedBox(height: 7),
                    homePageBoxIcons(quickActionsDataTwo),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text18Heading(
                            text: "Some text", color: Colors.white),
                        text18Heading(
                            text: "Some text", color: Colors.white),
                      ],
                    ),
                    _buildImageCarousel(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryElementBg,
          tooltip: 'Increment',
          onPressed: () {},
          child: Image.asset(
            ImageRes.fabImgIcon,
            color: Colors.white,
            width: 24.0, // Set the desired width
            height: 24.0, // Set the desired height
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 130.0, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of images you want to display
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                ImageRes.giftCardsImg,
                // Replace with your image URLs
                fit: BoxFit.cover,
                width: 200.0, // Width of each image
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }
}
