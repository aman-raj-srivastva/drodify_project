// Make sure to add flutter_svg: ^1.1.6 (or latest) to your pubspec.yaml dependencies!
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      image: 'assests/1.png',
      overlays: [
        Positioned(
          top: 66,
          left: 44,
          child: Transform.rotate(
            angle: -0.16,
            child: _tagOverlay(Icons.place, 'Bali, Indonesia'),
          ),
        ),
        Positioned(
          bottom: 60,
          right: 36,
          child: Transform.rotate(
            angle: 0.16,
            child: _tagOverlay(Icons.nights_stay, '3 Nights'),
          ),
        ),
      ],
      title: 'Seamless Bookings,\nUnforgettable Stays',
      description:
          'Experience Comfort, Convenience, and Personalized Stays Anywhere You Go. Your Perfect Getaway Awaits—Book Easily, Travel Effortlessly, Stay Happily!',
      buttonText: 'Next',
      showAuthButtons: false,
    ),
    _OnboardingPageData(
      image: 'assests/2.png',
      overlays: [
        Positioned(
          top: 72,
          right: 22,
          child: _bubbleOverlay1('Peaceful and relaxing! 🪴'),
        ),
        Positioned(
          left: 22,
          bottom: 150,
          child: _bubbleOverlay2('Super comfy stay! 😍'),
        ),
      ],
      title: 'Your Comfort\nis Our Priority',
      description:
          'Enjoy a cozy stay with top-notch service and a warm atmosphere. Spacious rooms, modern amenities, and a peaceful ambiance await you.',
      buttonText: 'Next',
      showAuthButtons: false,
    ),
    _OnboardingPageData(
      image: 'assests/3.png',
      overlays: [
        Positioned(
          top: 86,
          left: 60,
          child: Transform.rotate(
            angle: -0.12,
            child: _svgLogo1('assests/visa.svg'),
          ),
        ),
        Positioned(
          top: 30,
          left: 200,
          child: _svgLogo2('assests/mastercard.svg'),
        ),
        Positioned(
          top: 76,
          right: 60,
          child: Transform.rotate(
            angle: 0.12,
            child: _svgLogo2('assests/paypal.svg'),
          ),
        ),
        Positioned(bottom: 60, left: 0, right: 0, child: _paymentCardOverlay()),
      ],
      title: 'Smooth Payments,\nUnlimited Choices',
      description:
          'Pay effortlessly with seamless integration to various payment methods. From credit cards to digital wallets, choose what suits you best.',
      buttonText: 'Login',
      showAuthButtons: true,
    ),
  ];

  static Widget _tagOverlay(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.green),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  static Widget _bubbleOverlay1(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(6),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }

  static Widget _bubbleOverlay2(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }

  static Widget _svgLogo1(String asset) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: SvgPicture.asset(asset),
    );
  }

  static Widget _svgLogo2(String asset) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: SvgPicture.asset(asset),
    );
  }

  static Widget _svgLogo3(String asset) {
    return Container(
      width: 38,
      height: 38,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: SvgPicture.asset(asset),
    );
  }

  static Widget _paymentCardOverlay() {
    return Center(
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: _svgLogo3('assests/logo.svg'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Payment Successful! ✅',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Enjoy your stay! 🏡✨',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(236, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 7),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'now',
                  style: TextStyle(
                    fontSize: 9,
                    color: Color.fromARGB(236, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to login or home
    }
  }

  void _onSkip() {
    // TODO: Navigate to login or home
  }

  void _onSignUp() {
    // TODO: Navigate to sign up
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, i) {
                  final page = _pages[i];
                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Left background image (rotated, grayscale)
                          Positioned(
                            left: -100,
                            top: 40,
                            child: Opacity(
                              opacity: 0.5,
                              child: Transform.rotate(
                                angle: -0.18,
                                child: ColorFiltered(
                                  colorFilter:
                                      const ColorFilter.matrix(<double>[
                                        0.2126,
                                        0.7152,
                                        0.0722,
                                        0,
                                        0,
                                        0.2126,
                                        0.7152,
                                        0.0722,
                                        0,
                                        0,
                                        0.2126,
                                        0.7152,
                                        0.0722,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        1,
                                        0,
                                      ]),
                                  child: Image.asset(
                                    _pages[(i + 2) % _pages.length].image,
                                    height: 220,
                                    width: 240,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Right background image (rotated, grayscale)
                          Positioned(
                            right: -100,
                            top: 40,
                            child: Opacity(
                              opacity: 0.5,
                              child: Transform.rotate(
                                angle: 0.18,
                                child: ColorFiltered(
                                  colorFilter:
                                      const ColorFilter.matrix(<double>[
                                        0.2126,
                                        0.7152,
                                        0.0722,
                                        0,
                                        0,
                                        0.2126,
                                        0.7152,
                                        0.0722,
                                        0,
                                        0,
                                        0.2126,
                                        0.7152,
                                        0.0722,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        1,
                                        0,
                                      ]),
                                  child: Image.asset(
                                    _pages[(i + 1) % _pages.length].image,
                                    height: 220,
                                    width: 240,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Main hero image (center, not rotated, not filtered)
                          Center(
                            child: Card(
                              color: Colors.white,
                              elevation: 12,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              margin: const EdgeInsets.only(
                                top: 48,
                                left: 8,
                                right: 8,
                                bottom: 8,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 12,
                                  right: 12,
                                  bottom: 46,
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  margin: EdgeInsets.zero,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.asset(
                                      page.image,
                                      height: 220,
                                      width: 240,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ...page.overlays,
                        ],
                      ),
                      const SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 10,
                  ),
                  width: _currentPage == i ? 32 : 8,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _currentPage == i ? Colors.green : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 84, 198, 88),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: _onNext,
                      child: Text(
                        _currentPage == _pages.length - 1 ? 'Login' : 'Next',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (_pages[_currentPage].showAuthButtons)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: _onSignUp,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: _onSkip,
                        child: const Text(
                          'Skip',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  final String image;
  final List<Widget> overlays;
  final String title;
  final String description;
  final String buttonText;
  final bool showAuthButtons;

  const _OnboardingPageData({
    required this.image,
    required this.overlays,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.showAuthButtons,
  });
}
