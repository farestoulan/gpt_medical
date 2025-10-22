// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicalConditionImpl _$$MedicalConditionImplFromJson(
  Map<String, dynamic> json,
) => _$MedicalConditionImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  symptoms:
      (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
  treatments:
      (json['treatments'] as List<dynamic>).map((e) => e as String).toList(),
  severity: json['severity'] as String,
  category: json['category'] as String,
  relatedConditions:
      (json['relatedConditions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$$MedicalConditionImplToJson(
  _$MedicalConditionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'symptoms': instance.symptoms,
  'treatments': instance.treatments,
  'severity': instance.severity,
  'category': instance.category,
  'relatedConditions': instance.relatedConditions,
};

_$MedicalImageAnalysisImpl _$$MedicalImageAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$MedicalImageAnalysisImpl(
  imagePath: json['imagePath'] as String,
  analysisType: json['analysisType'] as String,
  result: json['result'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  findings:
      (json['findings'] as List<dynamic>).map((e) => e as String).toList(),
  recommendation: json['recommendation'] as String,
  analyzedAt: DateTime.parse(json['analyzedAt'] as String),
);

Map<String, dynamic> _$$MedicalImageAnalysisImplToJson(
  _$MedicalImageAnalysisImpl instance,
) => <String, dynamic>{
  'imagePath': instance.imagePath,
  'analysisType': instance.analysisType,
  'result': instance.result,
  'confidence': instance.confidence,
  'findings': instance.findings,
  'recommendation': instance.recommendation,
  'analyzedAt': instance.analyzedAt.toIso8601String(),
};
