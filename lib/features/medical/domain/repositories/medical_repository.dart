import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/medical_condition.dart';

abstract class MedicalRepository {
  Future<Either<Failure, MedicalImageAnalysis>> analyzeImage(String imagePath);
  Future<Either<Failure, List<MedicalCondition>>> searchConditions(
    String query,
  );
  Future<Either<Failure, List<MedicalCondition>>> getConditionsByCategory(
    String category,
  );
  Future<Either<Failure, List<String>>> getHealthTips();
  Future<Either<Failure, List<String>>> getEmergencySymptoms();
  Future<Either<Failure, Map<String, List<String>>>> getFirstAidInstructions();
}
