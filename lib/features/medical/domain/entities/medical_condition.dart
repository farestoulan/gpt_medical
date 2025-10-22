import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_condition.freezed.dart';
part 'medical_condition.g.dart';

@freezed
class MedicalCondition with _$MedicalCondition {
  const factory MedicalCondition({
    required String id,
    required String name,
    required String description,
    required List<String> symptoms,
    required List<String> treatments,
    required String severity,
    required String category,
    required List<String> relatedConditions,
  }) = _MedicalCondition;

  factory MedicalCondition.fromJson(Map<String, dynamic> json) =>
      _$MedicalConditionFromJson(json);
}

@freezed
class MedicalImageAnalysis with _$MedicalImageAnalysis {
  const factory MedicalImageAnalysis({
    required String imagePath,
    required String analysisType,
    required String result,
    required double confidence,
    required List<String> findings,
    required String recommendation,
    required DateTime analyzedAt,
  }) = _MedicalImageAnalysis;

  factory MedicalImageAnalysis.fromJson(Map<String, dynamic> json) =>
      _$MedicalImageAnalysisFromJson(json);
}
