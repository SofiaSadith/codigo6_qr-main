import 'package:codigo6_qr/ui/general/colors.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  Function? onPressed;
  String text;

  CommonButtonWidget({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        child: Text(
          text,
          style: TextStyle(
            color: kBrandSecondaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kBrandPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
    );
  }
}
