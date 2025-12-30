import 'package:bookly/constants.dart';
import 'package:bookly/core/utilities/widgets/custom_button.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingSH16,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: book.price == 0 ? 'Free' : book.price.toString(),
                textColor: Colors.black,
                backGroundColor: Colors.white,
                fontWeight: FontWeight.w900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                onPressed: () async {
                  Uri url = Uri.parse(book.purchaseUrl);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
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
                onPressed: () async {
                  Uri url = Uri.parse(book.reviewUrl);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
