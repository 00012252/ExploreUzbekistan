import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RoutesRecord extends FirestoreRecord {
  RoutesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "routeName" field.
  String? _routeName;
  String get routeName => _routeName ?? '';
  bool hasRouteName() => _routeName != null;

  // "routeDesc" field.
  String? _routeDesc;
  String get routeDesc => _routeDesc ?? '';
  bool hasRouteDesc() => _routeDesc != null;

  // "routeLocations" field.
  List<DocumentReference>? _routeLocations;
  List<DocumentReference> get routeLocations => _routeLocations ?? const [];
  bool hasRouteLocations() => _routeLocations != null;

  // "routeImage" field.
  String? _routeImage;
  String get routeImage => _routeImage ?? '';
  bool hasRouteImage() => _routeImage != null;

  void _initializeFields() {
    _routeName = snapshotData['routeName'] as String?;
    _routeDesc = snapshotData['routeDesc'] as String?;
    _routeLocations = getDataList(snapshotData['routeLocations']);
    _routeImage = snapshotData['routeImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('routes');

  static Stream<RoutesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoutesRecord.fromSnapshot(s));

  static Future<RoutesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoutesRecord.fromSnapshot(s));

  static RoutesRecord fromSnapshot(DocumentSnapshot snapshot) => RoutesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoutesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoutesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoutesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoutesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoutesRecordData({
  String? routeName,
  String? routeDesc,
  String? routeImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'routeName': routeName,
      'routeDesc': routeDesc,
      'routeImage': routeImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoutesRecordDocumentEquality implements Equality<RoutesRecord> {
  const RoutesRecordDocumentEquality();

  @override
  bool equals(RoutesRecord? e1, RoutesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.routeName == e2?.routeName &&
        e1?.routeDesc == e2?.routeDesc &&
        listEquality.equals(e1?.routeLocations, e2?.routeLocations) &&
        e1?.routeImage == e2?.routeImage;
  }

  @override
  int hash(RoutesRecord? e) => const ListEquality()
      .hash([e?.routeName, e?.routeDesc, e?.routeLocations, e?.routeImage]);

  @override
  bool isValidKey(Object? o) => o is RoutesRecord;
}
