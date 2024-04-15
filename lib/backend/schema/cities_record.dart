import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CitiesRecord extends FirestoreRecord {
  CitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "cityDescription" field.
  String? _cityDescription;
  String get cityDescription => _cityDescription ?? '';
  bool hasCityDescription() => _cityDescription != null;

  // "hotelPriceRange" field.
  String? _hotelPriceRange;
  String get hotelPriceRange => _hotelPriceRange ?? '';
  bool hasHotelPriceRange() => _hotelPriceRange != null;

  // "location" field.
  DocumentReference? _location;
  DocumentReference? get location => _location;
  bool hasLocation() => _location != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _cityName = snapshotData['cityName'] as String?;
    _cityDescription = snapshotData['cityDescription'] as String?;
    _hotelPriceRange = snapshotData['hotelPriceRange'] as String?;
    _location = snapshotData['location'] as DocumentReference?;
    _image = snapshotData['Image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesRecord.fromSnapshot(s));

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitiesRecord.fromSnapshot(s));

  static CitiesRecord fromSnapshot(DocumentSnapshot snapshot) => CitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesRecordData({
  String? cityName,
  String? cityDescription,
  String? hotelPriceRange,
  DocumentReference? location,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cityName': cityName,
      'cityDescription': cityDescription,
      'hotelPriceRange': hotelPriceRange,
      'location': location,
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesRecordDocumentEquality implements Equality<CitiesRecord> {
  const CitiesRecordDocumentEquality();

  @override
  bool equals(CitiesRecord? e1, CitiesRecord? e2) {
    return e1?.cityName == e2?.cityName &&
        e1?.cityDescription == e2?.cityDescription &&
        e1?.hotelPriceRange == e2?.hotelPriceRange &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image;
  }

  @override
  int hash(CitiesRecord? e) => const ListEquality().hash([
        e?.cityName,
        e?.cityDescription,
        e?.hotelPriceRange,
        e?.location,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is CitiesRecord;
}
