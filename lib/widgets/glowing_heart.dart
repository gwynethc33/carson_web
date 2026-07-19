import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';

class GlowingHeart extends StatefulWidget {
  final VoidCallback? onTap;
  final double size;
  final String imagePath;

  const GlowingHeart({
    super.key,
    this.onTap,
    this.size = 220,
    this.imagePath = 'assets/images/heart.png',
  });

  @override
  State<GlowingHeart> createState() => _GlowingHeartState();
}

class _GlowingHeartState extends State<GlowingHeart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);

    _scale = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);
    final heartSize = widget.size * r;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 239, 188, 205).withOpacity(0.5),
                    blurRadius: heartSize * 0.2,
                    spreadRadius: heartSize * 0.05,
                  ),
                ],
              ),
              child: child,
            ),
          );
        },
        child: Image.asset(
          widget.imagePath,
          width: heartSize,
          height: heartSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}