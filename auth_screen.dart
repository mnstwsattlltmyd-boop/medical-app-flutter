import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AuthScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const AuthScreen({Key? key, required this.onLoginSuccess}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final patientIdController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    patientIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: MedicalColors.lightGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Header
                  const Text(
                    'صحتك أولاً',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: MedicalColors.medicalBlue,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'تطبيق الرعاية الطبية الذكي',
                    style: TextStyle(
                      fontSize: 14,
                      color: MedicalColors.gray,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 32),

                  // Tabs
                  Container(
                    decoration: BoxDecoration(
                      color: MedicalColors.lightGray,
                      borderRadius: BorderRadius.circular(12),
                      padding: const EdgeInsets.all(4),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isLogin = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color:
                                    isLogin ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: isLogin
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                        )
                                      ]
                                    : [],
                              ),
                              child: const Text(
                                'تسجيل الدخول',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MedicalColors.medicalBlue,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isLogin = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color:
                                    !isLogin ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: !isLogin
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                        )
                                      ]
                                    : [],
                              ),
                              child: const Text(
                                'حساب جديد',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MedicalColors.medicalBlue,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Form Fields
                  if (isLogin) ...[
                    _buildTextField(
                      controller: emailController,
                      label: 'البريد الإلكتروني',
                      hint: 'your@email.com',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: passwordController,
                      label: 'كلمة المرور',
                      hint: '••••••••',
                      icon: Icons.lock_outlined,
                      isPassword: true,
                    ),
                  ] else ...[
                    _buildTextField(
                      controller: nameController,
                      label: 'الاسم الكامل',
                      hint: 'أحمد محمد',
                      icon: Icons.person_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: emailController,
                      label: 'البريد الإلكتروني',
                      hint: 'your@email.com',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: passwordController,
                      label: 'كلمة المرور',
                      hint: '••••••••',
                      icon: Icons.lock_outlined,
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: patientIdController,
                      label: 'رقم المريض (اختياري)',
                      hint: 'رقم المريض',
                      icon: Icons.badge_outlined,
                    ),
                  ],
                  const SizedBox(height: 32),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: widget.onLoginSuccess,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MedicalColors.medicalBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        isLogin ? 'دخول' : 'إنشاء الحساب',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: MedicalColors.darkBlue,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: hint,
            hintTextDirection: TextDirection.rtl,
            prefixIcon: Icon(icon, color: MedicalColors.medicalBlue),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: MedicalColors.lightGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: MedicalColors.lightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MedicalColors.medicalBlue, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
