import 'package:first_wtf_app/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int activeIndex = 0;
  int count = 3;

  List<OnboardingItem> items = [
    OnboardingItem(
      title: "Welcome to MediCall",
      subtitle:
          "We help you make ambulance requests for emergency and other purposes",
      asset: "assets/onboardingscr.png",
    ),
    OnboardingItem(
      title: "Get emergency medical help fast ",
      subtitle:
          "wherever you are. Need urgent help? We’ll connect you to the nearest available ambulance.",
      asset: "assets/onboardingscr.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(activeIndex);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          CustomIndicator(indicatorCount: count, activeIndex: activeIndex),
          Image.asset("", width: 300, height: 300),
          Text(
            "",
            style: GoogleFonts.aDLaMDisplay(
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),
          Text(
            "",
            style: GoogleFonts.k2d(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            activeIndex <= 0
                ? SizedBox(height: 0, width: 0)
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeIndex = activeIndex - 1;
                      });
                    },
                    child: Text("Back"),
                  ),
            ElevatedButton(
              onPressed: () {
                if (activeIndex < count - 1) {
                  setState(() {
                    activeIndex = activeIndex + 1;
                  });
                } else {
                  Navigator.of(context).pushReplacementNamed("/home");
                }
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.indicatorCount,
    required this.activeIndex,
  });

  final int indicatorCount;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        indicatorCount,
        (index) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeIndex == index ? Colors.blue : Colors.blue.shade200,
          ),
          height: 10,
          width: 10,
        ),
      ),
    );
  }
}

class OnboardingItem {
  String title;
  String subtitle;
  String asset;

  OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.asset,
  });
}
