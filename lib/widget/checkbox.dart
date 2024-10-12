import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool required;
  final bool active;
  final String url;
  final String? webTitle;

  const CustomCheckBox({
    Key? key,
    required this.title,
    required this.onTap,
    this.active = false,
    this.required = false,
    this.url = '',
    this.webTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 2, top: 14, bottom: 14, left: 2),
        decoration: BoxDecoration(),
        child: Container(),
      ),
    );
  }
}
