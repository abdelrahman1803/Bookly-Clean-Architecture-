import 'dart:ui';

import 'package:bookly/core/utilities/styles.dart';
import 'package:bookly/core/utilities/widgets/custom_button.dart';
import 'package:bookly/features/search/UI/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void _showConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String confirmText,
  required VoidCallback onConfirm,
}) {
  final theme = Theme.of(context);
  final screenWidth = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.05),
    builder: (dialogContext) {
      return Center(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black.withValues(alpha: 0.05)),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    width: screenWidth * 0.85,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenWidth * 0.06,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.colorScheme.onPrimary.withValues(
                          alpha: 0.2,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          size: screenWidth * 0.12,
                          color: Colors.red,
                        ),
                        SizedBox(height: screenWidth * 0.04),
                        Text(
                          title,
                          style: Styles.textStyle18.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Text(
                          message,
                          style: Styles.textStyle14.copyWith(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenWidth * 0.05),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'Cancel',
                                textColor: Colors.white,
                                backGroundColor: Colors.deepPurpleAccent
                                    .withValues(alpha: 0.8),
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.038,
                                height: screenWidth * 0.10,
                                onPressed: () => Navigator.pop(dialogContext),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.025),
                            Expanded(
                              child: CustomButton(
                                text: confirmText,
                                textColor: Colors.white,
                                backGroundColor: Colors.red.withValues(
                                  alpha: 0.85,
                                ),
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.038,
                                height: screenWidth * 0.10,
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                  onConfirm();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showRemoveFromHistoryDialog(BuildContext context, book) {
  _showConfirmDialog(
    context: context,
    title: 'Remove Item from History?',
    message: 'This action cannot be undone.',
    confirmText: 'Delete',
    onConfirm: () {
      context.read<SearchBooksCubit>().removeBookFromHistory(book);
    },
  );
}

void showClearHistoryDialog(BuildContext context) {
  _showConfirmDialog(
    context: context,
    title: 'Clear search history?',
    message: 'This will remove all items from history.',
    confirmText: 'Clear',
    onConfirm: () {
      context.read<SearchBooksCubit>().clearSearchHistory();
    },
  );
}
