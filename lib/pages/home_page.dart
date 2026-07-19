import 'package:carson_web/widgets/cover_section.dart';
import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';
import 'package:carson_web/widgets/date_counter.dart';
import 'package:carson_web/widgets/songs_section.dart';
import 'package:carson_web/widgets/video_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   final r = Responsive.scale(context);
   
   
   
    return Scaffold(
  backgroundColor: const Color(0xFFD9D9D9),
  body: SingleChildScrollView(
    child: Column(
      children: [
        const CoverSlide(),

        Center(
          child: Padding(
            padding: EdgeInsets.all(Responsive.padding(context)),
            child: SizedBox(
              width: Responsive.width(context),
              child: Column(
                children: [
                  SizedBox(height: 70 * r),

                  const DateCounter(), 

                ],
              ),
            ),
          ),
        ),
        const SongsSection(),

        const VideoSection(),
      ],
    ),
  ),
);
  }
}