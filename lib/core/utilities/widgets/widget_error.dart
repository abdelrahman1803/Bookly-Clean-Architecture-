import 'package:bookly/core/utilities/styles.dart';
import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  const WidgetError({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errMessage, style: Styles.textStyle18);
  }
}
