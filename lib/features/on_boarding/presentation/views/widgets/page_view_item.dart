import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title});
  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
