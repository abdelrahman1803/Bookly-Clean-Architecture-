import 'dart:ui';

import 'package:bookly/core/utilities/styles.dart';
import 'package:bookly/core/utilities/widgets/custom_button.dart';
import 'package:bookly/features/search/UI/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showRemoveFromHistoryDialog(BuildContext context, book) {
  final theme = Theme.of(context);
  final screenWidth = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.05), // blur خفيف للخلفية
    builder: (dialogContext) {
      return Center(
        child: Stack(
          children: [
            // الخلفية الضبابية الخفيفة
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
                      color: theme.colorScheme.primary.withValues(
                        alpha: 0.25,
                      ), // لون من الثيم
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
                        const Text(
                          'Remove Item from History?',
                          style: Styles.textStyle18,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        const Text(
                          'This action cannot be undone.',
                          style: Styles.textStyle14,
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
                                    .withValues(
                                      alpha: 0.8,
                                    ), // لون Cancel القديم
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.035,
                                height: screenWidth * 0.09,
                                onPressed: () => Navigator.pop(dialogContext),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.025),
                            Expanded(
                              child: CustomButton(
                                text: 'Delete',
                                textColor: Colors.white,
                                backGroundColor: Colors.red.withValues(
                                  alpha: 0.85,
                                ),
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.035,
                                height: screenWidth * 0.09,
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                  context
                                      .read<SearchBooksCubit>()
                                      .removeBookFromHistory(book);
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
