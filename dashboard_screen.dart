import 'package:flutter/material.dart';
import 'dart:async';
import '../constants/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Timer _timer;
  int heartRate = 72;
  double temperature = 36.8;
  int oxygen = 98;

  List<int> heartRateReadings = [72];
  List<double> temperatureReadings = [36.8];
  List<int> oxygenReadings = [98];

  @override
  void initState() {
    super.initState();
    _startVitalsSimulation();
  }

  void _startVitalsSimulation() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        heartRate = (60 + (DateTime.now().millisecond % 30)).toInt();
        temperature = 36.5 + (DateTime.now().millisecond % 20) / 10;
        oxygen = 95 + (DateTime.now().millisecond % 6);

        heartRateReadings.add(heartRate);
        temperatureReadings.add(temperature);
        oxygenReadings.add(oxygen);

        if (heartRateReadings.length > 20) {
          heartRateReadings.removeAt(0);
          temperatureReadings.removeAt(0);
          oxygenReadings.removeAt(0);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  double get avgHeartRate =>
      heartRateReadings.reduce((a, b) => a + b) / heartRateReadings.length;
  double get maxTemp =>
      temperatureReadings.reduce((a, b) => a > b ? a : b);
  double get minTemp =>
      temperatureReadings.reduce((a, b) => a < b ? a : b);
  double get avgOxygen =>
      oxygenReadings.reduce((a, b) => a + b) / oxygenReadings.length;

  String get healthStatus {
    if (avgOxygen >= 95 && heartRate >= 60 && heartRate <= 100) {
      return 'ممتازة';
    }
    return 'تحتاج متابعة';
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 16),

                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: MedicalColors.medicalGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: MedicalColors.medicalGreen,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: MedicalColors.medicalGreen,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'الروبوت متصل',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: MedicalColors.medicalGreen,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'مرحباً، أحمد محمد',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MedicalColors.darkBlue,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            'لوحة المؤشرات الحيوية',
                            style: TextStyle(
                              fontSize: 14,
                              color: MedicalColors.gray,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Vitals Grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildVitalCard(
                        title: 'نبض القلب',
                        value: '$heartRate',
                        unit: 'bpm',
                        icon: Icons.favorite,
                        color: MedicalColors.medicalBlue,
                      ),
                      _buildVitalCard(
                        title: 'درجة الحرارة',
                        value: '${temperature.toStringAsFixed(1)}',
                        unit: '°C',
                        icon: Icons.thermostat_outlined,
                        color: MedicalColors.medicalBlue,
                      ),
                      _buildVitalCard(
                        title: 'الأكسجين',
                        value: '$oxygen',
                        unit: '%',
                        icon: Icons.water_drop_outlined,
                        color: MedicalColors.medicalGreen,
                      ),
                      _buildVitalCard(
                        title: 'الحالة',
                        value: healthStatus,
                        unit: '',
                        icon: Icons.health_and_safety_outlined,
                        color: MedicalColors.medicalGreen,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Daily Report
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'ملخص التقرير اليومي',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MedicalColors.darkBlue,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.trending_up,
                              color: MedicalColors.medicalBlue,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'إحصائيات المؤشرات الحيوية',
                          style: TextStyle(
                            fontSize: 14,
                            color: MedicalColors.gray,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 20),
                        _buildReportItem(
                          label: 'متوسط النبض',
                          value: '${avgHeartRate.toStringAsFixed(0)} bpm',
                          color: MedicalColors.medicalBlue,
                        ),
                        const SizedBox(height: 12),
                        _buildReportItem(
                          label: 'أعلى درجة حرارة',
                          value: '${maxTemp.toStringAsFixed(1)} °C',
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 12),
                        _buildReportItem(
                          label: 'أقل درجة حرارة',
                          value: '${minTemp.toStringAsFixed(1)} °C',
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 12),
                        _buildReportItem(
                          label: 'متوسط الأكسجين',
                          value: '${avgOxygen.toStringAsFixed(0)} %',
                          color: MedicalColors.medicalGreen,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Last Update
                  Center(
                    child: Text(
                      'آخر تحديث: الآن',
                      style: TextStyle(
                        fontSize: 12,
                        color: MedicalColors.gray.withOpacity(0.7),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVitalCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(
            color: color,
            width: 4,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: MedicalColors.gray,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 12,
                  color: MedicalColors.gray,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportItem({
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: MedicalColors.gray,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
