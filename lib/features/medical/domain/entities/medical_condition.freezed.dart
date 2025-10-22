// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MedicalCondition _$MedicalConditionFromJson(Map<String, dynamic> json) {
  return _MedicalCondition.fromJson(json);
}

/// @nodoc
mixin _$MedicalCondition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  List<String> get treatments => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get relatedConditions => throw _privateConstructorUsedError;

  /// Serializes this MedicalCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicalCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicalConditionCopyWith<MedicalCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalConditionCopyWith<$Res> {
  factory $MedicalConditionCopyWith(
    MedicalCondition value,
    $Res Function(MedicalCondition) then,
  ) = _$MedicalConditionCopyWithImpl<$Res, MedicalCondition>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    List<String> symptoms,
    List<String> treatments,
    String severity,
    String category,
    List<String> relatedConditions,
  });
}

/// @nodoc
class _$MedicalConditionCopyWithImpl<$Res, $Val extends MedicalCondition>
    implements $MedicalConditionCopyWith<$Res> {
  _$MedicalConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicalCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? symptoms = null,
    Object? treatments = null,
    Object? severity = null,
    Object? category = null,
    Object? relatedConditions = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            symptoms:
                null == symptoms
                    ? _value.symptoms
                    : symptoms // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            treatments:
                null == treatments
                    ? _value.treatments
                    : treatments // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            severity:
                null == severity
                    ? _value.severity
                    : severity // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            relatedConditions:
                null == relatedConditions
                    ? _value.relatedConditions
                    : relatedConditions // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicalConditionImplCopyWith<$Res>
    implements $MedicalConditionCopyWith<$Res> {
  factory _$$MedicalConditionImplCopyWith(
    _$MedicalConditionImpl value,
    $Res Function(_$MedicalConditionImpl) then,
  ) = __$$MedicalConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    List<String> symptoms,
    List<String> treatments,
    String severity,
    String category,
    List<String> relatedConditions,
  });
}

/// @nodoc
class __$$MedicalConditionImplCopyWithImpl<$Res>
    extends _$MedicalConditionCopyWithImpl<$Res, _$MedicalConditionImpl>
    implements _$$MedicalConditionImplCopyWith<$Res> {
  __$$MedicalConditionImplCopyWithImpl(
    _$MedicalConditionImpl _value,
    $Res Function(_$MedicalConditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicalCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? symptoms = null,
    Object? treatments = null,
    Object? severity = null,
    Object? category = null,
    Object? relatedConditions = null,
  }) {
    return _then(
      _$MedicalConditionImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        symptoms:
            null == symptoms
                ? _value._symptoms
                : symptoms // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        treatments:
            null == treatments
                ? _value._treatments
                : treatments // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        severity:
            null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        relatedConditions:
            null == relatedConditions
                ? _value._relatedConditions
                : relatedConditions // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicalConditionImpl implements _MedicalCondition {
  const _$MedicalConditionImpl({
    required this.id,
    required this.name,
    required this.description,
    required final List<String> symptoms,
    required final List<String> treatments,
    required this.severity,
    required this.category,
    required final List<String> relatedConditions,
  }) : _symptoms = symptoms,
       _treatments = treatments,
       _relatedConditions = relatedConditions;

  factory _$MedicalConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicalConditionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  final List<String> _symptoms;
  @override
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  final List<String> _treatments;
  @override
  List<String> get treatments {
    if (_treatments is EqualUnmodifiableListView) return _treatments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_treatments);
  }

  @override
  final String severity;
  @override
  final String category;
  final List<String> _relatedConditions;
  @override
  List<String> get relatedConditions {
    if (_relatedConditions is EqualUnmodifiableListView)
      return _relatedConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedConditions);
  }

  @override
  String toString() {
    return 'MedicalCondition(id: $id, name: $name, description: $description, symptoms: $symptoms, treatments: $treatments, severity: $severity, category: $category, relatedConditions: $relatedConditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalConditionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            const DeepCollectionEquality().equals(
              other._treatments,
              _treatments,
            ) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(
              other._relatedConditions,
              _relatedConditions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    const DeepCollectionEquality().hash(_symptoms),
    const DeepCollectionEquality().hash(_treatments),
    severity,
    category,
    const DeepCollectionEquality().hash(_relatedConditions),
  );

  /// Create a copy of MedicalCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalConditionImplCopyWith<_$MedicalConditionImpl> get copyWith =>
      __$$MedicalConditionImplCopyWithImpl<_$MedicalConditionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicalConditionImplToJson(this);
  }
}

