// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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
abstract class UserDTOCollectionReference
    implements
        UserDTOQuery,
        FirestoreCollectionReference<UserDTO, UserDTOQuerySnapshot> {
  factory UserDTOCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserDTOCollectionReference;

  static UserDTO fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserDTOFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    UserDTO value,
    SetOptions? options,
  ) {
    return {..._$UserDTOToJson(value)}..remove('id');
  }

  @override
  CollectionReference<UserDTO> get reference;

  @override
  UserDTODocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDTODocumentReference> add(UserDTO value);
}

class _$UserDTOCollectionReference extends _$UserDTOQuery
    implements UserDTOCollectionReference {
  factory _$UserDTOCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserDTOCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserDTOCollectionReference.fromFirestore,
            toFirestore: UserDTOCollectionReference.toFirestore,
          ),
    );
  }

  _$UserDTOCollectionReference._(
    CollectionReference<UserDTO> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserDTO> get reference =>
      super.reference as CollectionReference<UserDTO>;

  @override
  UserDTODocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserDTODocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDTODocumentReference> add(UserDTO value) {
    return reference.add(value).then((ref) => UserDTODocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDTOCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDTODocumentReference
    extends FirestoreDocumentReference<UserDTO, UserDTODocumentSnapshot> {
  factory UserDTODocumentReference(DocumentReference<UserDTO> reference) =
      _$UserDTODocumentReference;

  DocumentReference<UserDTO> get reference;

  /// A reference to the [UserDTOCollectionReference] containing this document.
  UserDTOCollectionReference get parent {
    return _$UserDTOCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDTODocumentSnapshot> snapshots();

  @override
  Future<UserDTODocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    List<String> plants,
    FieldValue plantsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    List<String> plants,
    FieldValue plantsFieldValue,
  });
}

class _$UserDTODocumentReference
    extends FirestoreDocumentReference<UserDTO, UserDTODocumentSnapshot>
    implements UserDTODocumentReference {
  _$UserDTODocumentReference(this.reference);

  @override
  final DocumentReference<UserDTO> reference;

  /// A reference to the [UserDTOCollectionReference] containing this document.
  UserDTOCollectionReference get parent {
    return _$UserDTOCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDTODocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserDTODocumentSnapshot._);
  }

  @override
  Future<UserDTODocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDTODocumentSnapshot._);
  }

  @override
  Future<UserDTODocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserDTODocumentSnapshot._);
  }

  Future<void> update({
    Object? plants = _sentinel,
    FieldValue? plantsFieldValue,
  }) async {
    assert(
      plants == _sentinel || plantsFieldValue == null,
      "Cannot specify both plants and plantsFieldValue",
    );
    final json = {
      if (plants != _sentinel)
        _$UserDTOFieldMap['plants']!: plants as List<String>,
      if (plantsFieldValue != null)
        _$UserDTOFieldMap['plants']!: plantsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? plants = _sentinel,
    FieldValue? plantsFieldValue,
  }) {
    assert(
      plants == _sentinel || plantsFieldValue == null,
      "Cannot specify both plants and plantsFieldValue",
    );
    final json = {
      if (plants != _sentinel)
        _$UserDTOFieldMap['plants']!: plants as List<String>,
      if (plantsFieldValue != null)
        _$UserDTOFieldMap['plants']!: plantsFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDTODocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserDTOQuery
    implements QueryReference<UserDTO, UserDTOQuerySnapshot> {
  @override
  UserDTOQuery limit(int limit);

  @override
  UserDTOQuery limitToLast(int limit);

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
  UserDTOQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    UserDTODocumentSnapshot? startAtDocument,
    UserDTODocumentSnapshot? endAtDocument,
    UserDTODocumentSnapshot? endBeforeDocument,
    UserDTODocumentSnapshot? startAfterDocument,
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
  UserDTOQuery whereFieldPath(
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

  UserDTOQuery whereDocumentId({
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
  UserDTOQuery wherePlants({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });

  UserDTOQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDTODocumentSnapshot? startAtDocument,
    UserDTODocumentSnapshot? endAtDocument,
    UserDTODocumentSnapshot? endBeforeDocument,
    UserDTODocumentSnapshot? startAfterDocument,
  });

  UserDTOQuery orderByPlants({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    UserDTODocumentSnapshot? startAtDocument,
    UserDTODocumentSnapshot? endAtDocument,
    UserDTODocumentSnapshot? endBeforeDocument,
    UserDTODocumentSnapshot? startAfterDocument,
  });
}

class _$UserDTOQuery extends QueryReference<UserDTO, UserDTOQuerySnapshot>
    implements UserDTOQuery {
  _$UserDTOQuery(
    this._collection, {
    required Query<UserDTO> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserDTOQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserDTOQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserDTOQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDTOQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserDTOQuery limit(int limit) {
    return _$UserDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserDTOQuery limitToLast(int limit) {
    return _$UserDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  UserDTOQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDTODocumentSnapshot? startAtDocument,
    UserDTODocumentSnapshot? endAtDocument,
    UserDTODocumentSnapshot? endBeforeDocument,
    UserDTODocumentSnapshot? startAfterDocument,
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
    return _$UserDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDTOQuery whereFieldPath(
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
    return _$UserDTOQuery(
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

  UserDTOQuery whereDocumentId({
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
    return _$UserDTOQuery(
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

  UserDTOQuery wherePlants({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$UserDTOQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserDTOFieldMap['plants']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDTOQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDTODocumentSnapshot? startAtDocument,
    UserDTODocumentSnapshot? endAtDocument,
    UserDTODocumentSnapshot? endBeforeDocument,
    UserDTODocumentSnapshot? startAfterDocument,
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

    return _$UserDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDTOQuery orderByPlants({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDTODocumentSnapshot? startAtDocument,
    UserDTODocumentSnapshot? endAtDocument,
    UserDTODocumentSnapshot? endBeforeDocument,
    UserDTODocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserDTOFieldMap['plants']!,
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

    return _$UserDTOQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDTOQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDTODocumentSnapshot extends FirestoreDocumentSnapshot<UserDTO> {
  UserDTODocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserDTO> snapshot;

  @override
  UserDTODocumentReference get reference {
    return UserDTODocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserDTO? data;
}

class UserDTOQuerySnapshot
    extends FirestoreQuerySnapshot<UserDTO, UserDTOQueryDocumentSnapshot> {
  UserDTOQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserDTOQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserDTO> snapshot,
  ) {
    final docs = snapshot.docs.map(UserDTOQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserDTODocumentSnapshot._,
      );
    }).toList();

    return UserDTOQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserDTODocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserDTODocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserDTODocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserDTO> snapshot;

  @override
  final List<UserDTOQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDTODocumentSnapshot>> docChanges;
}

class UserDTOQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserDTO>
    implements UserDTODocumentSnapshot {
  UserDTOQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserDTO> snapshot;

  @override
  final UserDTO data;

  @override
  UserDTODocumentReference get reference {
    return UserDTODocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      plants:
          (json['plants'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
    );

const _$UserDTOFieldMap = <String, String>{
  'id': 'id',
  'plants': 'plants',
};

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'plants': instance.plants,
    };
