class AppConstants {
  // API Configuration
  static const String openAiApiKey = String.fromEnvironment(
    'OPENAI_API_KEY',
    defaultValue: '',
  );
  static const String openAiBaseUrl = 'https://api.openai.com/v1';
  static const String openAiModel = 'gpt-3.5-turbo';

  // Request Configuration
  static const int maxTokens = 1000;
  static const double temperature = 0.3;
  static const int requestTimeout = 30; // seconds

  // Image Processing
  static const int maxImageSize = 1024; // pixels
  static const int imageQuality = 85; // percentage
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];

  // Medical AI Settings
  static const String medicalSystemPrompt = '''
أنت مساعد طبي ذكي متخصص في تقديم النصائح الطبية العامة. 
يجب أن تذكر دائماً أن استشارة الطبيب ضرورية للتشخيص الدقيق.
قدم معلومات طبية دقيقة ومفيدة باللغة العربية.
إذا كان السؤال يتعلق بحالة طوارئ، نصح بالذهاب إلى المستشفى فوراً.
استخدم المصطلحات الطبية المناسبة وقدم تفسيرات واضحة.
''';

  // Error Messages
  static const String networkError =
      'خطأ في الاتصال بالشبكة. يرجى المحاولة مرة أخرى.';
  static const String apiError = 'خطأ في الخدمة. يرجى المحاولة لاحقاً.';
  static const String imageError =
      'خطأ في معالجة الصورة. يرجى المحاولة مرة أخرى.';
  static const String timeoutError =
      'انتهت مهلة الطلب. يرجى المحاولة مرة أخرى.';

  // Success Messages
  static const String imageAnalysisSuccess = 'تم تحليل الصورة بنجاح';
  static const String chatResponseSuccess = 'تم إرسال الرسالة بنجاح';

  // Validation Rules
  static const int minMessageLength = 1;
  static const int maxMessageLength = 1000;
  static const int maxImageSizeMB = 10;

  // Cache Settings
  static const int cacheExpirationHours = 24;
  static const int maxCacheSize = 100; // MB

  // Rate Limiting
  static const int maxRequestsPerMinute = 60;
  static const int maxRequestsPerHour = 1000;

  // Security
  static const bool enableEncryption = true;
  static const bool enableLogging = false;
  static const bool enableAnalytics = true;

  // Development Settings
  static const bool isDevelopment = true;
  static const bool enableDebugMode = true;
  static const String logLevel = 'INFO';

  // Feature Flags
  static const bool enableImageAnalysis = true;
  static const bool enableVoiceInput = false;
  static const bool enableOfflineMode = false;
  static const bool enableMultiLanguage = true;

  // UI Configuration
  static const int animationDuration = 300; // milliseconds
  static const double borderRadius = 12.0;
  static const double elevation = 4.0;

  // Colors
  static const int primaryColor = 0xFF2E7D32;
  static const int secondaryColor = 0xFF4CAF50;
  static const int errorColor = 0xFFD32F2F;
  static const int warningColor = 0xFFFF9800;
  static const int successColor = 0xFF4CAF50;

  // Fonts
  static const String primaryFont = 'Cairo';
  static const String secondaryFont = 'Arial';

  // Localization
  static const String defaultLanguage = 'ar';
  static const List<String> supportedLanguages = ['ar', 'en'];

  // Database
  static const String databaseName = 'medical_chat.db';
  static const int databaseVersion = 1;

  // Notifications
  static const bool enablePushNotifications = true;
  static const bool enableEmailNotifications = false;
  static const bool enableSmsNotifications = false;

  // Backup
  static const bool enableAutoBackup = true;
  static const int backupIntervalHours = 24;
  static const int maxBackupFiles = 7;
}
