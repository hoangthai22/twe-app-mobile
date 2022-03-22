import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:twe/common/constants.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

//generate String major from list major
getMajorString(List majorList) {
  var majors = "";

  for (var element in majorList) {
    if (majors != "") {
      majors = "$majors, $element";
    } else {
      majors = element;
    }
  }
  return majors;
}

getSlot(int slot) {
  switch (slot) {
    case 1:
      return SLOT[0];
    case 2:
      return SLOT[1];
    case 3:
      return SLOT[2];
    case 4:
      return SLOT[3];
    case 5:
      return SLOT[4];
    case 6:
      return SLOT[5];

    default:
  }
}

getStatusString(int status) {
  switch (status) {
    case 0:
      return "Đang chờ Mentor xác nhận";
    case 1:
      return "Meeting đã được xác nhận";
    case 2:
      return "Meeting đã hoàn thành";
    case 3:
      return "Meeting đã hủy";
    default:
      return "Đang xử lý";
  }
}

getStatusStringInMyMeetup(int status, bool isLead) {
  switch (status) {
    case 0:
      return "Chờ Mentor";
    case 1:
      if (isLead) {
        return "Của tôi";
      } else {
        return "Góp mặt";
      }
    case 2:
      return "Hoàn thành";
    case 3:
      return "Đã hủy";
    default:
      return "Đang xử lý";
  }
}

getStatusStringIsJoin(int isJoin) {
  switch (isJoin) {
    case 0:
      return "Yêu cầu tham gia";
    case 1:
      return "Đã yêu cầu";
    case 2:
      return "Đã tham gia";
    default:
      return "Đang xử lý";
  }
}

getRole(int role){
 switch (role) {
    case 1:
      return "User";
    case 2:
      return "Location";
    case 3:
      return "Mentor";
    case 4:
      return "Admin";
    default:
      return "Not found";
  }
}