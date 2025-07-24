import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

class CurvedEdgeCakeSlice extends StatelessWidget {
  const CurvedEdgeCakeSlice({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final height = MediaQuery.of(context).size.height * 0.33;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: ClipPath(
          clipper: LeftCurvedBiteClipper(),
          child: Container(
            width: width,
            height: height,
            color: AppColors.lightprimaryColor,
          ),
        ),
      ),
    );
  }
}

class LeftCurvedBiteClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final curveDepth = size.width * 0.15; // How deep the curved notch goes
    // Vertical length of the curve

    // Start at top-right
    path.moveTo(size.width, 0);
    // Line to top-left, just before curve
    path.lineTo(curveDepth, 0);

    // Curved "bite" inward
    path.quadraticBezierTo(
      0, size.height / 2, // control point (deep into the left)
      curveDepth, size.height, // endpoint
    );

    // Continue around the bottom and right
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
