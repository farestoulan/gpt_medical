# دليل إعداد وتشغيل المساعد الطبي الذكي

## المتطلبات الأساسية

### 1. متطلبات النظام
- **Flutter SDK**: 3.7.2 أو أحدث
- **Dart SDK**: 3.1.0 أو أحدث
- **Android Studio** أو **VS Code** مع إضافة Flutter
- **Git** لإدارة الإصدارات

### 2. متطلبات الأجهزة
- **Android**: API 21 (Android 5.0) أو أحدث
- **iOS**: iOS 11.0 أو أحدث
- **Web**: متصفح حديث يدعم WebAssembly

## خطوات التثبيت

### 1. إعداد البيئة
```bash
# تحقق من إصدار Flutter
flutter --version

# تحقق من الأجهزة المتاحة
flutter devices

# تشغيل flutter doctor للتأكد من الإعداد
flutter doctor
```

### 2. تثبيت التبعيات
```bash
# الانتقال إلى مجلد المشروع
cd gpt_model

# تثبيت التبعيات
flutter pub get

# تحديث التبعيات (اختياري)
flutter pub upgrade
```

### 3. تكوين API Keys

#### أ. OpenAI API
1. اذهب إلى [OpenAI Platform](https://platform.openai.com/)
2. أنشئ حساب جديد أو سجل الدخول
3. اذهب إلى API Keys وأنشئ مفتاح جديد
4. في ملف `lib/config/api_config.dart`:
```dart
static const String openAiApiKey = 'YOUR_ACTUAL_API_KEY_HERE';
```

#### ب. Google Cloud Vision (اختياري)
1. اذهب إلى [Google Cloud Console](https://console.cloud.google.com/)
2. أنشئ مشروع جديد أو اختر مشروع موجود
3. فعّل Google Cloud Vision API
4. أنشئ مفتاح API
5. في ملف `lib/config/api_config.dart`:
```dart
static const String googleCloudApiKey = 'YOUR_GOOGLE_CLOUD_API_KEY';
```

### 4. تشغيل التطبيق

#### للأندرويد
```bash
# تشغيل على جهاز أندرويد
flutter run

# تشغيل على محاكي أندرويد
flutter run -d android
```

#### لـ iOS
```bash
# تشغيل على جهاز iOS
flutter run -d ios

# تشغيل على محاكي iOS
flutter run -d ios --simulator
```

#### للويب
```bash
# تشغيل على المتصفح
flutter run -d web-server --web-port 8080
```

## إعدادات التطوير

### 1. وضع التطوير
في ملف `lib/config/api_config.dart`:
```dart
static const bool isDevelopment = true;
static const bool enableDebugMode = true;
```

### 2. تسجيل الأخطاء
```dart
static const bool enableLogging = true;
static const String logLevel = 'DEBUG';
```

### 3. الميزات التجريبية
```dart
static const bool enableImageAnalysis = true;
static const bool enableVoiceInput = false;
static const bool enableOfflineMode = false;
```

## بناء التطبيق للإنتاج

### 1. بناء APK للأندرويد
```bash
# بناء APK للتطوير
flutter build apk --debug

# بناء APK للإنتاج
flutter build apk --release

# بناء App Bundle للإنتاج
flutter build appbundle --release
```

### 2. بناء تطبيق iOS
```bash
# بناء تطبيق iOS
flutter build ios --release
```

### 3. بناء تطبيق الويب
```bash
# بناء تطبيق الويب
flutter build web --release
```

## استكشاف الأخطاء

### 1. مشاكل شائعة

#### خطأ في التبعيات
```bash
# مسح cache وإعادة التثبيت
flutter clean
flutter pub get
```

#### خطأ في الأذونات (Android)
تأكد من إضافة الأذونات في `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

#### خطأ في iOS
تأكد من إضافة الأذونات في `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>يحتاج التطبيق للوصول للكاميرا لتحليل الصور الطبية</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>يحتاج التطبيق للوصول للمعرض لاختيار الصور الطبية</string>
```

### 2. أدوات التشخيص
```bash
# تحليل الكود
flutter analyze

# تشغيل الاختبارات
flutter test

# فحص الأداء
flutter run --profile
```

## النشر

### 1. Google Play Store
1. بناء App Bundle:
```bash
flutter build appbundle --release
```
2. رفع الملف إلى Google Play Console
3. إكمال معلومات التطبيق والنشر

### 2. Apple App Store
1. بناء تطبيق iOS:
```bash
flutter build ios --release
```
2. فتح المشروع في Xcode
3. رفع التطبيق إلى App Store Connect

### 3. النشر على الويب
1. بناء تطبيق الويب:
```bash
flutter build web --release
```
2. رفع محتويات مجلد `build/web` إلى خادم الويب

## الأمان والخصوصية

### 1. تشفير البيانات
```dart
static const bool enableEncryption = true;
```

### 2. عدم حفظ البيانات الحساسة
- لا يتم حفظ المعلومات الطبية الحساسة
- يتم حذف الصور بعد التحليل
- تشفير جميع البيانات المحفوظة محلياً

### 3. تحذيرات قانونية
- إضافة تحذيرات واضحة في التطبيق
- التأكيد على أن التطبيق للاستشارات العامة فقط
- عدم استبدال استشارة الطبيب المختص

## الدعم والمساعدة

### 1. المشاكل التقنية
- تحقق من [Flutter Documentation](https://docs.flutter.dev/)
- راجع [Flutter GitHub Issues](https://github.com/flutter/flutter/issues)

### 2. مشاكل التطبيق
- تحقق من ملفات السجل
- تأكد من صحة API Keys
- تحقق من اتصال الإنترنت

### 3. التحديثات
```bash
# تحديث Flutter
flutter upgrade

# تحديث التبعيات
flutter pub upgrade
```

## ملاحظات مهمة

⚠️ **تحذير**: هذا التطبيق مخصص للأغراض التعليمية والاستشارات العامة فقط. لا يُعتبر بديلاً عن استشارة الطبيب المختص.

🔒 **الأمان**: تأكد من تحديث API Keys بانتظام وحماية البيانات الشخصية.

📱 **التوافق**: التطبيق متوافق مع أحدث إصدارات Android وiOS والويب.

🚀 **الأداء**: للتطبيق الأمثل، استخدم أجهزة حديثة مع ذاكرة كافية.

---

للمساعدة الإضافية، راجع ملف README.md أو تواصل مع فريق التطوير.
