import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttractionsRecord extends FirestoreRecord {
  AttractionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "attractionName" field.
  String? _attractionName;
  String get attractionName => _attractionName ?? '';
  bool hasAttractionName() => _attractionName != null;

  // "attractionDescription" field.
  String? _attractionDescription;
  String get attractionDescription => _attractionDescription ?? '';
  bool hasAttractionDescription() => _attractionDescription != null;

  // "histBackg" field.
  String? _histBackg;
  String get histBackg => _histBackg ?? '';
  bool hasHistBackg() => _histBackg != null;

  // "workHours" field.
  String? _workHours;
  String get workHours => _workHours ?? '';
  bool hasWorkHours() => _workHours != null;

  // "ticketPrice" field.
  int? _ticketPrice;
  int get ticketPrice => _ticketPrice ?? 0;
  bool hasTicketPrice() => _ticketPrice != null;

  // "attractionImage" field.
  String? _attractionImage;
  String get attractionImage => _attractionImage ?? '';
  bool hasAttractionImage() => _attractionImage != null;

  // "attractionType" field.
  String? _attractionType;
  String get attractionType => _attractionType ?? '';
  bool hasAttractionType() => _attractionType != null;

  // "attractionLocation" field.
  LatLng? _attractionLocation;
  LatLng? get attractionLocation => _attractionLocation;
  bool hasAttractionLocation() => _attractionLocation != null;

  // "attractionCityLocation" field.
  String? _attractionCityLocation;
  String get attractionCityLocation => _attractionCityLocation ?? '';
  bool hasAttractionCityLocation() => _attractionCityLocation != null;

  void _initializeFields() {
    _attractionName = snapshotData['attractionName'] as String?;
    _attractionDescription = snapshotData['attractionDescription'] as String?;
    _histBackg = snapshotData['histBackg'] as String?;
    _workHours = snapshotData['workHours'] as String?;
    _ticketPrice = castToType<int>(snapshotData['ticketPrice']);
    _attractionImage = snapshotData['attractionImage'] as String?;
    _attractionType = snapshotData['attractionType'] as String?;
    _attractionLocation = snapshotData['attractionLocation'] as LatLng?;
    _attractionCityLocation = snapshotData['attractionCityLocation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attractions');

  static Stream<AttractionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttractionsRecord.fromSnapshot(s));

  static Future<AttractionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttractionsRecord.fromSnapshot(s));

  static AttractionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttractionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttractionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttractionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttractionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttractionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttractionsRecordData({
  String? attractionName,
  String? attractionDescription,
  String? histBackg,
  String? workHours,
  int? ticketPrice,
  String? attractionImage,
  String? attractionType,
  LatLng? attractionLocation,
  String? attractionCityLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'attractionName': attractionName,
      'attractionDescription': attractionDescription,
      'histBackg': histBackg,
      'workHours': workHours,
      'ticketPrice': ticketPrice,
      'attractionImage': attractionImage,
      'attractionType': attractionType,
      'attractionLocation': attractionLocation,
      'attractionCityLocation': attractionCityLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttractionsRecordDocumentEquality implements Equality<AttractionsRecord> {
  const AttractionsRecordDocumentEquality();

  @override
  bool equals(AttractionsRecord? e1, AttractionsRecord? e2) {
    return e1?.attractionName == e2?.attractionName &&
        e1?.attractionDescription == e2?.attractionDescription &&
        e1?.histBackg == e2?.histBackg &&
        e1?.workHours == e2?.workHours &&
        e1?.ticketPrice == e2?.ticketPrice &&
        e1?.attractionImage == e2?.attractionImage &&
        e1?.attractionType == e2?.attractionType &&
        e1?.attractionLocation == e2?.attractionLocation &&
        e1?.attractionCityLocation == e2?.attractionCityLocation;
  }

  @override
  int hash(AttractionsRecord? e) => const ListEquality().hash([
        e?.attractionName,
        e?.attractionDescription,
        e?.histBackg,
        e?.workHours,
        e?.ticketPrice,
        e?.attractionImage,
        e?.attractionType,
        e?.attractionLocation,
        e?.attractionCityLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is AttractionsRecord;
}
