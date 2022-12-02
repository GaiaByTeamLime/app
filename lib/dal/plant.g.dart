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
abstract class PlantCollectionReference
    implements
        PlantQuery,
        FirestoreCollectionReference<PlantDTO, PlantQuerySnapshot> {
  factory PlantCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PlantCollectionReference;

  static PlantDTO fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$PlantFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    PlantDTO value,
    SetOptions? options,
  ) {
    return {..._$PlantToJson(value)}..remove('id');
  }

  @override
  CollectionReference<PlantDTO> get reference;

  @override
  PlantDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PlantDocumentReference> add(PlantDTO value);
}

class _$PlantCollectionReference extends _$PlantQuery
    implements PlantCollectionReference {
  factory _$PlantCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PlantCollectionReference._(
      firestore.collection('plants').withConverter(
            fromFirestore: PlantCollectionReference.fromFirestore,
            toFirestore: PlantCollectionReference.toFirestore,
          ),
    );
  }

  _$PlantCollectionReference._(
    CollectionReference<PlantDTO> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<PlantDTO> get reference =>
      super.reference as CollectionReference<PlantDTO>;

  @override
  PlantDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PlantDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PlantDocumentReference> add(PlantDTO value) {
    return reference.add(value).then((ref) => PlantDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlantCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PlantDocumentReference
    extends FirestoreDocumentReference<PlantDTO, PlantDocumentSnapshot> {
  factory PlantDocumentReference(DocumentReference<PlantDTO> reference) =
      _$PlantDocumentReference;

  DocumentReference<PlantDTO> get reference;

  /// A reference to the [PlantCollectionReference] containing this document.
  PlantCollectionReference get parent {
    return _$PlantCollectionReference(reference.firestore);
  }

  @override
  Stream<PlantDocumentSnapshot> snapshots();

  @override
  Future<PlantDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    int avatarPot,
    FieldValue avatarPotFieldValue,
    int plantPot,
    FieldValue plantPotFieldValue,
    int facePot,
    FieldValue facePotFieldValue,
    int calibrationDry,
    FieldValue calibrationDryFieldValue,
    int calibrationWet,
    FieldValue calibrationWetFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    int avatarPot,
    FieldValue avatarPotFieldValue,
    int plantPot,
    FieldValue plantPotFieldValue,
    int facePot,
    FieldValue facePotFieldValue,
    int calibrationDry,
    FieldValue calibrationDryFieldValue,
    int calibrationWet,
    FieldValue calibrationWetFieldValue,
  });
}

class _$PlantDocumentReference
    extends FirestoreDocumentReference<PlantDTO, PlantDocumentSnapshot>
    implements PlantDocumentReference {
  _$PlantDocumentReference(this.reference);

  @override
  final DocumentReference<PlantDTO> reference;

  /// A reference to the [PlantCollectionReference] containing this document.
  PlantCollectionReference get parent {
    return _$PlantCollectionReference(reference.firestore);
  }

  @override
  Stream<PlantDocumentSnapshot> snapshots() {
    return reference.snapshots().map(PlantDocumentSnapshot._);
  }

  @override
  Future<PlantDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PlantDocumentSnapshot._);
  }

  @override
  Future<PlantDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PlantDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? avatarPot = _sentinel,
    FieldValue? avatarPotFieldValue,
    Object? plantPot = _sentinel,
    FieldValue? plantPotFieldValue,
    Object? facePot = _sentinel,
    FieldValue? facePotFieldValue,
    Object? calibrationDry = _sentinel,
    FieldValue? calibrationDryFieldValue,
    Object? calibrationWet = _sentinel,
    FieldValue? calibrationWetFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      avatarPot == _sentinel || avatarPotFieldValue == null,
      "Cannot specify both avatarPot and avatarPotFieldValue",
    );
    assert(
      plantPot == _sentinel || plantPotFieldValue == null,
      "Cannot specify both plantPot and plantPotFieldValue",
    );
    assert(
      facePot == _sentinel || facePotFieldValue == null,
      "Cannot specify both facePot and facePotFieldValue",
    );
    assert(
      calibrationDry == _sentinel || calibrationDryFieldValue == null,
      "Cannot specify both calibrationDry and calibrationDryFieldValue",
    );
    assert(
      calibrationWet == _sentinel || calibrationWetFieldValue == null,
      "Cannot specify both calibrationWet and calibrationWetFieldValue",
    );
    final json = {
      if (name != _sentinel) _$PlantFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$PlantFieldMap['name']!: nameFieldValue,
      if (avatarPot != _sentinel)
        _$PlantFieldMap['avatarPot']!: avatarPot as int,
      if (avatarPotFieldValue != null)
        _$PlantFieldMap['avatarPot']!: avatarPotFieldValue,
      if (plantPot != _sentinel) _$PlantFieldMap['plantPot']!: plantPot as int,
      if (plantPotFieldValue != null)
        _$PlantFieldMap['plantPot']!: plantPotFieldValue,
      if (facePot != _sentinel) _$PlantFieldMap['facePot']!: facePot as int,
      if (facePotFieldValue != null)
        _$PlantFieldMap['facePot']!: facePotFieldValue,
      if (calibrationDry != _sentinel)
        _$PlantFieldMap['calibrationDry']!: calibrationDry as int,
      if (calibrationDryFieldValue != null)
        _$PlantFieldMap['calibrationDry']!: calibrationDryFieldValue,
      if (calibrationWet != _sentinel)
        _$PlantFieldMap['calibrationWet']!: calibrationWet as int,
      if (calibrationWetFieldValue != null)
        _$PlantFieldMap['calibrationWet']!: calibrationWetFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? avatarPot = _sentinel,
    FieldValue? avatarPotFieldValue,
    Object? plantPot = _sentinel,
    FieldValue? plantPotFieldValue,
    Object? facePot = _sentinel,
    FieldValue? facePotFieldValue,
    Object? calibrationDry = _sentinel,
    FieldValue? calibrationDryFieldValue,
    Object? calibrationWet = _sentinel,
    FieldValue? calibrationWetFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      avatarPot == _sentinel || avatarPotFieldValue == null,
      "Cannot specify both avatarPot and avatarPotFieldValue",
    );
    assert(
      plantPot == _sentinel || plantPotFieldValue == null,
      "Cannot specify both plantPot and plantPotFieldValue",
    );
    assert(
      facePot == _sentinel || facePotFieldValue == null,
      "Cannot specify both facePot and facePotFieldValue",
    );
    assert(
      calibrationDry == _sentinel || calibrationDryFieldValue == null,
      "Cannot specify both calibrationDry and calibrationDryFieldValue",
    );
    assert(
      calibrationWet == _sentinel || calibrationWetFieldValue == null,
      "Cannot specify both calibrationWet and calibrationWetFieldValue",
    );
    final json = {
      if (name != _sentinel) _$PlantFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$PlantFieldMap['name']!: nameFieldValue,
      if (avatarPot != _sentinel)
        _$PlantFieldMap['avatarPot']!: avatarPot as int,
      if (avatarPotFieldValue != null)
        _$PlantFieldMap['avatarPot']!: avatarPotFieldValue,
      if (plantPot != _sentinel) _$PlantFieldMap['plantPot']!: plantPot as int,
      if (plantPotFieldValue != null)
        _$PlantFieldMap['plantPot']!: plantPotFieldValue,
      if (facePot != _sentinel) _$PlantFieldMap['facePot']!: facePot as int,
      if (facePotFieldValue != null)
        _$PlantFieldMap['facePot']!: facePotFieldValue,
      if (calibrationDry != _sentinel)
        _$PlantFieldMap['calibrationDry']!: calibrationDry as int,
      if (calibrationDryFieldValue != null)
        _$PlantFieldMap['calibrationDry']!: calibrationDryFieldValue,
      if (calibrationWet != _sentinel)
        _$PlantFieldMap['calibrationWet']!: calibrationWet as int,
      if (calibrationWetFieldValue != null)
        _$PlantFieldMap['calibrationWet']!: calibrationWetFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PlantDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PlantQuery
    implements QueryReference<PlantDTO, PlantQuerySnapshot> {
  @override
  PlantQuery limit(int limit);

  @override
  PlantQuery limitToLast(int limit);

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
  PlantQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
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
  PlantQuery whereFieldPath(
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

  PlantQuery whereDocumentId({
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
  PlantQuery whereName({
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
  PlantQuery whereAvatarPot({
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
  PlantQuery wherePlantPot({
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
  PlantQuery whereFacePot({
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
  PlantQuery whereCalibrationDry({
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
  PlantQuery whereCalibrationWet({
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

  PlantQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  });

  PlantQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  });

  PlantQuery orderByAvatarPot({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  });

  PlantQuery orderByPlantPot({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  });

  PlantQuery orderByFacePot({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  });

  PlantQuery orderByCalibrationDry({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  });

  PlantQuery orderByCalibrationWet({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  });
}

class _$PlantQuery extends QueryReference<PlantDTO, PlantQuerySnapshot>
    implements PlantQuery {
  _$PlantQuery(
    this._collection, {
    required Query<PlantDTO> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PlantQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(PlantQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PlantQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PlantQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PlantQuery limit(int limit) {
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlantQuery limitToLast(int limit) {
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  PlantQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
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
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantQuery whereFieldPath(
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
    return _$PlantQuery(
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

  PlantQuery whereDocumentId({
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
    return _$PlantQuery(
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

  PlantQuery whereName({
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
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantFieldMap['name']!,
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

  PlantQuery whereAvatarPot({
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
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantFieldMap['avatarPot']!,
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

  PlantQuery wherePlantPot({
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
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantFieldMap['plantPot']!,
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

  PlantQuery whereFacePot({
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
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantFieldMap['facePot']!,
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

  PlantQuery whereCalibrationDry({
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
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantFieldMap['calibrationDry']!,
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

  PlantQuery whereCalibrationWet({
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
    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlantFieldMap['calibrationWet']!,
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

  PlantQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
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

    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PlantFieldMap['name']!,
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

    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantQuery orderByAvatarPot({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PlantFieldMap['avatarPot']!,
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

    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantQuery orderByPlantPot({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PlantFieldMap['plantPot']!,
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

    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantQuery orderByFacePot({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PlantFieldMap['facePot']!,
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

    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantQuery orderByCalibrationDry({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantFieldMap['calibrationDry']!, descending: descending);
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

    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlantQuery orderByCalibrationWet({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlantDocumentSnapshot? startAtDocument,
    PlantDocumentSnapshot? endAtDocument,
    PlantDocumentSnapshot? endBeforeDocument,
    PlantDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlantFieldMap['calibrationWet']!, descending: descending);
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

    return _$PlantQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlantQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PlantDocumentSnapshot extends FirestoreDocumentSnapshot<PlantDTO> {
  PlantDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<PlantDTO> snapshot;

  @override
  PlantDocumentReference get reference {
    return PlantDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final PlantDTO? data;
}

class PlantQuerySnapshot
    extends FirestoreQuerySnapshot<PlantDTO, PlantQueryDocumentSnapshot> {
  PlantQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PlantQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<PlantDTO> snapshot,
  ) {
    final docs = snapshot.docs.map(PlantQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PlantDocumentSnapshot._,
      );
    }).toList();

    return PlantQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PlantDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PlantDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PlantDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<PlantDTO> snapshot;

  @override
  final List<PlantQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PlantDocumentSnapshot>> docChanges;
}

class PlantQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<PlantDTO>
    implements PlantDocumentSnapshot {
  PlantQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<PlantDTO> snapshot;

  @override
  final PlantDTO data;

  @override
  PlantDocumentReference get reference {
    return PlantDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantDTO _$PlantFromJson(Map<String, dynamic> json) => PlantDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarPot: json['avatarPot'] as int,
      plantPot: json['plantPot'] as int,
      facePot: json['facePot'] as int,
      calibrationDry: json['calibrationDry'] as int,
      calibrationWet: json['calibrationWet'] as int,
    );

const _$PlantFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'avatarPot': 'avatarPot',
  'plantPot': 'plantPot',
  'facePot': 'facePot',
  'calibrationDry': 'calibrationDry',
  'calibrationWet': 'calibrationWet',
};

Map<String, dynamic> _$PlantToJson(PlantDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarPot': instance.avatarPot,
      'plantPot': instance.plantPot,
      'facePot': instance.facePot,
      'calibrationDry': instance.calibrationDry,
      'calibrationWet': instance.calibrationWet,
    };