abstract class _MedicalCondition implements MedicalCondition {
  const factory _MedicalCondition({
    required final String id,
    required final String name,
    required final String description,
    required final List<String> symptoms,
    required final List<String> treatments,
    required final String severity,
    required final String category,
    required final List<String> relatedConditions,
  }) = _$MedicalConditionImpl;

  factory _MedicalCondition.fromJson(Map<String, dynamic> json) =
      _$MedicalConditionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get symptoms;
  @override
  List<String> get treatments;
  @override
  String get severity;
  @override
  String get category;
  @override
  List<String> get relatedConditions;

  /// Create a copy of MedicalCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicalConditionImplCopyWith<_$MedicalConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MedicalImageAnalysis _$MedicalImageAnalysisFromJson(Map<String, dynamic> json) {
  return _MedicalImageAnalysis.fromJson(json);
}

/// @nodoc
mixin _$MedicalImageAnalysis {
  String get imagePath => throw _privateConstructorUsedError;
  String get analysisType => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get findings => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  DateTime get analyzedAt => throw _privateConstructorUsedError;

  /// Serializes this MedicalImageAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicalImageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicalImageAnalysisCopyWith<MedicalImageAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalImageAnalysisCopyWith<$Res> {
  factory $MedicalImageAnalysisCopyWith(
    MedicalImageAnalysis value,
    $Res Function(MedicalImageAnalysis) then,
  ) = _$MedicalImageAnalysisCopyWithImpl<$Res, MedicalImageAnalysis>;
  @useResult
  $Res call({
    String imagePath,
    String analysisType,
    String result,
    double confidence,
    List<String> findings,
    String recommendation,
    DateTime analyzedAt,
  });
}

/// @nodoc
class _$MedicalImageAnalysisCopyWithImpl<
  $Res,
  $Val extends MedicalImageAnalysis
