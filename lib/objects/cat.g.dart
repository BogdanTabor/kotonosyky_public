// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

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
abstract class CatCollectionReference
    implements CatQuery, FirestoreCollectionReference<Cat, CatQuerySnapshot> {
  factory CatCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CatCollectionReference;

  static Cat fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Cat.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Cat value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Cat> get reference;

  @override
  CatDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CatDocumentReference> add(Cat value);
}

class _$CatCollectionReference extends _$CatQuery
    implements CatCollectionReference {
  factory _$CatCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CatCollectionReference._(
      firestore.collection('cats').withConverter(
            fromFirestore: CatCollectionReference.fromFirestore,
            toFirestore: CatCollectionReference.toFirestore,
          ),
    );
  }

  _$CatCollectionReference._(
    CollectionReference<Cat> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Cat> get reference =>
      super.reference as CollectionReference<Cat>;

  @override
  CatDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CatDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CatDocumentReference> add(Cat value) {
    return reference.add(value).then((ref) => CatDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CatCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CatDocumentReference
    extends FirestoreDocumentReference<Cat, CatDocumentSnapshot> {
  factory CatDocumentReference(DocumentReference<Cat> reference) =
      _$CatDocumentReference;

  DocumentReference<Cat> get reference;

  /// A reference to the [CatCollectionReference] containing this document.
  CatCollectionReference get parent {
    return _$CatCollectionReference(reference.firestore);
  }

  @override
  Stream<CatDocumentSnapshot> snapshots();

  @override
  Future<CatDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String sex,
    FieldValue sexFieldValue,
    String name,
    FieldValue nameFieldValue,
    String? description,
    FieldValue descriptionFieldValue,
    String? features,
    FieldValue featuresFieldValue,
    String? location,
    FieldValue locationFieldValue,
    String? descriptionEn,
    FieldValue descriptionEnFieldValue,
    String? featuresEn,
    FieldValue featuresEnFieldValue,
    String? locationEn,
    FieldValue locationEnFieldValue,
    String? descriptionDe,
    FieldValue descriptionDeFieldValue,
    String? featuresDe,
    FieldValue featuresDeFieldValue,
    String? locationDe,
    FieldValue locationDeFieldValue,
    DateTime birthDate,
    FieldValue birthDateFieldValue,
    DateTime? shelterArriveDate,
    FieldValue shelterArriveDateFieldValue,
    DateTime? sterilizationDate,
    FieldValue sterilizationDateFieldValue,
    DateTime? chipDate,
    FieldValue chipDateFieldValue,
    DateTime? viralVaccineDate,
    FieldValue viralVaccineDateFieldValue,
    DateTime? vaccineRabiesDate,
    FieldValue vaccineRabiesDateFieldValue,
    DateTime? reVaccinationDate,
    FieldValue reVaccinationDateFieldValue,
    List<String>? imagesUrls,
    FieldValue imagesUrlsFieldValue,
    bool? pinned,
    FieldValue pinnedFieldValue,
    bool? adopted,
    FieldValue adoptedFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String sex,
    FieldValue sexFieldValue,
    String name,
    FieldValue nameFieldValue,
    String? description,
    FieldValue descriptionFieldValue,
    String? features,
    FieldValue featuresFieldValue,
    String? location,
    FieldValue locationFieldValue,
    String? descriptionEn,
    FieldValue descriptionEnFieldValue,
    String? featuresEn,
    FieldValue featuresEnFieldValue,
    String? locationEn,
    FieldValue locationEnFieldValue,
    String? descriptionDe,
    FieldValue descriptionDeFieldValue,
    String? featuresDe,
    FieldValue featuresDeFieldValue,
    String? locationDe,
    FieldValue locationDeFieldValue,
    DateTime birthDate,
    FieldValue birthDateFieldValue,
    DateTime? shelterArriveDate,
    FieldValue shelterArriveDateFieldValue,
    DateTime? sterilizationDate,
    FieldValue sterilizationDateFieldValue,
    DateTime? chipDate,
    FieldValue chipDateFieldValue,
    DateTime? viralVaccineDate,
    FieldValue viralVaccineDateFieldValue,
    DateTime? vaccineRabiesDate,
    FieldValue vaccineRabiesDateFieldValue,
    DateTime? reVaccinationDate,
    FieldValue reVaccinationDateFieldValue,
    List<String>? imagesUrls,
    FieldValue imagesUrlsFieldValue,
    bool? pinned,
    FieldValue pinnedFieldValue,
    bool? adopted,
    FieldValue adoptedFieldValue,
  });
}

class _$CatDocumentReference
    extends FirestoreDocumentReference<Cat, CatDocumentSnapshot>
    implements CatDocumentReference {
  _$CatDocumentReference(this.reference);

  @override
  final DocumentReference<Cat> reference;

  /// A reference to the [CatCollectionReference] containing this document.
  CatCollectionReference get parent {
    return _$CatCollectionReference(reference.firestore);
  }

  @override
  Stream<CatDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CatDocumentSnapshot._);
  }

  @override
  Future<CatDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CatDocumentSnapshot._);
  }

  @override
  Future<CatDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(CatDocumentSnapshot._);
  }

  Future<void> update({
    Object? sex = _sentinel,
    FieldValue? sexFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? features = _sentinel,
    FieldValue? featuresFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? descriptionEn = _sentinel,
    FieldValue? descriptionEnFieldValue,
    Object? featuresEn = _sentinel,
    FieldValue? featuresEnFieldValue,
    Object? locationEn = _sentinel,
    FieldValue? locationEnFieldValue,
    Object? descriptionDe = _sentinel,
    FieldValue? descriptionDeFieldValue,
    Object? featuresDe = _sentinel,
    FieldValue? featuresDeFieldValue,
    Object? locationDe = _sentinel,
    FieldValue? locationDeFieldValue,
    Object? birthDate = _sentinel,
    FieldValue? birthDateFieldValue,
    Object? shelterArriveDate = _sentinel,
    FieldValue? shelterArriveDateFieldValue,
    Object? sterilizationDate = _sentinel,
    FieldValue? sterilizationDateFieldValue,
    Object? chipDate = _sentinel,
    FieldValue? chipDateFieldValue,
    Object? viralVaccineDate = _sentinel,
    FieldValue? viralVaccineDateFieldValue,
    Object? vaccineRabiesDate = _sentinel,
    FieldValue? vaccineRabiesDateFieldValue,
    Object? reVaccinationDate = _sentinel,
    FieldValue? reVaccinationDateFieldValue,
    Object? imagesUrls = _sentinel,
    FieldValue? imagesUrlsFieldValue,
    Object? pinned = _sentinel,
    FieldValue? pinnedFieldValue,
    Object? adopted = _sentinel,
    FieldValue? adoptedFieldValue,
  }) async {
    assert(
      sex == _sentinel || sexFieldValue == null,
      "Cannot specify both sex and sexFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      features == _sentinel || featuresFieldValue == null,
      "Cannot specify both features and featuresFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      descriptionEn == _sentinel || descriptionEnFieldValue == null,
      "Cannot specify both descriptionEn and descriptionEnFieldValue",
    );
    assert(
      featuresEn == _sentinel || featuresEnFieldValue == null,
      "Cannot specify both featuresEn and featuresEnFieldValue",
    );
    assert(
      locationEn == _sentinel || locationEnFieldValue == null,
      "Cannot specify both locationEn and locationEnFieldValue",
    );
    assert(
      descriptionDe == _sentinel || descriptionDeFieldValue == null,
      "Cannot specify both descriptionDe and descriptionDeFieldValue",
    );
    assert(
      featuresDe == _sentinel || featuresDeFieldValue == null,
      "Cannot specify both featuresDe and featuresDeFieldValue",
    );
    assert(
      locationDe == _sentinel || locationDeFieldValue == null,
      "Cannot specify both locationDe and locationDeFieldValue",
    );
    assert(
      birthDate == _sentinel || birthDateFieldValue == null,
      "Cannot specify both birthDate and birthDateFieldValue",
    );
    assert(
      shelterArriveDate == _sentinel || shelterArriveDateFieldValue == null,
      "Cannot specify both shelterArriveDate and shelterArriveDateFieldValue",
    );
    assert(
      sterilizationDate == _sentinel || sterilizationDateFieldValue == null,
      "Cannot specify both sterilizationDate and sterilizationDateFieldValue",
    );
    assert(
      chipDate == _sentinel || chipDateFieldValue == null,
      "Cannot specify both chipDate and chipDateFieldValue",
    );
    assert(
      viralVaccineDate == _sentinel || viralVaccineDateFieldValue == null,
      "Cannot specify both viralVaccineDate and viralVaccineDateFieldValue",
    );
    assert(
      vaccineRabiesDate == _sentinel || vaccineRabiesDateFieldValue == null,
      "Cannot specify both vaccineRabiesDate and vaccineRabiesDateFieldValue",
    );
    assert(
      reVaccinationDate == _sentinel || reVaccinationDateFieldValue == null,
      "Cannot specify both reVaccinationDate and reVaccinationDateFieldValue",
    );
    assert(
      imagesUrls == _sentinel || imagesUrlsFieldValue == null,
      "Cannot specify both imagesUrls and imagesUrlsFieldValue",
    );
    assert(
      pinned == _sentinel || pinnedFieldValue == null,
      "Cannot specify both pinned and pinnedFieldValue",
    );
    assert(
      adopted == _sentinel || adoptedFieldValue == null,
      "Cannot specify both adopted and adoptedFieldValue",
    );
    final json = {
      if (sex != _sentinel) _$CatFieldMap['sex']!: sex as String,
      if (sexFieldValue != null) _$CatFieldMap['sex']!: sexFieldValue,
      if (name != _sentinel) _$CatFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$CatFieldMap['name']!: nameFieldValue,
      if (description != _sentinel)
        _$CatFieldMap['description']!: description as String?,
      if (descriptionFieldValue != null)
        _$CatFieldMap['description']!: descriptionFieldValue,
      if (features != _sentinel)
        _$CatFieldMap['features']!: features as String?,
      if (featuresFieldValue != null)
        _$CatFieldMap['features']!: featuresFieldValue,
      if (location != _sentinel)
        _$CatFieldMap['location']!: location as String?,
      if (locationFieldValue != null)
        _$CatFieldMap['location']!: locationFieldValue,
      if (descriptionEn != _sentinel)
        _$CatFieldMap['descriptionEn']!: descriptionEn as String?,
      if (descriptionEnFieldValue != null)
        _$CatFieldMap['descriptionEn']!: descriptionEnFieldValue,
      if (featuresEn != _sentinel)
        _$CatFieldMap['featuresEn']!: featuresEn as String?,
      if (featuresEnFieldValue != null)
        _$CatFieldMap['featuresEn']!: featuresEnFieldValue,
      if (locationEn != _sentinel)
        _$CatFieldMap['locationEn']!: locationEn as String?,
      if (locationEnFieldValue != null)
        _$CatFieldMap['locationEn']!: locationEnFieldValue,
      if (descriptionDe != _sentinel)
        _$CatFieldMap['descriptionDe']!: descriptionDe as String?,
      if (descriptionDeFieldValue != null)
        _$CatFieldMap['descriptionDe']!: descriptionDeFieldValue,
      if (featuresDe != _sentinel)
        _$CatFieldMap['featuresDe']!: featuresDe as String?,
      if (featuresDeFieldValue != null)
        _$CatFieldMap['featuresDe']!: featuresDeFieldValue,
      if (locationDe != _sentinel)
        _$CatFieldMap['locationDe']!: locationDe as String?,
      if (locationDeFieldValue != null)
        _$CatFieldMap['locationDe']!: locationDeFieldValue,
      if (birthDate != _sentinel)
        _$CatFieldMap['birthDate']!: birthDate as DateTime,
      if (birthDateFieldValue != null)
        _$CatFieldMap['birthDate']!: birthDateFieldValue,
      if (shelterArriveDate != _sentinel)
        _$CatFieldMap['shelterArriveDate']!: shelterArriveDate as DateTime?,
      if (shelterArriveDateFieldValue != null)
        _$CatFieldMap['shelterArriveDate']!: shelterArriveDateFieldValue,
      if (sterilizationDate != _sentinel)
        _$CatFieldMap['sterilizationDate']!: sterilizationDate as DateTime?,
      if (sterilizationDateFieldValue != null)
        _$CatFieldMap['sterilizationDate']!: sterilizationDateFieldValue,
      if (chipDate != _sentinel)
        _$CatFieldMap['chipDate']!: chipDate as DateTime?,
      if (chipDateFieldValue != null)
        _$CatFieldMap['chipDate']!: chipDateFieldValue,
      if (viralVaccineDate != _sentinel)
        _$CatFieldMap['viralVaccineDate']!: viralVaccineDate as DateTime?,
      if (viralVaccineDateFieldValue != null)
        _$CatFieldMap['viralVaccineDate']!: viralVaccineDateFieldValue,
      if (vaccineRabiesDate != _sentinel)
        _$CatFieldMap['vaccineRabiesDate']!: vaccineRabiesDate as DateTime?,
      if (vaccineRabiesDateFieldValue != null)
        _$CatFieldMap['vaccineRabiesDate']!: vaccineRabiesDateFieldValue,
      if (reVaccinationDate != _sentinel)
        _$CatFieldMap['reVaccinationDate']!: reVaccinationDate as DateTime?,
      if (reVaccinationDateFieldValue != null)
        _$CatFieldMap['reVaccinationDate']!: reVaccinationDateFieldValue,
      if (imagesUrls != _sentinel)
        _$CatFieldMap['imagesUrls']!: imagesUrls as List<String>?,
      if (imagesUrlsFieldValue != null)
        _$CatFieldMap['imagesUrls']!: imagesUrlsFieldValue,
      if (pinned != _sentinel) _$CatFieldMap['pinned']!: pinned as bool?,
      if (pinnedFieldValue != null) _$CatFieldMap['pinned']!: pinnedFieldValue,
      if (adopted != _sentinel) _$CatFieldMap['adopted']!: adopted as bool?,
      if (adoptedFieldValue != null)
        _$CatFieldMap['adopted']!: adoptedFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? sex = _sentinel,
    FieldValue? sexFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? features = _sentinel,
    FieldValue? featuresFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? descriptionEn = _sentinel,
    FieldValue? descriptionEnFieldValue,
    Object? featuresEn = _sentinel,
    FieldValue? featuresEnFieldValue,
    Object? locationEn = _sentinel,
    FieldValue? locationEnFieldValue,
    Object? descriptionDe = _sentinel,
    FieldValue? descriptionDeFieldValue,
    Object? featuresDe = _sentinel,
    FieldValue? featuresDeFieldValue,
    Object? locationDe = _sentinel,
    FieldValue? locationDeFieldValue,
    Object? birthDate = _sentinel,
    FieldValue? birthDateFieldValue,
    Object? shelterArriveDate = _sentinel,
    FieldValue? shelterArriveDateFieldValue,
    Object? sterilizationDate = _sentinel,
    FieldValue? sterilizationDateFieldValue,
    Object? chipDate = _sentinel,
    FieldValue? chipDateFieldValue,
    Object? viralVaccineDate = _sentinel,
    FieldValue? viralVaccineDateFieldValue,
    Object? vaccineRabiesDate = _sentinel,
    FieldValue? vaccineRabiesDateFieldValue,
    Object? reVaccinationDate = _sentinel,
    FieldValue? reVaccinationDateFieldValue,
    Object? imagesUrls = _sentinel,
    FieldValue? imagesUrlsFieldValue,
    Object? pinned = _sentinel,
    FieldValue? pinnedFieldValue,
    Object? adopted = _sentinel,
    FieldValue? adoptedFieldValue,
  }) {
    assert(
      sex == _sentinel || sexFieldValue == null,
      "Cannot specify both sex and sexFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      features == _sentinel || featuresFieldValue == null,
      "Cannot specify both features and featuresFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      descriptionEn == _sentinel || descriptionEnFieldValue == null,
      "Cannot specify both descriptionEn and descriptionEnFieldValue",
    );
    assert(
      featuresEn == _sentinel || featuresEnFieldValue == null,
      "Cannot specify both featuresEn and featuresEnFieldValue",
    );
    assert(
      locationEn == _sentinel || locationEnFieldValue == null,
      "Cannot specify both locationEn and locationEnFieldValue",
    );
    assert(
      descriptionDe == _sentinel || descriptionDeFieldValue == null,
      "Cannot specify both descriptionDe and descriptionDeFieldValue",
    );
    assert(
      featuresDe == _sentinel || featuresDeFieldValue == null,
      "Cannot specify both featuresDe and featuresDeFieldValue",
    );
    assert(
      locationDe == _sentinel || locationDeFieldValue == null,
      "Cannot specify both locationDe and locationDeFieldValue",
    );
    assert(
      birthDate == _sentinel || birthDateFieldValue == null,
      "Cannot specify both birthDate and birthDateFieldValue",
    );
    assert(
      shelterArriveDate == _sentinel || shelterArriveDateFieldValue == null,
      "Cannot specify both shelterArriveDate and shelterArriveDateFieldValue",
    );
    assert(
      sterilizationDate == _sentinel || sterilizationDateFieldValue == null,
      "Cannot specify both sterilizationDate and sterilizationDateFieldValue",
    );
    assert(
      chipDate == _sentinel || chipDateFieldValue == null,
      "Cannot specify both chipDate and chipDateFieldValue",
    );
    assert(
      viralVaccineDate == _sentinel || viralVaccineDateFieldValue == null,
      "Cannot specify both viralVaccineDate and viralVaccineDateFieldValue",
    );
    assert(
      vaccineRabiesDate == _sentinel || vaccineRabiesDateFieldValue == null,
      "Cannot specify both vaccineRabiesDate and vaccineRabiesDateFieldValue",
    );
    assert(
      reVaccinationDate == _sentinel || reVaccinationDateFieldValue == null,
      "Cannot specify both reVaccinationDate and reVaccinationDateFieldValue",
    );
    assert(
      imagesUrls == _sentinel || imagesUrlsFieldValue == null,
      "Cannot specify both imagesUrls and imagesUrlsFieldValue",
    );
    assert(
      pinned == _sentinel || pinnedFieldValue == null,
      "Cannot specify both pinned and pinnedFieldValue",
    );
    assert(
      adopted == _sentinel || adoptedFieldValue == null,
      "Cannot specify both adopted and adoptedFieldValue",
    );
    final json = {
      if (sex != _sentinel) _$CatFieldMap['sex']!: sex as String,
      if (sexFieldValue != null) _$CatFieldMap['sex']!: sexFieldValue,
      if (name != _sentinel) _$CatFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$CatFieldMap['name']!: nameFieldValue,
      if (description != _sentinel)
        _$CatFieldMap['description']!: description as String?,
      if (descriptionFieldValue != null)
        _$CatFieldMap['description']!: descriptionFieldValue,
      if (features != _sentinel)
        _$CatFieldMap['features']!: features as String?,
      if (featuresFieldValue != null)
        _$CatFieldMap['features']!: featuresFieldValue,
      if (location != _sentinel)
        _$CatFieldMap['location']!: location as String?,
      if (locationFieldValue != null)
        _$CatFieldMap['location']!: locationFieldValue,
      if (birthDate != _sentinel)
        if (descriptionEn != _sentinel)
          _$CatFieldMap['descriptionEn']!: descriptionEn as String?,
      if (descriptionEnFieldValue != null)
        _$CatFieldMap['descriptionEn']!: descriptionEnFieldValue,
      if (featuresEn != _sentinel)
        _$CatFieldMap['featuresEn']!: featuresEn as String?,
      if (featuresEnFieldValue != null)
        _$CatFieldMap['featuresEn']!: featuresEnFieldValue,
      if (locationEn != _sentinel)
        _$CatFieldMap['locationEn']!: locationEn as String?,
      if (locationEnFieldValue != null)
        _$CatFieldMap['locationEn']!: locationEnFieldValue,
      if (birthDate != _sentinel)
        if (descriptionDe != _sentinel)
          _$CatFieldMap['descriptionDe']!: descriptionDe as String?,
      if (descriptionDeFieldValue != null)
        _$CatFieldMap['descriptionDe']!: descriptionDeFieldValue,
      if (featuresDe != _sentinel)
        _$CatFieldMap['featuresDe']!: featuresDe as String?,
      if (featuresDeFieldValue != null)
        _$CatFieldMap['featuresDe']!: featuresDeFieldValue,
      if (locationDe != _sentinel)
        _$CatFieldMap['locationDe']!: locationDe as String?,
      if (locationDeFieldValue != null)
        _$CatFieldMap['locationDe']!: locationDeFieldValue,
      if (birthDate != _sentinel)
        _$CatFieldMap['birthDate']!: birthDate as DateTime,
      if (birthDateFieldValue != null)
        _$CatFieldMap['birthDate']!: birthDateFieldValue,
      if (shelterArriveDate != _sentinel)
        _$CatFieldMap['shelterArriveDate']!: shelterArriveDate as DateTime?,
      if (shelterArriveDateFieldValue != null)
        _$CatFieldMap['shelterArriveDate']!: shelterArriveDateFieldValue,
      if (sterilizationDate != _sentinel)
        _$CatFieldMap['sterilizationDate']!: sterilizationDate as DateTime?,
      if (sterilizationDateFieldValue != null)
        _$CatFieldMap['sterilizationDate']!: sterilizationDateFieldValue,
      if (chipDate != _sentinel)
        _$CatFieldMap['chipDate']!: chipDate as DateTime?,
      if (chipDateFieldValue != null)
        _$CatFieldMap['chipDate']!: chipDateFieldValue,
      if (viralVaccineDate != _sentinel)
        _$CatFieldMap['viralVaccineDate']!: viralVaccineDate as DateTime?,
      if (viralVaccineDateFieldValue != null)
        _$CatFieldMap['viralVaccineDate']!: viralVaccineDateFieldValue,
      if (vaccineRabiesDate != _sentinel)
        _$CatFieldMap['vaccineRabiesDate']!: vaccineRabiesDate as DateTime?,
      if (vaccineRabiesDateFieldValue != null)
        _$CatFieldMap['vaccineRabiesDate']!: vaccineRabiesDateFieldValue,
      if (reVaccinationDate != _sentinel)
        _$CatFieldMap['reVaccinationDate']!: reVaccinationDate as DateTime?,
      if (reVaccinationDateFieldValue != null)
        _$CatFieldMap['reVaccinationDate']!: reVaccinationDateFieldValue,
      if (imagesUrls != _sentinel)
        _$CatFieldMap['imagesUrls']!: imagesUrls as List<String>?,
      if (imagesUrlsFieldValue != null)
        _$CatFieldMap['imagesUrls']!: imagesUrlsFieldValue,
      if (pinned != _sentinel) _$CatFieldMap['pinned']!: pinned as bool?,
      if (pinnedFieldValue != null) _$CatFieldMap['pinned']!: pinnedFieldValue,
      if (adopted != _sentinel) _$CatFieldMap['adopted']!: adopted as bool?,
      if (adoptedFieldValue != null)
        _$CatFieldMap['adopted']!: adoptedFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CatDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CatQuery implements QueryReference<Cat, CatQuerySnapshot> {
  @override
  CatQuery limit(int limit);

  @override
  CatQuery limitToLast(int limit);

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
  CatQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
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
  CatQuery whereFieldPath(
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

  CatQuery whereDocumentId({
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
  CatQuery whereSex({
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
  CatQuery whereName({
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
  CatQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  CatQuery whereFeatures({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  CatQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  CatQuery whereBirthDate({
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
  CatQuery whereShelterArriveDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  CatQuery whereSterilizationDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  CatQuery whereChipDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  CatQuery whereViralVaccineDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  CatQuery whereVaccineRabiesDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  CatQuery whereReVaccinationDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  CatQuery whereImagesUrls({
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
  CatQuery wherePinned({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  CatQuery whereAdopted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });

  CatQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderBySex({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByDescription({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByFeatures({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByLocation({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByBirthDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByShelterArriveDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderBySterilizationDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByChipDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByViralVaccineDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByVaccineRabiesDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByReVaccinationDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByImagesUrls({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByPinned({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });

  CatQuery orderByAdopted({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  });
}

class _$CatQuery extends QueryReference<Cat, CatQuerySnapshot>
    implements CatQuery {
  _$CatQuery(
    this._collection, {
    required Query<Cat> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CatQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(CatQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CatQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CatQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CatQuery limit(int limit) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CatQuery limitToLast(int limit) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  CatQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
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
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery whereFieldPath(
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
    return _$CatQuery(
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

  CatQuery whereDocumentId({
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
    return _$CatQuery(
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

  CatQuery whereSex({
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
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['sex']!,
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

  CatQuery whereName({
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
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['name']!,
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

  CatQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['description']!,
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

  CatQuery whereFeatures({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['features']!,
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

  CatQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['location']!,
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

  CatQuery whereBirthDate({
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
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['birthDate']!,
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

  CatQuery whereShelterArriveDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['shelterArriveDate']!,
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

  CatQuery whereSterilizationDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['sterilizationDate']!,
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

  CatQuery whereChipDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['chipDate']!,
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

  CatQuery whereViralVaccineDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['viralVaccineDate']!,
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

  CatQuery whereVaccineRabiesDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['vaccineRabiesDate']!,
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

  CatQuery whereReVaccinationDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['reVaccinationDate']!,
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

  CatQuery whereImagesUrls({
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
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['imagesUrls']!,
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

  CatQuery wherePinned({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['pinned']!,
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

  CatQuery whereAdopted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CatFieldMap['adopted']!,
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

  CatQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderBySex({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['sex']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['name']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['description']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByFeatures({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['features']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByLocation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['location']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByBirthDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['birthDate']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByShelterArriveDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CatFieldMap['shelterArriveDate']!, descending: descending);
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderBySterilizationDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CatFieldMap['sterilizationDate']!, descending: descending);
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByChipDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['chipDate']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByViralVaccineDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CatFieldMap['viralVaccineDate']!, descending: descending);
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByVaccineRabiesDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CatFieldMap['vaccineRabiesDate']!, descending: descending);
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByReVaccinationDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CatFieldMap['reVaccinationDate']!, descending: descending);
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByImagesUrls({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['imagesUrls']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByPinned({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['pinned']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CatQuery orderByAdopted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CatDocumentSnapshot? startAtDocument,
    CatDocumentSnapshot? endAtDocument,
    CatDocumentSnapshot? endBeforeDocument,
    CatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$CatFieldMap['adopted']!,
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

    return _$CatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CatQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CatDocumentSnapshot extends FirestoreDocumentSnapshot<Cat> {
  CatDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Cat> snapshot;

  @override
  CatDocumentReference get reference {
    return CatDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Cat? data;
}

class CatQuerySnapshot
    extends FirestoreQuerySnapshot<Cat, CatQueryDocumentSnapshot> {
  CatQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CatQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Cat> snapshot,
  ) {
    final docs = snapshot.docs.map(CatQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CatDocumentSnapshot._,
      );
    }).toList();

    return CatQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CatDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CatDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CatDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Cat> snapshot;

  @override
  final List<CatQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CatDocumentSnapshot>> docChanges;
}

class CatQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Cat>
    implements CatDocumentSnapshot {
  CatQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Cat> snapshot;

  @override
  final Cat data;

  @override
  CatDocumentReference get reference {
    return CatDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      sex: json['sex'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      features: json['features'] as String?,
      location: json['location'] as String?,
      descriptionEn: json['description_en'] as String?,
      featuresEn: json['features_en'] as String?,
      locationEn: json['location_en'] as String?,
      descriptionDe: json['description_de'] as String?,
      featuresDe: json['features_de'] as String?,
      locationDe: json['location_de'] as String?,
      birthDate: const FirestoreDateTimeConverter()
          .fromJson(json['birth_date'] as Timestamp),
      adoptionDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['adoption_date'], const FirestoreDateTimeConverter().fromJson),
      shelterArriveDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['shelter_arrive_date'],
          const FirestoreDateTimeConverter().fromJson),
      sterilizationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['sterilization_date'],
          const FirestoreDateTimeConverter().fromJson),
      chipDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['chip_date'], const FirestoreDateTimeConverter().fromJson),
      viralVaccineDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['viral_vaccine_date'],
          const FirestoreDateTimeConverter().fromJson),
      vaccineRabiesDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['vaccine_rabies_date'],
          const FirestoreDateTimeConverter().fromJson),
      reVaccinationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['re_vaccination_date'],
          const FirestoreDateTimeConverter().fromJson),
      imagesUrls: (json['images_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pinned: json['pinned'] as bool?,
      adopted: json['adopted'] as bool?,
      id: json['id'] as String?,
    );

const _$CatFieldMap = <String, String>{
  'id': 'id',
  'sex': 'sex',
  'name': 'name',
  'description': 'description',
  'features': 'features',
  'location': 'location',
  'descriptionEn': 'description_en',
  'featuresEn': 'features_en',
  'locationEn': 'location_en',
  'descriptionDe': 'description_de',
  'featuresDe': 'features_de',
  'locationDe': 'location_de',
  'birthDate': 'birth_date',
  'shelterArriveDate': 'shelter_arrive_date',
  'adoptionDate': 'adoption_date',
  'sterilizationDate': 'sterilization_date',
  'chipDate': 'chip_date',
  'viralVaccineDate': 'viral_vaccine_date',
  'vaccineRabiesDate': 'vaccine_rabies_date',
  'reVaccinationDate': 're_vaccination_date',
  'imagesUrls': 'images_urls',
  'pinned': 'pinned',
  'adopted': 'adopted',
};

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'id': instance.id,
      'sex': instance.sex,
      'name': instance.name,
      'description': instance.description,
      'features': instance.features,
      'location': instance.location,
      'description_en': instance.descriptionEn,
      'features_en': instance.featuresEn,
      'location_en': instance.locationEn,
      'description_de': instance.descriptionDe,
      'features_de': instance.featuresDe,
      'location_de': instance.locationDe,
      'birth_date':
          const FirestoreDateTimeConverter().toJson(instance.birthDate),
      'shelter_arrive_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.shelterArriveDate,
          const FirestoreDateTimeConverter().toJson),
      'adoption_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.adoptionDate, const FirestoreDateTimeConverter().toJson),
      'sterilization_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.sterilizationDate,
          const FirestoreDateTimeConverter().toJson),
      'chip_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.chipDate, const FirestoreDateTimeConverter().toJson),
      'viral_vaccine_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.viralVaccineDate, const FirestoreDateTimeConverter().toJson),
      'vaccine_rabies_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.vaccineRabiesDate,
          const FirestoreDateTimeConverter().toJson),
      're_vaccination_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.reVaccinationDate,
          const FirestoreDateTimeConverter().toJson),
      'images_urls': instance.imagesUrls,
      'pinned': instance.pinned,
      'adopted': instance.adopted,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
