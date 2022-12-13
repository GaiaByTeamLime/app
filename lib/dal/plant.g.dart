// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PlantDTOCollectionReference
    implements
        PlantDTOQuery,
        FirestoreCollectionReference<PlantDTO, PlantDTOQuerySnapshot> {
  factory PlantDTOCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PlantDTOCollectionReference;

  static PlantDTO fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$PlantDTOFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    PlantDTO value,
    SetOptions? options,
  ) {
    return {..._$PlantDTOToJson(value)}..remove('id');
  }

  @override
  CollectionReference<PlantDTO> get reference;

  @override
  PlantDTODocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PlantDTODocumentReference> add(PlantDTO value);
}

class _$PlantDTOCollectionReference extends _$PlantDTOQuery
    implements PlantDTOCollectionReference {
  factory _$PlantDTOCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PlantDTOCollectionReference._(
      firestore.collection('plants').withConverter(
            fromFirestore: PlantDTOCollectionReference.fromFirestore,
            toFirestore: PlantDTOCollectionReference.toFirestore,
          ),
    );
  }

  _$PlantDTOCollectionReference._(
    CollectionReference<PlantDTO> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<PlantDTO> get reference =>
      super.reference as CollectionReference<PlantDTO>;

  @override
  PlantDTODocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PlantDTODocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PlantDTODocumentReference> add(PlantDTO value) {
    return reference.add(value).then((ref) => PlantDTODocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlantDTOCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PlantDTODocumentReference
    extends FirestoreDocumentReference<PlantDTO, PlantDTODocumentSnapshot> {
  factory PlantDTODocumentReference(DocumentReference<PlantDTO> reference) =
      _$PlantDTODocumentReference;

  DocumentReference<PlantDTO> get reference;

  /// A reference to the [PlantDTOCollectionReference] containing this document.
  PlantDTOCollectionReference get parent {
    return _$PlantDTOCollectionReference(reference.firestore);
  }

  @override
  Stream<PlantDTODocumentSnapshot> snapshots();

  @override
  Future<PlantDTODocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    int calibrationDry,
    FieldValue calibrationDryFieldValue,
    int calibrationWet,
    FieldValue calibrationWetFieldValue,
    double illumination,
    FieldValue illuminationFieldValue,
    double humidity,
    FieldValue humidityFieldValue,
    double temperature,
    FieldValue temperatureFieldValue,
    double voltage,
    FieldValue voltageFieldValue,
    double soilHumidity,
    FieldValue soilHumidityFieldValue,
    double soilSalt,
    FieldValue soilSaltFieldValue,
    DateTime lastUpdated,
    FieldValue lastUpdatedFieldValue,
    bool isCalibrating,
    FieldValue isCalibratingFieldValue,
    String name,
    FieldValue nameFieldValue,
    int avatarPot,
    FieldValue avatarPotFieldValue,
    int avatarPlant,
    FieldValue avatarPlantFieldValue,
    int avatarFace,
    FieldValue avatarFaceFieldValue,
    int avatarAccessories1,
    FieldValue avatarAccessories1FieldValue,
    int avatarAccessories2,
    FieldValue avatarAccessories2FieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    int calibrationDry,
    FieldValue calibrationDryFieldValue,
    int calibrationWet,
    FieldValue calibrationWetFieldValue,
    double illumination,
    FieldValue illuminationFieldValue,
    double humidity,
    FieldValue humidityFieldValue,
    double temperature,
    FieldValue temperatureFieldValue,
    double voltage,
    FieldValue voltageFieldValue,
    double soilHumidity,
    FieldValue soilHumidityFieldValue,
    double soilSalt,
    FieldValue soilSaltFieldValue,
    DateTime lastUpdated,
    FieldValue lastUpdatedFieldValue,
    bool isCalibrating,
    FieldValue isCalibratingFieldValue,
    String name,
    FieldValue nameFieldValue,
    int avatarPot,
    FieldValue avatarPotFieldValue,
    int avatarPlant,
    FieldValue avatarPlantFieldValue,
    int avatarFace,
    FieldValue avatarFaceFieldValue,
    int avatarAccessories1,
    FieldValue avatarAccessories1FieldValue,
    int avatarAccessories2,
    FieldValue avatarAccessories2FieldValue,
  });
}

class _$PlantDTODocumentReference
    extends FirestoreDocumentReference<PlantDTO, PlantDTODocumentSnapshot>
    implements PlantDTODocumentReference {
  _$PlantDTODocumentReference(this.reference);

  @override
  final DocumentReference<PlantDTO> reference;

  /// A reference to the [PlantDTOCollectionReference] containing this document.
  PlantDTOCollectionReference get parent {
    return _$PlantDTOCollectionReference(reference.firestore);
  }

  @override
  Stream<PlantDTODocumentSnapshot> snapshots() {
    return reference.snapshots().map(PlantDTODocumentSnapshot._);
  }

  @override
  Future<PlantDTODocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PlantDTODocumentSnapshot._);
  }

  @override
  Future<PlantDTODocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PlantDTODocumentSnapshot._);
  }

  Future<void> update({
    Object? calibrationDry = _sentinel,
    FieldValue? calibrationDryFieldValue,
    Object? calibrationWet = _sentinel,
    FieldValue? calibrationWetFieldValue,
    Object? illumination = _sentinel,
    FieldValue? illuminationFieldValue,
    Object? humidity = _sentinel,
    FieldValue? humidityFieldValue,
    Object? temperature = _sentinel,
    FieldValue? temperatureFieldValue,
    Object? voltage = _sentinel,
    FieldValue? voltageFieldValue,
    Object? soilHumidity = _sentinel,
    FieldValue? soilHumidityFieldValue,
    Object? soilSalt = _sentinel,
    FieldValue? soilSaltFieldValue,
    Object? lastUpdated = _sentinel,
    FieldValue? lastUpdatedFieldValue,
    Object? isCalibrating = _sentinel,
    FieldValue? isCalibratingFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? avatarPot = _sentinel,
    FieldValue? avatarPotFieldValue,
    Object? avatarPlant = _sentinel,
    FieldValue? avatarPlantFieldValue,
    Object? avatarFace = _sentinel,
    FieldValue? avatarFaceFieldValue,
    Object? avatarAccessories1 = _sentinel,
    FieldValue? avatarAccessories1FieldValue,
    Object? avatarAccessories2 = _sentinel,
    FieldValue? avatarAccessories2FieldValue,
  }) async {
    assert(
      calibrationDry == _sentinel || calibrationDryFieldValue == null,
      "Cannot specify both calibrationDry and calibrationDryFieldValue",
    );
    assert(
      calibrationWet == _sentinel || calibrationWetFieldValue == null,
      "Cannot specify both calibrationWet and calibrationWetFieldValue",
    );
    assert(
      illumination == _sentinel || illuminationFieldValue == null,
      "Cannot specify both illumination and illuminationFieldValue",
    );
    assert(
      humidity == _sentinel || humidityFieldValue == null,
      "Cannot specify both humidity and humidityFieldValue",
    );
    assert(
      temperature == _sentinel || temperatureFieldValue == null,
      "Cannot specify both temperature and temperatureFieldValue",
    );
    assert(
      voltage == _sentinel || voltageFieldValue == null,
      "Cannot specify both voltage and voltageFieldValue",
    );
    assert(
      soilHumidity == _sentinel || soilHumidityFieldValue == null,
      "Cannot specify both soilHumidity and soilHumidityFieldValue",
    );
    assert(
      soilSalt == _sentinel || soilSaltFieldValue == null,
      "Cannot specify both soilSalt and soilSaltFieldValue",
    );
    assert(
      lastUpdated == _sentinel || lastUpdatedFieldValue == null,
      "Cannot specify both lastUpdated and lastUpdatedFieldValue",
    );
    assert(
      isCalibrating == _sentinel || isCalibratingFieldValue == null,
      "Cannot specify both isCalibrating and isCalibratingFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      avatarPot == _sentinel || avatarPotFieldValue == null,
      "Cannot specify both avatarPot and avatarPotFieldValue",
    );
    assert(
      avatarPlant == _sentinel || avatarPlantFieldValue == null,
      "Cannot specify both avatarPlant and avatarPlantFieldValue",
    );
    assert(
      avatarFace == _sentinel || avatarFaceFieldValue == null,
      "Cannot specify both avatarFace and avatarFaceFieldValue",
    );
    assert(
      avatarAccessories1 == _sentinel || avatarAccessories1FieldValue == null,
      "Cannot specify both avatarAccessories1 and avatarAccessories1FieldValue",
    );
    assert(
      avatarAccessories2 == _sentinel || avatarAccessories2FieldValue == null,
      "Cannot specify both avatarAccessories2 and avatarAccessories2FieldValue",
    );
    final json = {
      if (calibrationDry != _sentinel)
        _$PlantDTOFieldMap['calibrationDry']!: calibrationDry as int,
      if (calibrationDryFieldValue != null)
        _$PlantDTOFieldMap['calibrationDry']!: calibrationDryFieldValue,
      if (calibrationWet != _sentinel)
        _$PlantDTOFieldMap['calibrationWet']!: calibrationWet as int,
      if (calibrationWetFieldValue != null)
        _$PlantDTOFieldMap['calibrationWet']!: calibrationWetFieldValue,
      if (illumination != _sentinel)
        _$PlantDTOFieldMap['illumination']!: illumination as double,
      if (illuminationFieldValue != null)
        _$PlantDTOFieldMap['illumination']!: illuminationFieldValue,
      if (humidity != _sentinel)
        _$PlantDTOFieldMap['humidity']!: humidity as double,
      if (humidityFieldValue != null)
        _$PlantDTOFieldMap['humidity']!: humidityFieldValue,
      if (temperature != _sentinel)
        _$PlantDTOFieldMap['temperature']!: temperature as double,
      if (temperatureFieldValue != null)
        _$PlantDTOFieldMap['temperature']!: temperatureFieldValue,
      if (voltage != _sentinel)
        _$PlantDTOFieldMap['voltage']!: voltage as double,
      if (voltageFieldValue != null)
        _$PlantDTOFieldMap['voltage']!: voltageFieldValue,
      if (soilHumidity != _sentinel)
        _$PlantDTOFieldMap['soilHumidity']!: soilHumidity as double,
      if (soilHumidityFieldValue != null)
        _$PlantDTOFieldMap['soilHumidity']!: soilHumidityFieldValue,
      if (soilSalt != _sentinel)
        _$PlantDTOFieldMap['soilSalt']!: soilSalt as double,
      if (soilSaltFieldValue != null)
        _$PlantDTOFieldMap['soilSalt']!: soilSaltFieldValue,
      if (lastUpdated != _sentinel)
        _$PlantDTOFieldMap['lastUpdated']!: lastUpdated as DateTime,
      if (lastUpdatedFieldValue != null)
        _$PlantDTOFieldMap['lastUpdated']!: lastUpdatedFieldValue,
      if (isCalibrating != _sentinel)
        _$PlantDTOFieldMap['isCalibrating']!: isCalibrating as bool,
      if (isCalibratingFieldValue != null)
        _$PlantDTOFieldMap['isCalibrating']!: isCalibratingFieldValue,
      if (name != _sentinel) _$PlantDTOFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$PlantDTOFieldMap['name']!: nameFieldValue,
      if (avatarPot != _sentinel)
        _$PlantDTOFieldMap['avatarPot']!: avatarPot as int,
      if (avatarPotFieldValue != null)
        _$PlantDTOFieldMap['avatarPot']!: avatarPotFieldValue,
      if (avatarPlant != _sentinel)
        _$PlantDTOFieldMap['avatarPlant']!: avatarPlant as int,
      if (avatarPlantFieldValue != null)
        _$PlantDTOFieldMap['avatarPlant']!: avatarPlantFieldValue,
      if (avatarFace != _sentinel)
        _$PlantDTOFieldMap['avatarFace']!: avatarFace as int,
      if (avatarFaceFieldValue != null)
        _$PlantDTOFieldMap['avatarFace']!: avatarFaceFieldValue,
      if (avatarAccessories1 != _sentinel)
        _$PlantDTOFieldMap['avatarAccessories1']!: avatarAccessories1 as int,
      if (avatarAccessories1FieldValue != null)
        _$PlantDTOFieldMap['avatarAccessories1']!: avatarAccessories1FieldValue,
      if (avatarAccessories2 != _sentinel)
        _$PlantDTOFieldMap['avatarAccessories2']!: avatarAccessories2 as int,
      if (avatarAccessories2FieldValue != null)
        _$PlantDTOFieldMap['avatarAccessories2']!: avatarAccessories2FieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? calibrationDry = _sentinel,
    FieldValue? calibrationDryFieldValue,
    Object? calibrationWet = _sentinel,
    FieldValue? calibrationWetFieldValue,
    Object? illumination = _sentinel,
    FieldValue? illuminationFieldValue,
    Object? humidity = _sentinel,
    FieldValue? humidityFieldValue,
    Object? temperature = _sentinel,
    FieldValue? temperatureFieldValue,
    Object? voltage = _sentinel,
    FieldValue? voltageFieldValue,
    Object? soilHumidity = _sentinel,
    FieldValue? soilHumidityFieldValue,
    Object? soilSalt = _sentinel,
    FieldValue? soilSaltFieldValue,
    Object? lastUpdated = _sentinel,
    FieldValue? lastUpdatedFieldValue,
    Object? isCalibrating = _sentinel,
    FieldValue? isCalibratingFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? avatarPot = _sentinel,
    FieldValue? avatarPotFieldValue,
    Object? avatarPlant = _sentinel,
    FieldValue? avatarPlantFieldValue,
    Object? avatarFace = _sentinel,
    FieldValue? avatarFaceFieldValue,
    Object? avatarAccessories1 = _sentinel,
    FieldValue? avatarAccessories1FieldValue,
    Object? avatarAccessories2 = _sentinel,
    FieldValue? avatarAccessories2FieldValue,
  }) {
    assert(
      calibrationDry == _sentinel || calibrationDryFieldValue == null,
      "Cannot specify both calibrationDry and calibrationDryFieldValue",
    );
    assert(
      calibrationWet == _sentinel || calibrationWetFieldValue == null,
      "Cannot specify both calibrationWet and calibrationWetFieldValue",
    );
    assert(
      illumination == _sentinel || illuminationFieldValue == null,
      "Cannot specify both illumination and illuminationFieldValue",
    );
    assert(
      humidity == _sentinel || humidityFieldValue == null,
      "Cannot specify both humidity and humidityFieldValue",
    );
    assert(
      temperature == _sentinel || temperatureFieldValue == null,
      "Cannot specify both temperature and temperatureFieldValue",
    );
    assert(
      voltage == _sentinel || voltageFieldValue == null,
      "Cannot specify both voltage and voltageFieldValue",
    );
    assert(
      soilHumidity == _sentinel || soilHumidityFieldValue == null,
      "Cannot specify both soilHumidity and soilHumidityFieldValue",
    );
    assert(
      soilSalt == _sentinel || soilSaltFieldValue == null,
      "Cannot specify both soilSalt and soilSaltFieldValue",
    );
    assert(
      lastUpdated == _sentinel || lastUpdatedFieldValue == null,
      "Cannot specify both lastUpdated and lastUpdatedFieldValue",
    );
    assert(
      isCalibrating == _sentinel || isCalibratingFieldValue == null,
      "Cannot specify both isCalibrating and isCalibratingFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      avatarPot == _sentinel || avatarPotFieldValue == null,
      "Cannot specify both avatarPot and avatarPotFieldValue",
    );
    assert(
      avatarPlant == _sentinel || avatarPlantFieldValue == null,
      "Cannot specify both avatarPlant and avatarPlantFieldValue",
    );
    assert(
      avatarFace == _sentinel || avatarFaceFieldValue == null,
      "Cannot specify both avatarFace and avatarFaceFieldValue",
    );
    assert(
      avatarAccessories1 == _sentinel || avatarAccessories1FieldValue == null,
      "Cannot specify both avatarAccessories1 and avatarAccessories1FieldValue",
    );
    assert(
      avatarAccessories2 == _sentinel || avatarAccessories2FieldValue == null,
      "Cannot specify both avatarAccessories2 and avatarAccessories2FieldValue",
    );
    final json = {
      if (calibrationDry != _sentinel)
        _$PlantDTOFieldMap['calibrationDry']!: calibrationDry as int,
      if (calibrationDryFieldValue != null)
        _$PlantDTOFieldMap['calibrationDry']!: calibrationDryFieldValue,
      if (calibrationWet != _sentinel)
        _$PlantDTOFieldMap['calibrationWet']!: calibrationWet as int,
      if (calibrationWetFieldValue != null)
        _$PlantDTOFieldMap['calibrationWet']!: calibrationWetFieldValue,
      if (illumination != _sentinel)
        _$PlantDTOFieldMap['illumination']!: illumination as double,
      if (illuminationFieldValue != null)
        _$PlantDTOFieldMap['illumination']!: illuminationFieldValue,
      if (humidity != _sentinel)
        _$PlantDTOFieldMap['humidity']!: humidity as double,
      if (humidityFieldValue != null)
        _$PlantDTOFieldMap['humidity']!: humidityFieldValue,
      if (temperature != _sentinel)
        _$PlantDTOFieldMap['temperature']!: temperature as double,
      if (temperatureFieldValue != null)
        _$PlantDTOFieldMap['temperature']!: temperatureFieldValue,
      if (voltage != _sentinel)
        _$PlantDTOFieldMap['voltage']!: voltage as double,
      if (voltageFieldValue != null)
        _$PlantDTOFieldMap['voltage']!: voltageFieldValue,
      if (soilHumidity != _sentinel)
        _$PlantDTOFieldMap['soilHumidity']!: soilHumidity as double,
      if (soilHumidityFieldValue != null)
        _$PlantDTOFieldMap['soilHumidity']!: soilHumidityFieldValue,
      if (soilSalt != _sentinel)
        _$PlantDTOFieldMap['soilSalt']!: soilSalt as double,
      if (soilSaltFieldValue != null)
        _$PlantDTOFieldMap['soilSalt']!: soilSaltFieldValue,
      if (lastUpdated != _sentinel)
        _$PlantDTOFieldMap['lastUpdated']!: lastUpdated as DateTime,
      if (lastUpdatedFieldValue != null)
        _$PlantDTOFieldMap['lastUpdated']!: lastUpdatedFieldValue,
      if (isCalibrating != _sentinel)
        _$PlantDTOFieldMap['isCalibrating']!: isCalibrating as bool,
      if (isCalibratingFieldValue != null)
        _$PlantDTOFieldMap['isCalibrating']!: isCalibratingFieldValue,
      if (name != _sentinel) _$PlantDTOFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$PlantDTOFieldMap['name']!: nameFieldValue,
      if (avatarPot != _sentinel)
        _$PlantDTOFieldMap['avatarPot']!: avatarPot as int,
      if (avatarPotFieldValue != null)
        _$PlantDTOFieldMap['avatarPot']!: avatarPotFieldValue,
      if (avatarPlant != _sentinel)
        _$PlantDTOFieldMap['avatarPlant']!: avatarPlant as int,
      if (avatarPlantFieldValue != null)
        _$PlantDTOFieldMap['avatarPlant']!: avatarPlantFieldValue,
      if (avatarFace != _sentinel)
        _$PlantDTOFieldMap['avatarFace']!: avatarFace as int,
      if (avatarFaceFieldValue != null)
        _$PlantDTOFieldMap['avatarFace']!: avatarFaceFieldValue,
      if (avatarAccessories1 != _sentinel)
        _$PlantDTOFieldMap['avatarAccessories1']!: avatarAccessories1 as int,
      if (avatarAccessories1FieldValue != null)
        _$PlantDTOFieldMap['avatarAccessories1']!: avatarAccessories1FieldValue,
      if (avatarAccessories2 != _sentinel)
        _$PlantDTOFieldMap['avatarAccessories2']!: avatarAccessories2 as int,
      if (avatarAccessories2FieldValue != null)
        _$PlantDTOFieldMap['avatarAccessories2']!: avatarAccessories2FieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PlantDTODocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PlantDTOQuery
    implements QueryReference<PlantDTO, PlantDTOQuerySnapshot> {
  @override
  PlantDTOQuery limit(int limit);

  @override
  PlantDTOQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  PlantDTOQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  PlantDTOQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  PlantDTOQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PlantDTOQuery whereCalibrationDry({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  PlantDTOQuery whereCalibrationWet({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  PlantDTOQuery whereIllumination({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  PlantDTOQuery whereHumidity({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  PlantDTOQuery whereTemperature({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  PlantDTOQuery whereVoltage({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  PlantDTOQuery whereSoilHumidity({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  PlantDTOQuery whereSoilSalt({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  PlantDTOQuery whereLastUpdated({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  PlantDTOQuery whereIsCalibrating({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  PlantDTOQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PlantDTOQuery whereAvatarPot({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  PlantDTOQuery whereAvatarPlant({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  PlantDTOQuery whereAvatarFace({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  PlantDTOQuery whereAvatarAccessories1({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  PlantDTOQuery whereAvatarAccessories2({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  PlantDTOQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByCalibrationDry({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByCalibrationWet({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByIllumination({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByHumidity({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByTemperature({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByVoltage({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderBySoilHumidity({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderBySoilSalt({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByLastUpdated({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByIsCalibrating({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByAvatarPot({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByAvatarPlant({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByAvatarFace({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByAvatarAccessories1({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });

  PlantDTOQuery orderByAvatarAccessories2({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  });
}

class _$PlantDTOQuery extends QueryReference<PlantDTO, PlantDTOQuerySnapshot>
    implements PlantDTOQuery {
  _$PlantDTOQuery(
    this._collection, {
    required Query<PlantDTO> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PlantDTOQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(PlantDTOQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PlantDTOQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(PlantDTOQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PlantDTOQuery limit(int limit) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlantDTOQuery limitToLast(int limit) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereCalibrationDry({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['calibrationDry']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereCalibrationWet({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['calibrationWet']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereIllumination({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['illumination']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereHumidity({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['humidity']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereTemperature({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['temperature']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereVoltage({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['voltage']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereSoilHumidity({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['soilHumidity']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereSoilSalt({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['soilSalt']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereLastUpdated({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['lastUpdated']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereIsCalibrating({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['isCalibrating']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereAvatarPot({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['avatarPot']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereAvatarPlant({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['avatarPlant']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereAvatarFace({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['avatarFace']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereAvatarAccessories1({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['avatarAccessories1']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery whereAvatarAccessories2({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantDTOFieldMap['avatarAccessories2']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PlantDTOQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByCalibrationDry({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['calibrationDry']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByCalibrationWet({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['calibrationWet']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByIllumination({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['illumination']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByHumidity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['humidity']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByTemperature({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['temperature']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByVoltage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['voltage']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderBySoilHumidity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['soilHumidity']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderBySoilSalt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['soilSalt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByLastUpdated({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['lastUpdated']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByIsCalibrating({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['isCalibrating']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PlantDTOFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByAvatarPot({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['avatarPot']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByAvatarPlant({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['avatarPlant']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByAvatarFace({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantDTOFieldMap['avatarFace']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByAvatarAccessories1({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$PlantDTOFieldMap['avatarAccessories1']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantDTOQuery orderByAvatarAccessories2({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDTODocumentSnapshot? startAtDocument,
    PlantDTODocumentSnapshot? endAtDocument,
    PlantDTODocumentSnapshot? endBeforeDocument,
    PlantDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$PlantDTOFieldMap['avatarAccessories2']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlantDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlantDTOQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PlantDTODocumentSnapshot extends FirestoreDocumentSnapshot<PlantDTO> {
  PlantDTODocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<PlantDTO> snapshot;

  @override
  PlantDTODocumentReference get reference {
    return PlantDTODocumentReference(
      snapshot.reference,
    );
  }

  @override
  final PlantDTO? data;
}

class PlantDTOQuerySnapshot
    extends FirestoreQuerySnapshot<PlantDTO, PlantDTOQueryDocumentSnapshot> {
  PlantDTOQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PlantDTOQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<PlantDTO> snapshot,
  ) {
    final docs = snapshot.docs.map(PlantDTOQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PlantDTODocumentSnapshot._,
      );
    }).toList();

    return PlantDTOQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PlantDTODocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PlantDTODocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PlantDTODocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<PlantDTO> snapshot;

  @override
  final List<PlantDTOQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PlantDTODocumentSnapshot>> docChanges;
}

class PlantDTOQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<PlantDTO>
    implements PlantDTODocumentSnapshot {
  PlantDTOQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<PlantDTO> snapshot;

  @override
  final PlantDTO data;

  @override
  PlantDTODocumentReference get reference {
    return PlantDTODocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantDTO _$PlantDTOFromJson(Map<String, dynamic> json) => PlantDTO(
      id: json['id'] as String,
      calibrationDry: json['calibrationDry'] as int,
      calibrationWet: json['calibrationWet'] as int,
      illumination: (json['illumination'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      soilHumidity: (json['soilHumidity'] as num).toDouble(),
      soilSalt: (json['soilSalt'] as num).toDouble(),
      temperature: (json['temperature'] as num).toDouble(),
      voltage: (json['voltage'] as num).toDouble(),
      lastUpdated: const FirestoreDateTimeConverter()
          .fromJson(json['lastUpdated'] as Timestamp),
      isCalibrating: json['isCalibrating'] as bool,
      name: json['name'] as String,
      avatarPot: json['avatarPot'] as int,
      avatarPlant: json['avatarPlant'] as int,
      avatarFace: json['avatarFace'] as int,
      avatarAccessories1: json['avatarAccessories1'] as int,
      avatarAccessories2: json['avatarAccessories2'] as int,
    );

const _$PlantDTOFieldMap = <String, String>{
  'id': 'id',
  'calibrationDry': 'calibrationDry',
  'calibrationWet': 'calibrationWet',
  'illumination': 'illumination',
  'humidity': 'humidity',
  'temperature': 'temperature',
  'voltage': 'voltage',
  'soilHumidity': 'soilHumidity',
  'soilSalt': 'soilSalt',
  'lastUpdated': 'lastUpdated',
  'isCalibrating': 'isCalibrating',
  'name': 'name',
  'avatarPot': 'avatarPot',
  'avatarPlant': 'avatarPlant',
  'avatarFace': 'avatarFace',
  'avatarAccessories1': 'avatarAccessories1',
  'avatarAccessories2': 'avatarAccessories2',
};

Map<String, dynamic> _$PlantDTOToJson(PlantDTO instance) => <String, dynamic>{
      'id': instance.id,
      'calibrationDry': instance.calibrationDry,
      'calibrationWet': instance.calibrationWet,
      'illumination': instance.illumination,
      'humidity': instance.humidity,
      'temperature': instance.temperature,
      'voltage': instance.voltage,
      'soilHumidity': instance.soilHumidity,
      'soilSalt': instance.soilSalt,
      'lastUpdated':
          const FirestoreDateTimeConverter().toJson(instance.lastUpdated),
      'isCalibrating': instance.isCalibrating,
      'name': instance.name,
      'avatarPot': instance.avatarPot,
      'avatarPlant': instance.avatarPlant,
      'avatarFace': instance.avatarFace,
      'avatarAccessories1': instance.avatarAccessories1,
      'avatarAccessories2': instance.avatarAccessories2,
    };
