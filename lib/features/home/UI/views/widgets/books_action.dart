import 'package:bookly/constants.dart';
import 'package:bookly/core/utilities/widgets/custom_button.dart';
import 'package:flutter/material.dart';

void _noop() {}

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingSH16,
      child: SizedBox(
        height: 40,
        child: Row(
          children: const [
            Expanded(
              child: CustomButton(
                text: 'Free',
                textColor: Colors.black,
                backGroundColor: Colors.white,
                fontWeight: FontWeight.w900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                onPressed: _noop,
              ),
            ),
            Expanded(
              child: CustomButton(
                text: 'Free preview',
                textColor: Colors.white,
                backGroundColor: Color(0xffEF8262),
                fontWeight: FontWeight.w900,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                onPressed: _noop,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
