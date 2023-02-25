import 'package:flutter/material.dart';

class OnBoardingIndicator extends StatefulWidget {
  const OnBoardingIndicator({Key? key, required this.isActive}) : super(key: key);
  final bool? isActive;

  @override
  State<OnBoardingIndicator> createState() => _OnBoardingIndicatorState();
}

class _OnBoardingIndicatorState extends State<OnBoardingIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      duration: const Duration(milliseconds: 150),
      width: widget.isActive! ? 30.0 :8.0,
      decoration: BoxDecoration(
        color: widget.isActive! ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
