import '../models/medical_condition.dart';

class MedicalKnowledge {
  static final List<MedicalCondition> conditions = [
    // أمراض الجهاز التنفسي
    MedicalCondition(
      id: 'resp_001',
      name: 'نزلة برد',
      description: 'التهاب في الجهاز التنفسي العلوي يسببه فيروس',
      symptoms: [
        'سيلان الأنف',
        'عطس متكرر',
        'احتقان الأنف',
        'سعال خفيف',
        'صداع خفيف',
        'إرهاق',
      ],
      treatments: [
        'الراحة الكافية',
        'شرب السوائل الدافئة',
        'استخدام بخاخ الأنف المالح',
        'مسكنات الألم الخفيفة',
        'تجنب التدخين والغبار',
      ],
      severity: 'خفيف',
      category: 'أمراض الجهاز التنفسي',
      relatedConditions: ['إنفلونزا', 'حساسية الأنف', 'التهاب الجيوب الأنفية'],
    ),
    
    MedicalCondition(
      id: 'resp_002',
      name: 'إنفلونزا',
      description: 'عدوى فيروسية حادة تصيب الجهاز التنفسي',
      symptoms: [
        'حمى عالية (38-40 درجة)',
        'صداع شديد',
        'ألم في العضلات والمفاصل',
        'سعال جاف',
        'إرهاق شديد',
        'قشعريرة',
        'فقدان الشهية',
      ],
      treatments: [
        'الراحة التامة',
        'شرب السوائل بكثرة',
        'مسكنات الألم وخافضات الحرارة',
        'مضادات الفيروسات (في الحالات الشديدة)',
        'تجنب الاختلاط مع الآخرين',
      ],
      severity: 'متوسط إلى شديد',
      category: 'أمراض الجهاز التنفسي',
      relatedConditions: ['نزلة برد', 'التهاب رئوي', 'التهاب الشعب الهوائية'],
    ),

    // أمراض الجهاز الهضمي
    MedicalCondition(
      id: 'dig_001',
      name: 'التهاب المعدة',
      description: 'التهاب في بطانة المعدة يسبب ألم وعدم راحة',
      symptoms: [
        'ألم في أعلى البطن',
        'غثيان وقيء',
        'فقدان الشهية',
        'انتفاخ البطن',
        'حرقة في المعدة',
        'عسر الهضم',
      ],
      treatments: [
        'تجنب الأطعمة الحارة والحمضية',
        'تناول وجبات صغيرة متكررة',
        'تجنب الكحول والتدخين',
        'مضادات الحموضة',
        'مثبطات مضخة البروتون',
      ],
      severity: 'متوسط',
      category: 'أمراض الجهاز الهضمي',
      relatedConditions: ['قرحة المعدة', 'ارتجاع المريء', 'متلازمة القولون العصبي'],
    ),

    // أمراض القلب والأوعية الدموية
    MedicalCondition(
      id: 'card_001',
      name: 'ارتفاع ضغط الدم',
      description: 'زيادة الضغط في الأوعية الدموية عن المعدل الطبيعي',
      symptoms: [
        'صداع في الصباح',
        'دوخة',
        'ضيق في التنفس',
        'ألم في الصدر',
        'تعب وإرهاق',
        'عدم وضوح الرؤية',
      ],
      treatments: [
        'تقليل الملح في الطعام',
        'ممارسة الرياضة بانتظام',
        'فقدان الوزن الزائد',
        'تجنب التدخين والكحول',
        'الأدوية الخافضة للضغط',
        'تقليل التوتر والقلق',
      ],
      severity: 'متوسط إلى شديد',
      category: 'أمراض القلب والأوعية الدموية',
      relatedConditions: ['أمراض القلب', 'السكتة الدماغية', 'أمراض الكلى'],
    ),

    // أمراض الجلد
    MedicalCondition(
      id: 'derm_001',
      name: 'الإكزيما',
      description: 'التهاب جلدي مزمن يسبب حكة واحمرار',
      symptoms: [
        'حكة شديدة',
        'احمرار الجلد',
        'جفاف وتقشر الجلد',
        'طفح جلدي',
        'تورم في المناطق المصابة',
        'تشقق الجلد',
      ],
      treatments: [
        'استخدام مرطبات الجلد',
        'تجنب المواد المهيجة',
        'كريمات الكورتيزون',
        'مضادات الهيستامين',
        'العلاج بالضوء',
        'تجنب التوتر',
      ],
      severity: 'متوسط',
      category: 'أمراض الجلد',
      relatedConditions: ['التهاب الجلد التماسي', 'الصدفية', 'حساسية الجلد'],
    ),

    // أمراض العظام والمفاصل
    MedicalCondition(
      id: 'bone_001',
      name: 'التهاب المفاصل',
      description: 'التهاب في المفاصل يسبب ألم وتيبس',
      symptoms: [
        'ألم في المفاصل',
        'تيبس في الصباح',
        'تورم المفاصل',
        'احمرار وسخونة المفصل',
        'صعوبة في الحركة',
        'تشوه في المفاصل',
      ],
      treatments: [
        'مسكنات الألم',
        'مضادات الالتهاب',
        'العلاج الطبيعي',
        'حقن المفاصل',
        'الجراحة (في الحالات الشديدة)',
        'تغيير نمط الحياة',
      ],
      severity: 'متوسط إلى شديد',
      category: 'أمراض العظام والمفاصل',
      relatedConditions: ['هشاشة العظام', 'التهاب الأوتار', 'التهاب الغضاريف'],
    ),
  ];

