import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MedicalProfileScreen extends StatefulWidget {
  final VoidCallback onSave;

  const MedicalProfileScreen({Key? key, required this.onSave})
      : super(key: key);

  @override
  State<MedicalProfileScreen> createState() => _MedicalProfileScreenState();
}

class _MedicalProfileScreenState extends State<MedicalProfileScreen> {
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final diseasesController = TextEditingController();
  final allergiesController = TextEditingController();
  final medicationsController = TextEditingController();
  final emergencyContactController = TextEditingController();

  String selectedGender = '';
  String selectedBloodType = '';

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    diseasesController.dispose();
    allergiesController.dispose();
    medicationsController.dispose();
    emergencyContactController.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 16),
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.description_outlined,
                          color: MedicalColors.medicalBlue, size: 28),
                      const SizedBox(width: 12),
                      const Text(
                        'إعداد الملف الطبي',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: MedicalColors.darkBlue,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'أدخل بياناتك الطبية الأساسية',
                    style: TextStyle(
                      fontSize: 14,
                      color: MedicalColors.gray,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 32),

                  // Age and Gender
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown(
                          label: 'الجنس',
                          value: selectedGender,
                          items: ['ذكر', 'أنثى'],
                          onChanged: (value) =>
                              setState(() => selectedGender = value ?? ''),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          controller: ageController,
                          label: 'العمر',
                          hint: '25',
                          icon: Icons.cake_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Height and Weight
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: weightController,
                          label: 'الوزن (كجم)',
                          hint: '70',
                          icon: Icons.scale_outlined,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          controller: heightController,
                          label: 'الطول (سم)',
                          hint: '170',
                          icon: Icons.height_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Blood Type
                  _buildDropdown(
                    label: 'فصيلة الدم',
                    value: selectedBloodType,
                    items: ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'],
                    onChanged: (value) =>
                        setState(() => selectedBloodType = value ?? ''),
                  ),
                  const SizedBox(height: 16),

                  // Chronic Diseases
                  _buildLargeTextField(
                    controller: diseasesController,
                    label: 'الأمراض المزمنة',
                    hint: 'اذكر أي أمراض مزمنة...',
                    icon: Icons.medical_information_outlined,
                  ),
                  const SizedBox(height: 16),

                  // Allergies
                  _buildLargeTextField(
                    controller: allergiesController,
                    label: 'الحساسية',
                    hint: 'اذكر أي حساسية...',
                    icon: Icons.warning_outlined,
                  ),
                  const SizedBox(height: 16),

                  // Medications
                  _buildLargeTextField(
                    controller: medicationsController,
                    label: 'الأدوية المستخدمة',
                    hint: 'اذكر الأدوية التي تتناولها...',
                    icon: Icons.medication_outlined,
                  ),
                  const SizedBox(height: 16),

                  // Emergency Contact
                  _buildTextField(
                    controller: emergencyContactController,
                    label: 'جهة اتصال للطوارئ',
                    hint: 'رقم الهاتف',
                    icon: Icons.phone_outlined,
                  ),
                  const SizedBox(height: 32),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: widget.onSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MedicalColors.medicalBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'حفظ ومتابعة',
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

  Widget _buildLargeTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
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
          textDirection: TextDirection.rtl,
          maxLines: 3,
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

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
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
        DropdownButtonFormField<String>(
          value: value.isEmpty ? null : value,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
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
