// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:kotonosyky_admin/objects/user_profile.dart';

const firestoreSerializable = JsonSerializable(
  converters: [
    FirestoreDateTimeConverter(),
    FirestoreTimestampConverter(),
    FirestoreDocumentReferenceConverter(),
  ],
  explicitToJson: true,
  createFieldMap: true,
  fieldRename: FieldRename.snake,
);

// class UserProfileDocumentReferenceSerializer
//     implements
//         JsonConverter<DocumentReference<UserProfile>,
//             DocumentReference<Map<String, dynamic>>> {
//   const UserProfileDocumentReferenceSerializer();
//
//   @override
//   DocumentReference<UserProfile> fromJson(json) =>
//       const FirestoreDocumentReferenceConverter().fromJson(json).withConverter(
//           fromFirestore: (value, options) =>
//               UserProfile.fromJson(value.data()!),
//           toFirestore: (value, options) => value.toJson());
//
//   @override
//   DocumentReference<Map<String, dynamic>> toJson(object) =>
//       const FirestoreDocumentReferenceConverter().toJson(object.withConverter(
//           fromFirestore: (value, options) => value.data()!,
//           toFirestore: (value, options) => value));
// // const FirestoreDocumentReferenceConverter().toJson(object).withConverter(
// //         fromFirestore: (value, options) =>
// //             UserProfile.fromJson(value.data()!),
// //         toFirestore: (value, options) => value.toJson());
// }
