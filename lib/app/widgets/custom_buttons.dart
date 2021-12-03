import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SocialElevatedButton extends StatelessWidget {
  final String buttonText;
  final String imgText;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback callback;

  const SocialElevatedButton({
    Key? key,
    required this.buttonText,
    required this.imgText,
    required this.callback,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/$imgText',
              width: 36,
              fit: BoxFit.cover,
            ),
            Text(
              buttonText,
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            SizedBox()
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
      ),
    );
  }
}

class NormalElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final callback;
  final isLoading;

  const NormalElevatedButton({
    Key? key,
    required this.buttonText,
    required this.callback,
    required this.backgroundColor,
    required this.textColor,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onSurface: Colors.indigo,
        primary: backgroundColor,
      ),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 36,
            ),
            !isLoading
                ? Text(
                    buttonText,
                    style: TextStyle(fontSize: 16, color: textColor),
                  )
                : SpinKitFadingCircle(
                    color: Colors.indigo,
                    size: 36,
                  ),
            SizedBox(
              height: 36,
            )
          ],
        ),
      ),
    );
  }
}
