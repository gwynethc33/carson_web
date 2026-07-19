import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';

class CoverSlide extends StatefulWidget {
  const CoverSlide({super.key});

  @override
  State<CoverSlide> createState() => _CoverSlideState();
}

class _CoverSlideState extends State<CoverSlide> {
  bool showText = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        setState(() {
          showText = true;
        });
      }
    });
  }

  @override
Widget build(BuildContext context) {
  final r = Responsive.scale(context);
  final size = MediaQuery.of(context).size;
  final width = MediaQuery.of(context).size.width;

  String image;

  if (width >= 1200) {
    image = 'assets/images/cover.JPEG';
  } else if (width >= 768) {
    image = 'assets/images/coverphone.JPEG';
  } else {
    image = 'assets/images/coverphone.JPEG';
  }



  return SizedBox(
    width: size.width,
    height: size.height,
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: Container(
            color: Colors.white.withOpacity(0.35),
          ),
        ),

        Positioned(
          left: 40 * r,
          top: 60 * r,
          child: AnimatedOpacity(
            opacity: showText ? 1 : 0,
            duration: const Duration(milliseconds: 1200),
            child: Text(
              "To my love, Carson\nI love you",
              style: TextStyle(
                fontSize: 32 * r,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}

