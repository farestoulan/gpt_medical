import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/common_widgets/app_header.dart';
import '../../data/datasources/medical_knowledge.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.standard(backgroundColor: Colors.red[700]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emergency Contact Card
            _buildEmergencyContactCard(),

            const SizedBox(height: 24),

            // Emergency Symptoms
            _buildSectionTitle('أعراض الطوارئ - اتصل بالإسعاف فوراً'),
            const SizedBox(height: 12),
            _buildEmergencySymptoms(),

            const SizedBox(height: 24),

            // First Aid Instructions
            _buildSectionTitle('الإسعافات الأولية'),
            const SizedBox(height: 12),
            _buildFirstAidInstructions(),

            const SizedBox(height: 24),

            // Important Notes
            _buildImportantNotes(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContactCard() {
    return Card(
      color: Colors.red[50],
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.red[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.emergency, color: Colors.red[700], size: 48),
            const SizedBox(height: 16),
            const Text(
              'في حالة الطوارئ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'اتصل بالإسعاف فوراً',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _callEmergency('997'),
                  icon: const Icon(Icons.phone),
                  label: const Text('الإسعاف 997'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _callEmergency('911'),
                  icon: const Icon(Icons.phone),
                  label: const Text('الطوارئ 911'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2E7D32),
      ),
    );
  }

  Widget _buildEmergencySymptoms() {
    final symptoms = MedicalKnowledge.getEmergencySymptoms();

    return Column(
      children:
          symptoms
              .map(
                (symptom) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: Text(
                      symptom,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildFirstAidInstructions() {
    final instructions = MedicalKnowledge.getFirstAidInstructions();

    return Column(
      children:
          instructions.entries
              .map(
                (entry) => Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ExpansionTile(
                    title: Text(
                      entry.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    leading: const Icon(
                      Icons.medical_services,
                      color: Color(0xFF2E7D32),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              entry.value
                                  .asMap()
                                  .entries
                                  .map(
                                    (step) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF2E7D32),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${step.key + 1}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              step.value,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildImportantNotes() {
    return Card(
      color: Colors.amber[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info, color: Colors.amber[700]),
                const SizedBox(width: 8),
                Text(
                  'ملاحظات مهمة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '• هذا التطبيق مخصص للأغراض التعليمية فقط\n'
              '• لا يُعتبر بديلاً عن الرعاية الطبية الطارئة\n'
              '• في حالة الطوارئ الحقيقية، اتصل بالإسعاف فوراً\n'
              '• استشر الطبيب المختص للحصول على التشخيص الدقيق\n'
              '• احتفظ بأرقام الطوارئ في متناول اليد دائماً',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  void _callEmergency(String number) {
    // محاكاة الاتصال بالطوارئ
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('الاتصال بالطوارئ'),
            content: Text('جاري الاتصال برقم الطوارئ: $number'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // في التطبيق الحقيقي، سيتم فتح تطبيق الهاتف
                  HapticFeedback.mediumImpact();
                },
                child: const Text('اتصال'),
              ),
            ],
          ),
    );
  }
}
