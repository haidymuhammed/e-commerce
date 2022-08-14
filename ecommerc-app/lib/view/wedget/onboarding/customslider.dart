import 'package:ecommerce/controller/onboarding_controllar.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasourse/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPagechanges(val);
        },
        itemCount: onBoardinglist.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onBoardinglist[i].title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  onBoardinglist[i].image!,
                  width: 200,
                  height: 135,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardinglist[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ))
              ],
            ));
  }
}
