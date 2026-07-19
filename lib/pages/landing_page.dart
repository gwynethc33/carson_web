import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';
import 'package:carson_web/widgets/glowing_heart.dart';
import 'package:carson_web/pages/heart_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);
  
  return Scaffold(
  backgroundColor: const Color(0xFFD9D9D9),
  body: SingleChildScrollView(
    child: Center(
    child: Padding(
  padding: EdgeInsets.only(
    top: Responsive.topPadding(context),
    left: Responsive.padding(context),
    right: Responsive.padding(context),
    bottom: Responsive.padding(context),
  ),
      child: SizedBox(
        width: Responsive.width(context),
        height: 844 * r,
        child: Stack(
          children: [
            

            // TEXT
            Positioned(
              top: 40 * r,
              left: 135 * r,
              child: Text(
                "Dear\nCarson,",
                style: TextStyle(
                  fontSize: 26 * r,
                  fontFamily: 'Runethia',
                  color: Colors.black,
                  height: 1.0,
                ),
              ),
            ),

          //heart book image
          Positioned(
            top: 70 * r,
  right: -30 * r,
            child: Transform.rotate(
              angle: .20,
              child: Image.asset(
                'assets/images/bookheart.png',
                width: 260 * r,
                height: 260 * r,
              ),
            ),
          ),

            // PHOTO STRIP
            Positioned(
              top: 70 * r,
              left: 35 * r,
              child: Transform.rotate(
                angle: -0.20,
                child: Image.asset(
                  'assets/images/photostrip.JPEG',
                  width: 90 * r,
                ),
              ),
            ),

            
            
            // HEART
            Positioned(
              top: 120 * r,
              left: 85 * r,
              child: GlowingHeart(
                size: 220,
                imagePath: 'assets/images/heart.png',
                onTap: () {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (_, animation, __) => const HeartPage(),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 600),
    ),
  );
},
              ),
            ),
          ],
        ),
      ),
    ),
  ),
  )
);
  }
}