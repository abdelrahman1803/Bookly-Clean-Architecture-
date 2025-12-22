import 'package:bookly/core/utilities/assets.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key, required this.popUpAnimation});

  final Animation<double> popUpAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: popUpAnimation,
      builder: (context, child) {
        return Transform.scale(scale: popUpAnimation.value, child: child);
      },
      child: Image.asset(AssetsData.logo),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.animationController,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  final AnimationController animationController;
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: fadeAnimation.value,
          child: Transform.translate(
            offset: Offset(0, slideAnimation.value.dy * 50),
            child: const TextChild(),
          ),
        );
      },
    );
  }
}

class TextChild extends StatelessWidget {
  const TextChild({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Read Free Books",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 10,
      ),
    );
  }
}
