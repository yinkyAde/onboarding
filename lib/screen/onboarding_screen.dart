import 'package:flutter/material.dart';
import 'package:onboarding/widgets/indicator.dart';

import '../widgets/image_list_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Widget> buildIndicators() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i == 1
          ? const OnBoardingIndicator(isActive: true)
          : const OnBoardingIndicator(isActive: false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2a2a2a),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -75.0,
              // bottom: ,
              // right: ,
              left: -165.0,
              child: Row(
                children: const [
                  ImageViewList(startIndex: 0),
                  ImageViewList(startIndex: 3),
                  ImageViewList(startIndex: 5),
                ],
              )),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.white60,
                  Colors.white,
                  Colors.white,
                ], begin: Alignment.topCenter, end: Alignment.center),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "OnBoarding Sample\nIn Flutter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        height: 1.3),
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    "Try something more cool rather than\nthe default onboardings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        height: 1.3),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicators(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40.0,
              left: 24.0,
              right: 24.0,
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )
                  ),
                  onPressed: () {  },
                  child: const Text("Sign Up",style: TextStyle(fontSize: 14.0),),
                ),
              ),),
        ],
      ),
    );
  }
}