>
    implements $MedicalImageAnalysisCopyWith<$Res> {
  _$MedicalImageAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicalImageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? analysisType = null,
    Object? result = null,
    Object? confidence = null,
    Object? findings = null,
    Object? recommendation = null,
    Object? analyzedAt = null,
  }) {
    return _then(
      _value.copyWith(
            imagePath:
                null == imagePath
                    ? _value.imagePath
                    : imagePath // ignore: cast_nullable_to_non_nullable
                        as String,
            analysisType:
                null == analysisType
                    ? _value.analysisType
                    : analysisType // ignore: cast_nullable_to_non_nullable
                        as String,
            result:
                null == result
                    ? _value.result
                    : result // ignore: cast_nullable_to_non_nullable
                        as String,
            confidence:
                null == confidence
                    ? _value.confidence
                    : confidence // ignore: cast_nullable_to_non_nullable
                        as double,
            findings:
                null == findings
                    ? _value.findings
                    : findings // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            recommendation:
                null == recommendation
                    ? _value.recommendation
                    : recommendation // ignore: cast_nullable_to_non_nullable
                        as String,
            analyzedAt:
                null == analyzedAt
                    ? _value.analyzedAt
                    : analyzedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicalImageAnalysisImplCopyWith<$Res>
    implements $MedicalImageAnalysisCopyWith<$Res> {
  factory _$$MedicalImageAnalysisImplCopyWith(
    _$MedicalImageAnalysisImpl value,
    $Res Function(_$MedicalImageAnalysisImpl) then,
  ) = __$$MedicalImageAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String imagePath,
    String analysisType,
    String result,
    double confidence,
    List<String> findings,
    String recommendation,
    DateTime analyzedAt,
  });
}

/// @nodoc
class __$$MedicalImageAnalysisImplCopyWithImpl<$Res>
    extends _$MedicalImageAnalysisCopyWithImpl<$Res, _$MedicalImageAnalysisImpl>
    implements _$$MedicalImageAnalysisImplCopyWith<$Res> {
  __$$MedicalImageAnalysisImplCopyWithImpl(
    _$MedicalImageAnalysisImpl _value,
    $Res Function(_$MedicalImageAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicalImageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? analysisType = null,
    Object? result = null,
    Object? confidence = null,
    Object? findings = null,
    Object? recommendation = null,
    Object? analyzedAt = null,
  }) {
    return _then(
      _$MedicalImageAnalysisImpl(
        imagePath:
            null == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                    as String,
        analysisType:
            null == analysisType
                ? _value.analysisType
                : analysisType // ignore: cast_nullable_to_non_nullable
                    as String,
        result:
            null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                    as String,
        confidence:
            null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                    as double,
        findings:
            null == findings
                ? _value._findings
                : findings // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        recommendation:
            null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                    as String,
        analyzedAt:
            null == analyzedAt
                ? _value.analyzedAt
                : analyzedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicalImageAnalysisImpl implements _MedicalImageAnalysis {
  const _$MedicalImageAnalysisImpl({
    required this.imagePath,
    required this.analysisType,
    required this.result,
    required this.confidence,
    required final List<String> findings,
    required this.recommendation,
    required this.analyzedAt,
  }) : _findings = findings;

  factory _$MedicalImageAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicalImageAnalysisImplFromJson(json);

  @override
  final String imagePath;
  @override
  final String analysisType;
  @override
  final String result;
  @override
  final double confidence;
  final List<String> _findings;
  @override
  List<String> get findings {
    if (_findings is EqualUnmodifiableListView) return _findings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_findings);
  }

  @override
  final String recommendation;
  @override
  final DateTime analyzedAt;

  @override
  String toString() {
    return 'MedicalImageAnalysis(imagePath: $imagePath, analysisType: $analysisType, result: $result, confidence: $confidence, findings: $findings, recommendation: $recommendation, analyzedAt: $analyzedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalImageAnalysisImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.analysisType, analysisType) ||
                other.analysisType == analysisType) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(other._findings, _findings) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.analyzedAt, analyzedAt) ||
                other.analyzedAt == analyzedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    imagePath,
    analysisType,
    result,
    confidence,
    const DeepCollectionEquality().hash(_findings),
    recommendation,
    analyzedAt,
  );

  /// Create a copy of MedicalImageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalImageAnalysisImplCopyWith<_$MedicalImageAnalysisImpl>
  get copyWith =>
      __$$MedicalImageAnalysisImplCopyWithImpl<_$MedicalImageAnalysisImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicalImageAnalysisImplToJson(this);
  }
}

abstract class _MedicalImageAnalysis implements MedicalImageAnalysis {
  const factory _MedicalImageAnalysis({
    required final String imagePath,
    required final String analysisType,
    required final String result,
    required final double confidence,
    required final List<String> findings,
    required final String recommendation,
    required final DateTime analyzedAt,
  }) = _$MedicalImageAnalysisImpl;

  factory _MedicalImageAnalysis.fromJson(Map<String, dynamic> json) =
      _$MedicalImageAnalysisImpl.fromJson;

  @override
  String get imagePath;
  @override
  String get analysisType;
  @override
  String get result;
  @override
  double get confidence;
  @override
  List<String> get findings;
  @override
  String get recommendation;
  @override
  DateTime get analyzedAt;

  /// Create a copy of MedicalImageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicalImageAnalysisImplCopyWith<_$MedicalImageAnalysisImpl>
  get copyWith => throw _privateConstructorUsedError;
}
