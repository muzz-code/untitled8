import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class AutoSlidePageView extends StatefulWidget {
  const AutoSlidePageView({super.key});

  @override
  _AutoSlidePageViewState createState() => _AutoSlidePageViewState();
}

class _AutoSlidePageViewState extends State<AutoSlidePageView> {
  late PageController _pageController;
  int _currentPage = 0;
  final _numPages = 3;
  final _duration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    Timer.periodic(_duration, (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Slide PageView'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _numPages,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue[(index + 1) * 100],
            child: Center(
              child: Text(
                'Page ${index + 1}',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

Container buildDecoratedContainer(
    {required double height, required double width, required Color color}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color,
    ),
  );
}

buildCustomCircularProgressIndicator() {
  return Center(
    child: Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.5), // Semi-transparent background
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: AppColors.primaryElement,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
