import 'package:flutter/material.dart';
import '../constants/colors.dart';

class RobotConnectionScreen extends StatefulWidget {
  final VoidCallback onConnect;

  const RobotConnectionScreen({Key? key, required this.onConnect})
      : super(key: key);

  @override
  State<RobotConnectionScreen> createState() => _RobotConnectionScreenState();
}

class _RobotConnectionScreenState extends State<RobotConnectionScreen>
    with SingleTickerProviderStateMixin {
  bool isConnecting = false;
  String connectionStatus = 'جاري البحث عن أجهزة...';
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _handleConnect() async {
    setState(() {
      isConnecting = true;
      connectionStatus = 'جاري الاتصال بالروبوت...';
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      connectionStatus = 'تم الاتصال بنجاح!';
    });

    await Future.delayed(const Duration(seconds: 1500, milliseconds: 500));

    widget.onConnect();
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

                  // Robot Animation
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Pulse Ring
                      ScaleTransition(
                        scale: Tween<double>(begin: 1.0, end: 1.5).animate(
                          CurvedAnimation(
                            parent: _pulseController,
                            curve: Curves.easeOut,
                          ),
                        ),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: MedicalColors.medicalGreen.withOpacity(
                                1.0 - _pulseController.value,
                              ),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      // Robot Icon
                      const Icon(
                        Icons.smart_toy_outlined,
                        size: 80,
                        color: MedicalColors.medicalBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Title
                  const Text(
                    'ربط الروبوت الطبي',
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
                    'يرجى التأكد من تشغيل الروبوت لربطه بالتطبيق',
                    style: TextStyle(
                      fontSize: 16,
                      color: MedicalColors.gray,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 48),

                  // Status Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: connectionStatus == 'تم الاتصال بنجاح!'
                          ? MedicalColors.medicalGreen.withOpacity(0.1)
                          : MedicalColors.medicalBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: connectionStatus == 'تم الاتصال بنجاح!'
                            ? MedicalColors.medicalGreen
                            : MedicalColors.medicalBlue,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isConnecting && connectionStatus != 'تم الاتصال بنجاح!')
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                MedicalColors.medicalBlue,
                              ),
                            ),
                          )
                        else if (connectionStatus == 'تم الاتصال بنجاح!')
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: MedicalColors.medicalGreen,
                            ),
                          )
                        else
                          const SizedBox(width: 20),
                        const SizedBox(width: 12),
                        Text(
                          connectionStatus,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: connectionStatus == 'تم الاتصال بنجاح!'
                                ? MedicalColors.medicalGreen
                                : MedicalColors.medicalBlue,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Connect Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isConnecting ? null : _handleConnect,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MedicalColors.medicalBlue,
                        disabledBackgroundColor: MedicalColors.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isConnecting)
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          else
                            const Icon(Icons.bluetooth_connected),
                          const SizedBox(width: 12),
                          Text(
                            isConnecting ? 'جاري الاتصال...' : 'اتصال بالجهاز',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
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
}
