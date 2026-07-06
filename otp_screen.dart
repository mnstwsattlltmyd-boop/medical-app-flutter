import 'package:flutter/material.dart';
import '../constants/colors.dart';

class OTPScreen extends StatefulWidget {
  final VoidCallback onVerify;

  const OTPScreen({Key? key, required this.onVerify}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleOTPInput(int index, String value) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
  }

  void _handleOTPBackspace(int index) {
    if (otpControllers[index].text.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  bool get isOTPComplete {
    return otpControllers.every((controller) => controller.text.isNotEmpty);
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
                  const SizedBox(height: 40),
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: MedicalColors.medicalGreen.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shield_outlined,
                      size: 48,
                      color: MedicalColors.medicalGreen,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  const Text(
                    'تأكيد الحساب',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: MedicalColors.darkBlue,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'أدخل الرمز المرسل إلى بريدك الإلكتروني',
                    style: TextStyle(
                      fontSize: 16,
                      color: MedicalColors.gray,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 48),

                  // OTP Input Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: TextField(
                            controller: otpControllers[index],
                            focusNode: focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (value) {
                              _handleOTPInput(index, value);
                              setState(() {});
                            },
                            onKey: (event) {
                              if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
                                _handleOTPBackspace(index);
                              }
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: MedicalColors.medicalBlue,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: MedicalColors.lightGray,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: MedicalColors.medicalBlue,
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: MedicalColors.darkBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Verify Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isOTPComplete ? widget.onVerify : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MedicalColors.medicalBlue,
                        disabledBackgroundColor: MedicalColors.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'تفعيل',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Resend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'إعادة إرسال',
                          style: TextStyle(
                            color: MedicalColors.medicalBlue,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'لم يصلك الرمز؟',
                        style: TextStyle(
                          color: MedicalColors.gray,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