  // الحصول على الحالات حسب الفئة
  static List<MedicalCondition> getConditionsByCategory(String category) {
    return conditions.where((condition) => condition.category == category).toList();
  }

  // البحث في الحالات
  static List<MedicalCondition> searchConditions(String query) {
    final lowerQuery = query.toLowerCase();
    return conditions.where((condition) =>
        condition.name.toLowerCase().contains(lowerQuery) ||
        condition.description.toLowerCase().contains(lowerQuery) ||
        condition.symptoms.any((symptom) => symptom.toLowerCase().contains(lowerQuery)) ||
        condition.treatments.any((treatment) => treatment.toLowerCase().contains(lowerQuery))
    ).toList();
  }

  // الحصول على الحالات حسب الخطورة
  static List<MedicalCondition> getConditionsBySeverity(String severity) {
    return conditions.where((condition) => condition.severity == severity).toList();
  }

  // الحصول على حالة محددة
  static MedicalCondition? getConditionById(String id) {
    try {
      return conditions.firstWhere((condition) => condition.id == id);
    } catch (e) {
      return null;
    }
  }

  // الحصول على جميع الفئات
  static List<String> getAllCategories() {
    return conditions.map((condition) => condition.category).toSet().toList();
  }

  // الحصول على النصائح الصحية العامة
  static List<String> getGeneralHealthTips() {
    return [
      'اشرب 8 أكواب من الماء يومياً للحفاظ على ترطيب الجسم',
      'احصل على 7-8 ساعات من النوم الجيد كل ليلة',
      'مارس الرياضة لمدة 30 دقيقة على الأقل يومياً',
      'تناول 5 حصص من الفواكه والخضروات يومياً',
      'تجنب التدخين والكحول للحفاظ على صحة الجسم',
      'اغسل يديك بانتظام لتجنب العدوى',
      'احصل على فحوصات طبية دورية',
      'تجنب التوتر والقلق المفرط',
      'استخدم واقي الشمس عند التعرض للشمس',
      'حافظ على وزن صحي ومتوازن',
    ];
  }

  // الحصول على أعراض الطوارئ
  static List<String> getEmergencySymptoms() {
    return [
      'ألم شديد في الصدر',
      'صعوبة في التنفس',
      'فقدان الوعي',
      'نزيف شديد',
      'ألم شديد في البطن',
      'صداع شديد مفاجئ',
      'ضعف أو شلل في أحد الأطراف',
      'صعوبة في الكلام أو الرؤية',
      'حمى عالية (أكثر من 39 درجة)',
      'طفح جلدي مع حمى',
    ];
  }

  // الحصول على الإسعافات الأولية
  static Map<String, List<String>> getFirstAidInstructions() {
    return {
      'النزيف': [
        'اضغط مباشرة على الجرح بقطعة قماش نظيفة',
        'ارفع الجزء المصاب فوق مستوى القلب',
        'استمر في الضغط حتى توقف النزيف',
        'اطلب المساعدة الطبية فوراً',
      ],
      'الحروق': [
        'برد المنطقة المصابة بالماء البارد لمدة 10-15 دقيقة',
        'لا تستخدم الثلج مباشرة على الحرق',
        'غطي الحرق بضمادة نظيفة',
        'لا تفتح البثور أو الفقاعات',
      ],
      'الاختناق': [
        'اطلب من الشخص السعال بقوة',
        'استخدم مناورة هيمليك إذا لزم الأمر',
        'اتصل بالإسعاف فوراً',
        'لا تضع أصابعك في فم الشخص',
      ],
      'فقدان الوعي': [
        'تحقق من التنفس والنبض',
        'ضع الشخص في وضعية الاستلقاء الجانبي',
        'اتصل بالإسعاف فوراً',
        'لا تعط الشخص أي طعام أو شراب',
      ],
    };
  }
}
