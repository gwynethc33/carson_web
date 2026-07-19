import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';
import 'package:carson_web/widgets/modal.dart';

 class HeartPage extends StatefulWidget {
  const HeartPage({super.key});

  @override
  State<HeartPage> createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {
  int filledHearts = 0;

  void fillHeart(){

    if (filledHearts >= 3) return;

    setState(() {
      filledHearts++;
    });

   if (filledHearts == 3) {
  Future.delayed(const Duration(milliseconds: 500), () {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const MemoryModal(),
    );
  });
}
  }



  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);

    return Scaffold (
      backgroundColor: const Color(0xFFD9D9D9),
      body: Center(
        child: SizedBox(
        width: Responsive.width(context),
          height: 844 * r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text (
                "YOU FILL MY",
                style: TextStyle(
                  fontSize: 40 * r,
                  fontFamily: 'ByteBounce',
                  color: Colors.black,
                  height: 1.0,
                ),
              ),
                Text("HEART",
                style: TextStyle(
                  fontSize: 60 * r,
                  fontFamily: 'ByteBounce',
                  color: const Color.fromARGB(255, 255, 22, 22),
                  height: 1.0,
                ),
              ),
            SizedBox(height: 40 * r),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    for (int i = 0; i < 3; i++)
      GestureDetector(
        onTap: fillHeart,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12 * r),
          child: Image.asset(
            i < filledHearts
                ? 'assets/images/heart_filled.png'
                : 'assets/images/heart_empty.png',
            width: 70 * r,
            height: 70 * r,
          ),
        ),
      ),
  ],
)
            ]
          )
          
          
          )
        )
    );

  }
}