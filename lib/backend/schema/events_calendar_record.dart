import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EventsCalendarRecord extends FirestoreRecord {
  EventsCalendarRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "eventTitle" field.
  String? _eventTitle;
  String get eventTitle => _eventTitle ?? '';
  bool hasEventTitle() => _eventTitle != null;

  // "eventDesc" field.
  String? _eventDesc;
  String get eventDesc => _eventDesc ?? '';
  bool hasEventDesc() => _eventDesc != null;

  // "eventImage" field.
  String? _eventImage;
  String get eventImage => _eventImage ?? '';
  bool hasEventImage() => _eventImage != null;

  // "eventTicket" field.
  String? _eventTicket;
  String get eventTicket => _eventTicket ?? '';
  bool hasEventTicket() => _eventTicket != null;

  // "eventLatLng" field.
  LatLng? _eventLatLng;
  LatLng? get eventLatLng => _eventLatLng;
  bool hasEventLatLng() => _eventLatLng != null;

  // "eventLocation" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  bool hasEventLocation() => _eventLocation != null;

  // "eventBuyTicket" field.
  String? _eventBuyTicket;
  String get eventBuyTicket => _eventBuyTicket ?? '';
  bool hasEventBuyTicket() => _eventBuyTicket != null;

  // "eventBuyTicketLink" field.
  String? _eventBuyTicketLink;
  String get eventBuyTicketLink => _eventBuyTicketLink ?? '';
  bool hasEventBuyTicketLink() => _eventBuyTicketLink != null;

  // "eventDate" field.
  String? _eventDate;
  String get eventDate => _eventDate ?? '';
  bool hasEventDate() => _eventDate != null;

  // "eventTime" field.
  String? _eventTime;
  String get eventTime => _eventTime ?? '';
  bool hasEventTime() => _eventTime != null;

  void _initializeFields() {
    _eventTitle = snapshotData['eventTitle'] as String?;
    _eventDesc = snapshotData['eventDesc'] as String?;
    _eventImage = snapshotData['eventImage'] as String?;
    _eventTicket = snapshotData['eventTicket'] as String?;
    _eventLatLng = snapshotData['eventLatLng'] as LatLng?;
    _eventLocation = snapshotData['eventLocation'] as String?;
    _eventBuyTicket = snapshotData['eventBuyTicket'] as String?;
    _eventBuyTicketLink = snapshotData['eventBuyTicketLink'] as String?;
    _eventDate = snapshotData['eventDate'] as String?;
    _eventTime = snapshotData['eventTime'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eventsCalendar');

  static Stream<EventsCalendarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsCalendarRecord.fromSnapshot(s));

  static Future<EventsCalendarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsCalendarRecord.fromSnapshot(s));

  static EventsCalendarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventsCalendarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsCalendarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsCalendarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsCalendarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsCalendarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsCalendarRecordData({
  String? eventTitle,
  String? eventDesc,
  String? eventImage,
  String? eventTicket,
  LatLng? eventLatLng,
  String? eventLocation,
  String? eventBuyTicket,
  String? eventBuyTicketLink,
  String? eventDate,
  String? eventTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventTitle': eventTitle,
      'eventDesc': eventDesc,
      'eventImage': eventImage,
      'eventTicket': eventTicket,
      'eventLatLng': eventLatLng,
      'eventLocation': eventLocation,
      'eventBuyTicket': eventBuyTicket,
      'eventBuyTicketLink': eventBuyTicketLink,
      'eventDate': eventDate,
      'eventTime': eventTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsCalendarRecordDocumentEquality
    implements Equality<EventsCalendarRecord> {
  const EventsCalendarRecordDocumentEquality();

  @override
  bool equals(EventsCalendarRecord? e1, EventsCalendarRecord? e2) {
    return e1?.eventTitle == e2?.eventTitle &&
        e1?.eventDesc == e2?.eventDesc &&
        e1?.eventImage == e2?.eventImage &&
        e1?.eventTicket == e2?.eventTicket &&
        e1?.eventLatLng == e2?.eventLatLng &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventBuyTicket == e2?.eventBuyTicket &&
        e1?.eventBuyTicketLink == e2?.eventBuyTicketLink &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventTime == e2?.eventTime;
  }

  @override
  int hash(EventsCalendarRecord? e) => const ListEquality().hash([
        e?.eventTitle,
        e?.eventDesc,
        e?.eventImage,
        e?.eventTicket,
        e?.eventLatLng,
        e?.eventLocation,
        e?.eventBuyTicket,
        e?.eventBuyTicketLink,
        e?.eventDate,
        e?.eventTime
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsCalendarRecord;
}
