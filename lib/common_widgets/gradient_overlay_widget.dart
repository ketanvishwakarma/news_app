import 'package:flutter/material.dart';

class GradientOverlayWidget extends StatelessWidget {
  const GradientOverlayWidget({
    super.key,
    this.borderRadius,
  });

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: const LinearGradient(
          colors: [
            Colors.black87,
            Colors.black45,
            Colors.black87,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
