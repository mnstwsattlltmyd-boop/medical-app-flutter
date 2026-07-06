import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/medical_profile_screen.dart';
import 'screens/robot_connection_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق الرعاية الطبية الذكي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2c7be5),
          brightness: Brightness.light,
        ),
        fontFamily: 'Segoe UI',
      ),
      home: const MedicalAppNavigator(),
    );
  }
}

class MedicalAppNavigator extends StatefulWidget {
  const MedicalAppNavigator({Key? key}) : super(key: key);

  @override
  State<MedicalAppNavigator> createState() => _MedicalAppNavigatorState();
}

class _MedicalAppNavigatorState extends State<MedicalAppNavigator> {
  String currentScreen = 'splash';

  void navigateTo(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    switch (currentScreen) {
      case 'splash':
        return SplashScreen(onComplete: () => navigateTo('auth'));
      case 'auth':
        return AuthScreen(onLoginSuccess: () => navigateTo('otp'));
      case 'otp':
        return OTPScreen(onVerify: () => navigateTo('profile'));
      case 'profile':
        return MedicalProfileScreen(onSave: () => navigateTo('robot'));
      case 'robot':
        return RobotConnectionScreen(onConnect: () => navigateTo('dashboard'));
      case 'dashboard':
        return const DashboardScreen();
      default:
        return SplashScreen(onComplete: () => navigateTo('auth'));
    }
  }
}
