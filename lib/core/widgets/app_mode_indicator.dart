import 'package:flutter/material.dart';
import '../constants/app_mode.dart';

/// مؤشر بصري لوضع التطبيق (Static Data أو Real API)
/// يظهر في أعلى الشاشة لتوضيح الوضع الحالي
class AppModeIndicator extends StatelessWidget {
  const AppModeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if (!AppMode.useStaticData) {
      // لا نظهر المؤشر في وضع API الحقيقي (production)
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        border: Border.all(color: Colors.orange, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppMode.modeIcon, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          Text(
            'وضع البيانات الثابتة',
            style: TextStyle(
              color: Colors.orange[900],
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Dialog لعرض معلومات كاملة عن وضع التطبيق
class AppModeInfoDialog extends StatelessWidget {
  const AppModeInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Text(AppMode.modeIcon, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'وضع التطبيق',
              style: TextStyle(
                color: AppMode.useStaticData ? Colors.orange : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    AppMode.useStaticData
                        ? Colors.orange.withValues(alpha: 0.1)
                        : Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                AppMode.currentMode,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      AppMode.useStaticData
                          ? Colors.orange[900]
                          : Colors.green[900],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppMode.modeInfo,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('حسناً'),
        ),
      ],
    );
  }

  /// عرض الـ Dialog
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AppModeInfoDialog(),
    );
  }
}
