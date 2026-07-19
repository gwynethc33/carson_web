import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';

class PhotoSliderSection extends StatefulWidget {
  const PhotoSliderSection({super.key});

  @override
  State<PhotoSliderSection> createState() => _PhotoSliderSectionState();
}

class _PhotoSliderSectionState extends State<PhotoSliderSection> {
  final PageController _controller = PageController();
  int currentPhoto = 0;
  Timer? _timer;

  final List<String> photos = const [
    'assets/images/photo1.jpg',
    'assets/images/photo2.jpg',
    'assets/images/photo3.jpg',
    'assets/images/photo4.jpg',
  ];
  

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;

      final nextPage = currentPhoto == photos.length - 1 ? 0 : currentPhoto + 1;

      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);
    final width = MediaQuery.of(context).size.width;

  final aspectRatio = width >= 1000
      ? 16 / 9
      : width >= 600
          ? 3 / 2
          : 4 / 5;

return Center(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: 800 * r, 
    ),
    child: Container(
      padding: EdgeInsets.all(20 * r),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 174, 174),
        borderRadius: BorderRadius.circular(24 * r),
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20 * r),
          child: PageView.builder(
            controller: _controller,
            itemCount: photos.length,
            onPageChanged: (index) {
              setState(() {
                currentPhoto = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                photos[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    ),
  ),
);
  }
}