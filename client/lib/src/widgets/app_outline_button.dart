import 'package:flutter/material.dart';

class AppOutlineButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? data;
  final double? width;
  final double? height;
  final Color? bg;
  final Color? tc;
  const AppOutlineButton({
    Key? key,
    this.onPressed,
    this.data,
    this.width,
    this.height,
    this.bg,
    this.tc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg ??
              (onPressed == null
                  ? const Color(0xFF1F2226)
                  : const Color(0xFF7A58FF)),
          disabledBackgroundColor: const Color(0xFF1F2226),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          textStyle: TextStyle(
            color: onPressed == null ? const Color(0xFF6D7177) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data ?? "j",
              style: TextStyle(
                color: tc ??
                    (onPressed == null
                        ? const Color(0xFF6D7177)
                        : Colors.white),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
