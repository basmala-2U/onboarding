import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final Color primaryColor = const Color(0xFF9B3C82);
  final Color blackColor = Colors.black;
  final Color whiteColor = Colors.white;

  List<Map<String, String>> pages = [
    {
      "title": "Practice Mindfulness",
      "desc": "Get on the right track towards mindfulness",
      "image": "assets/images/photo1.png"
    },
    {
      "title": "Get started with Yoga",
      "desc": "Easily get started with your yoga journey",
      "image": "assets/images/photo2.png"
    },
    {
      "title": "Unplug your life",
      "desc": "Set up different measures to start with your life",
      "image": "assets/images/photo3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [

                      Image.asset(
                        pages[index]["image"]!,
                        height: 454,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(height: 20),


                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [


                              Text(
                                pages[index]["title"]!,
                                style: GoogleFonts.grandHotel(
                                  fontSize: 36,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 15),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  pages[index]["desc"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: blackColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: currentPage == 2


                  ? SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )

                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Row(
                    children: List.generate(
                      pages.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: currentPage == index ? 16 : 10,
                        height: currentPage == index ? 16 : 10,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? primaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
