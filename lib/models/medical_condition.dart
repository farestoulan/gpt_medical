class MedicalCondition {
  final String id;
  final String name;
  final String description;
  final List<String> symptoms;
  final List<String> treatments;
  final String severity;
  final String category;
  final List<String> relatedConditions;

  MedicalCondition({
    required this.id,
    required this.name,
    required this.description,
    required this.symptoms,
    required this.treatments,
    required this.severity,
    required this.category,
    required this.relatedConditions,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'symptoms': symptoms,
      'treatments': treatments,
      'severity': severity,
      'category': category,
      'relatedConditions': relatedConditions,
    };
  }

  factory MedicalCondition.fromJson(Map<String, dynamic> json) {
    return MedicalCondition(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      symptoms: List<String>.from(json['symptoms']),
      treatments: List<String>.from(json['treatments']),
      severity: json['severity'],
      category: json['category'],
      relatedConditions: List<String>.from(json['relatedConditions']),
    );
  }
}

class MedicalImageAnalysis {
  final String imagePath;
  final String analysisType;
  final String result;
  final double confidence;
  final List<String> findings;
  final String recommendation;
  final DateTime analyzedAt;

  MedicalImageAnalysis({
    required this.imagePath,
    required this.analysisType,
    required this.result,
    required this.confidence,
    required this.findings,
    required this.recommendation,
    required this.analyzedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'analysisType': analysisType,
      'result': result,
      'confidence': confidence,
      'findings': findings,
      'recommendation': recommendation,
      'analyzedAt': analyzedAt.toIso8601String(),
    };
  }

  factory MedicalImageAnalysis.fromJson(Map<String, dynamic> json) {
    return MedicalImageAnalysis(
      imagePath: json['imagePath'],
      analysisType: json['analysisType'],
      result: json['result'],
      confidence: json['confidence'],
      findings: List<String>.from(json['findings']),
      recommendation: json['recommendation'],
      analyzedAt: DateTime.parse(json['analyzedAt']),
    );
  }
}
