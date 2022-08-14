import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPagechanges(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentpage = 0;

  @override
  next() {
    currentpage++;
    pageController.animateToPage(currentpage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  onPagechanges(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
