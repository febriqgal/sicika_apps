import 'package:ciptakarya/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_slider/introduction_slider.dart';
import '../controllers/introduction_page_controller.dart';

class IntroductionPageView extends GetView<IntroductionPageController> {
  const IntroductionPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionSlider(
        selectedDotColor: Colors.amber,
        onDone: const LoginView(),
        items: [
          IntroductionSliderItem(
            image: Image.asset(
              'assets/Ciptakarya.png',
              height: 100,
            ),
            title: "Introduction Slider 1",
            description: "This is a description of introduction slider 1.",
          ),
          IntroductionSliderItem(
            image: Image.asset(
              'assets/Ciptakarya.png',
              height: 100,
            ),
            title: "Introduction Slider 2",
            description: "This is a description of introduction slider 2.",
          ),
          IntroductionSliderItem(
            image: Image.asset(
              'assets/Ciptakarya.png',
              height: 100,
            ),
            title: "Introduction Slider 3",
            description: "This is a description of introduction slider. 3",
          ),
        ],
      ),
    );
  }
}
