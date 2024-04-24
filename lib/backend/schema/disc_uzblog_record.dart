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

  // "postContent2" field.
  String? _postContent2;
  String get postContent2 => _postContent2 ?? '';
  bool hasPostContent2() => _postContent2 != null;

  // "postContent3" field.
  String? _postContent3;
  String get postContent3 => _postContent3 ?? '';
  bool hasPostContent3() => _postContent3 != null;

  // "image2" field.
  String? _image2;
  String get image2 => _image2 ?? '';
  bool hasImage2() => _image2 != null;

  // "image3" field.
  String? _image3;
  String get image3 => _image3 ?? '';
  bool hasImage3() => _image3 != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _intro = snapshotData['intro'] as String?;
    _image = snapshotData['image'] as String?;
    _hashtag1 = snapshotData['hashtag1'] as String?;
    _hashtag2 = snapshotData['hashtag2'] as String?;
    _postContent = snapshotData['postContent'] as String?;
    _postContent2 = snapshotData['postContent2'] as String?;
    _postContent3 = snapshotData['postContent3'] as String?;
    _image2 = snapshotData['image2'] as String?;
    _image3 = snapshotData['image3'] as String?;
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
  String? postContent2,
  String? postContent3,
  String? image2,
  String? image3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'intro': intro,
      'image': image,
      'hashtag1': hashtag1,
      'hashtag2': hashtag2,
      'postContent': postContent,
      'postContent2': postContent2,
      'postContent3': postContent3,
      'image2': image2,
      'image3': image3,
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
        e1?.postContent == e2?.postContent &&
        e1?.postContent2 == e2?.postContent2 &&
        e1?.postContent3 == e2?.postContent3 &&
        e1?.image2 == e2?.image2 &&
        e1?.image3 == e2?.image3;
  }

  @override
  int hash(DiscUzblogRecord? e) => const ListEquality().hash([
        e?.title,
        e?.intro,
        e?.image,
        e?.hashtag1,
        e?.hashtag2,
        e?.postContent,
        e?.postContent2,
        e?.postContent3,
        e?.image2,
        e?.image3
      ]);

  @override
  bool isValidKey(Object? o) => o is DiscUzblogRecord;
}
