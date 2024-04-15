import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DiscUzblogRecord extends FirestoreRecord {
  DiscUzblogRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "intro" field.
  String? _intro;
  String get intro => _intro ?? '';
  bool hasIntro() => _intro != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "hashtag1" field.
  String? _hashtag1;
  String get hashtag1 => _hashtag1 ?? '';
  bool hasHashtag1() => _hashtag1 != null;

  // "hashtag2" field.
  String? _hashtag2;
  String get hashtag2 => _hashtag2 ?? '';
  bool hasHashtag2() => _hashtag2 != null;

  // "postContent" field.
  String? _postContent;
  String get postContent => _postContent ?? '';
  bool hasPostContent() => _postContent != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _intro = snapshotData['intro'] as String?;
    _image = snapshotData['image'] as String?;
    _hashtag1 = snapshotData['hashtag1'] as String?;
    _hashtag2 = snapshotData['hashtag2'] as String?;
    _postContent = snapshotData['postContent'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discUzblog');

  static Stream<DiscUzblogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiscUzblogRecord.fromSnapshot(s));

  static Future<DiscUzblogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiscUzblogRecord.fromSnapshot(s));

  static DiscUzblogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiscUzblogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiscUzblogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiscUzblogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiscUzblogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiscUzblogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiscUzblogRecordData({
  String? title,
  String? intro,
  String? image,
  String? hashtag1,
  String? hashtag2,
  String? postContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'intro': intro,
      'image': image,
      'hashtag1': hashtag1,
      'hashtag2': hashtag2,
      'postContent': postContent,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiscUzblogRecordDocumentEquality implements Equality<DiscUzblogRecord> {
  const DiscUzblogRecordDocumentEquality();

  @override
  bool equals(DiscUzblogRecord? e1, DiscUzblogRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.intro == e2?.intro &&
        e1?.image == e2?.image &&
        e1?.hashtag1 == e2?.hashtag1 &&
        e1?.hashtag2 == e2?.hashtag2 &&
        e1?.postContent == e2?.postContent;
  }

  @override
  int hash(DiscUzblogRecord? e) => const ListEquality().hash(
      [e?.title, e?.intro, e?.image, e?.hashtag1, e?.hashtag2, e?.postContent]);

  @override
  bool isValidKey(Object? o) => o is DiscUzblogRecord;
}
