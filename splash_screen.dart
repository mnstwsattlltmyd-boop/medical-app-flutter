import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const SplashScreen({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 3), widget.onComplete);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: MedicalColors.primaryGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: const Icon(
                  Icons.favorite,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'صحتك أولاً',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 16),
              const Text(
                'عناية ذكية لمؤشراتك الحيوية',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
