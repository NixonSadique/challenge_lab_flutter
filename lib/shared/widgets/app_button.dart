import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double height;

  const AppButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.text,
    this.width,
    this.height = 50,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Color(0xff005656),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),

        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
                ),
              ),
      ),
    );
  }
}
