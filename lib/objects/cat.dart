import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

import 'firestore_serializable.dart';

part 'cat.g.dart';

@firestoreSerializable
class Cat {
  @Id()
  final String? id;
  final String sex, name;
  final String? description, features, location;
  final String? descriptionEn, featuresEn, locationEn;
  final String? descriptionDe, featuresDe, locationDe;
  @FirestoreDateTimeConverter()
  final DateTime birthDate;
  final DateTime? shelterArriveDate,
      adoptionDate,
      sterilizationDate,
      chipDate,
      viralVaccineDate,
      vaccineRabiesDate,
      reVaccinationDate;
  final List<String>? imagesUrls;
  final bool? pinned;
  final bool? adopted;
  // @UserProfileDocumentReferenceSerializer()
  // final DocumentReference<UserProfile>? curator;

  Cat({
    required this.sex,
    required this.name,
    this.description,
    this.features,
    this.location,
    this.descriptionEn,
    this.featuresEn,
    this.locationEn,
    this.descriptionDe,
    this.featuresDe,
    this.locationDe,
    required this.birthDate,
    this.adoptionDate,
    this.shelterArriveDate,
    this.sterilizationDate,
    this.chipDate,
    this.viralVaccineDate,
    this.vaccineRabiesDate,
    this.reVaccinationDate,
    this.imagesUrls,
    this.pinned,
    this.adopted,
    this.id,
    // this.curator,
  });

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  // factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);

  Cat copyWith({
    String? id,
    String? sex,
    String? name,
    String? description,
    String? features,
    String? location,
    String? descriptionEn,
    String? featuresEn,
    String? locationEn,
    String? descriptionDe,
    String? featuresDe,
    String? locationDe,
    DateTime? birthDate,
    DateTime? shelterArriveDate,
    DateTime? sterilizationDate,
    DateTime? chipDate,
    DateTime? viralVaccineDate,
    DateTime? vaccineRabiesDate,
    DateTime? reVaccinationDate,
    List<String>? imagesUrls,
    bool? pinned,
    bool? adopted,
    // DocumentReference<UserProfile>? curator,
  }) {
    return Cat(
      id: id ?? this.id,
      sex: sex ?? this.sex,
      name: name ?? this.name,
      description: description ?? this.description,
      features: features ?? this.features,
      location: location ?? this.location,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      featuresEn: featuresEn ?? this.featuresEn,
      locationEn: locationEn ?? this.locationEn,
      descriptionDe: descriptionDe ?? this.descriptionDe,
      featuresDe: featuresDe ?? this.featuresDe,
      locationDe: locationDe ?? this.locationDe,
      birthDate: birthDate ?? this.birthDate,
      shelterArriveDate: shelterArriveDate ?? this.shelterArriveDate,
      sterilizationDate: sterilizationDate ?? this.sterilizationDate,
      chipDate: chipDate ?? this.chipDate,
      viralVaccineDate: viralVaccineDate ?? this.viralVaccineDate,
      vaccineRabiesDate: vaccineRabiesDate ?? this.vaccineRabiesDate,
      reVaccinationDate: reVaccinationDate ?? this.reVaccinationDate,
      imagesUrls: imagesUrls ?? this.imagesUrls,
      pinned: pinned ?? this.pinned,
      adopted: adopted ?? this.adopted,
      // curator: curator ?? this.curator,
    );
  }
}

@Collection<Cat>('cats')
final catRef = CatCollectionReference();
