import 'package:doctor_help_app/containts/add_color.dart';
import 'package:doctor_help_app/containts/add_images.dart';
import 'package:doctor_help_app/screen/home_screen/home_screen.dart';
import 'package:doctor_help_app/widgets/bluteElevateButton.dart';
import 'package:flutter/material.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final int numPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  var _page = 0;
  static String routeName = 'HomeScreen';

  Widget _buildPage(String image, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(image),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          content,
          style: const TextStyle(color: colorCardTitle, fontSize: 16),
        ),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(numPage, (index) => index)
            .map((e) => Padding(
                  padding: e == numPage - 1
                      ? const EdgeInsets.all(0.0)
                      : const EdgeInsets.only(right: 10.0),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _page == e
                            ? colorActiveIndicator
                            : colorInactiveIndicator),
                  ),
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _page += _page < numPage - 1 ? 1 : 0;
                    _pageController.animateToPage(
                      _page,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: PageView(
                    controller: _pageController,
                    children: [
                      _buildPage(
                        imageOnb1,
                        "Welcome",
                        "Your health is our priority. Learn more how it works.",
                      ),
                      _buildPage(
                        imageOnb2,
                        "Find doctor near you",
                        "Find trusted general practitioners and specialists near you.",
                      ),
                      _buildPage(
                        imageOnb3,
                        "Start a chat",
                        "Online chat consultation, make an appointment with the doctor of your choice.",
                      ),
                    ],
                    onPageChanged: (index) {
                      setState(() {
                        _page = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            _buildIndicator(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _page != numPage - 1 ? _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn) : Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: colorKmain,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Center(
                        child: Text(
                          _page != numPage - 1 ? "Next" : "Lets Get Started",
                          style: const TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: _page != numPage - 1 ? Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: const Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(fontSize: 17, color: colorKmain),
                        ),
                      ),
                    ),
                  ),
                ) : Container()
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
