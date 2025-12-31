import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
    required this.scrollController,
    required this.isVisibleListenable,
  });

  final ScrollController scrollController;
  final ValueListenable<bool> isVisibleListenable;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isVisibleListenable,
      builder: (context, isVisible, _) {
        if (!isVisible) return const SizedBox.shrink();
        return FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOut,
            );
          },
          child: const Icon(Icons.arrow_upward),
        );
      },
    );
  }
}
