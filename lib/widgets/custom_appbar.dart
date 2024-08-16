import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset("assets/images/arrow.png"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Image.asset("assets/images/settings.png"),
          ],
        ),
        Image.asset("assets/images/star.png"),
      ],
    );
  }
}
