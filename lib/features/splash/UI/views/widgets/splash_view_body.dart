import 'package:bookly/core/utilities/routing/routes.dart';
import 'package:bookly/features/splash/UI/views/widgets/animation_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> popUpAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    nanvigateHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedLogo(popUpAnimation: popUpAnimation),
          const SizedBox(height: 10),
          AnimatedText(
            animationController: animationController,
            fadeAnimation: fadeAnimation,
            slideAnimation: slideAnimation,
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    popUpAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );

    slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.7),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.5, 1, curve: Curves.easeOut),
          ),
        );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );

    animationController.forward();
  }

  void nanvigateHome() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      // Get.to(
      //   () => const HomeView(),
      //   transition: Transition.fade,
      //   duration: kTransitionDuration,
      // );
      if (mounted) {
        GoRouter.of(context).go(Routes.homeView);
      }
    });
  }
}
