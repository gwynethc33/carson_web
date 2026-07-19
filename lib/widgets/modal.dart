import 'package:flutter/material.dart';
import 'package:carson_web/widgets/responsive_scale.dart';
import 'package:carson_web/pages/home_page.dart';
import 'package:carson_web/widgets/photo_slider.dart';

class MemoryModal extends StatefulWidget {
  const MemoryModal({super.key});

  @override
  State<MemoryModal> createState() => _MemoryModalState();
}

class _MemoryModalState extends State<MemoryModal> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Widget> pages = const [
    MemorySlideOne(),
    MemorySlideTwo(),
  ];

 void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

   void previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

    void closeModal() {
    Navigator.pop(context);
    }

     void dispose() {
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);


    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20 * r),
      child: SizedBox(
        width: 650 * r,
height: 520 * r,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: pages,
            ),
if (currentPage > 0)
Align(
  alignment: Alignment.centerLeft,
  child: Padding(
    padding: EdgeInsets.only(left: 8 * r),
    child: IconButton(
      onPressed: previousPage,
      icon: Icon(
        Icons.arrow_circle_left_outlined,
        size: 38 * r,
        color: Colors.black,
      ),
    ),
  ),
),

            if (currentPage < pages.length - 1)
Align(
  alignment: Alignment.centerRight,
  child: Padding(
    padding: EdgeInsets.only(right: 8 * r),
    child: IconButton(
      onPressed: nextPage,
      icon: Icon(
        Icons.arrow_circle_right_outlined,
        size: 38 * r,
        color: Colors.black,
      ),
    ),
  ),
),

            if (currentPage == pages.length - 1)
              Positioned(
                right: 24 * r,
                bottom: 24 * r,
                child: ElevatedButton(
                 onPressed: () {
  Navigator.pop(context); // Close the modal

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const HomePage(),
    ),
  );
},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 227, 173, 191),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20 * r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24 * r,
                      vertical: 12 * r,
                    ),
                  ),
                  child: Text("continue ❤️",
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Runethia',
                  ),
                  ),

      
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MemorySlideOne extends StatelessWidget {
  const MemorySlideOne({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);

    return Container(
      color: const Color.fromARGB(255, 254, 254, 254),
      padding: EdgeInsets.all(24 * r),
      child: Column(
        children: [
          Text(
            "My Favorite Pictures",
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24 * r,
              fontWeight: FontWeight.bold,
              fontFamily: 'Runethia',
            ),
          ),

          SizedBox(height: 20 * r),

          const Expanded(
            child: PhotoSliderSection(),
          ),

          SizedBox(height: 16 * r),

          Text(
            "These are the pictures I smile at the most ❤️",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 16 * r,
              fontFamily: 'Runethia',
            ),
          ),
        ],
      ),
    );
  }
}

class MemorySlideTwo extends StatefulWidget {
  const MemorySlideTwo({super.key});

  @override
  State<MemorySlideTwo> createState() => _MemorySlideTwoState();
}

class _MemorySlideTwoState extends State<MemorySlideTwo>
    with SingleTickerProviderStateMixin {
  bool letterOpen = false;

  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..repeat(reverse: true);

    _shakeAnimation = Tween<double>(
      begin: -0.04,
      end: 0.04,
    ).animate(
      CurvedAnimation(
        parent: _shakeController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void openLetter() {
    _shakeController.stop();

    setState(() {
      letterOpen = true;
    });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);

    return Container(
      color: const Color(0xFFFFF8FB),
      padding: EdgeInsets.all(24 * r),
      child: Column(
        children: [
          Text(
            "A Letter For You",
            style: TextStyle(
              fontSize: 26 * r,
              fontWeight: FontWeight.bold,
              fontFamily: 'Runethia',
              color: Colors.black,
            ),
          ),

          SizedBox(height: 30 * r),

          Expanded(
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                child: letterOpen
                    ? Container(
                        key: const ValueKey("letter"),
                        width: 440 * r,
                        padding: EdgeInsets.all(26 * r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22 * r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.14),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Text(
  "Dear Carson,\n\n"
  "If I could, I would gather every beautiful thing in this world and give it to you. Every flower I pass by that catches my eyes, every seashell I come across as I walk on the beach just because they remind me of you, how beautiful and unique you are to me. You have become stitched into every part of my life. Every song that I listen to that I find myself pausing midway through because it reminds me of you, every parking lot I enter, every small and ridiculous item I find at the stores. Every uncomfortable place gives me a home feeling because I can imagine you there next to me. You have felt like home to me. It’s more than just comfort. You have reshaped my entire meaning of home. By staying through the hard times, by staying patient and still being the roof above my home constantly showing me the love I never thought I deserve. Thank you for finding me. Loving you has to be one of my greatest adventures and I find myself constantly replaying the memories because I never want to forget them. I love you more than words can express and when my words fall short, I hope you see the way I love you through my eyes, how I never let you leave when you have to go back home. And even when the world becomes unbearable I hope you can see how my heart always knows its way back home, to you. I love you not just during our happy moments but, every day, every single moment in between. I love you because your text notifications, your presence, your voice, touch, everything about you has become my favorite part of my day. Those little moments we have, when you send me goodnight messages or goodmorning messages have become reminders of how big of a blessing it is for me to have you. No matter where life takes us, I would choose you a million times over in every single universe. You make my heart feel so safe I never want to leave. You are my favorite person, my best friend ever, and the reason I wake up every morning excited for what the future holds for us.",
  textAlign: TextAlign.left,
  style: TextStyle(
    fontSize: 17 * r,
    height: 1.7,
    color: Colors.black,
    fontFamily: 'typewriter',

  ),
),
                        ),
                      )
                    : GestureDetector(
                        key: const ValueKey("envelope"),
                        onTap: openLetter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBuilder(
                              animation: _shakeAnimation,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: _shakeAnimation.value,
                                  child: child,
                                );
                              },
                              child: Image.asset(
                                "assets/images/envelope.png",
                                width: 120 * r,
                                height: 120 * r,
                              ),
                            ),

                            SizedBox(height: 22 * r),

                            Text(
                              "tap to open your letter",
                              style: TextStyle(
                                fontSize: 18 * r,
                                fontFamily: 'Runethia',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


