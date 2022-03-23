import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:twe/models/booking.dart';
import 'package:twe/models/history.dart';
import 'package:twe/models/location.dart';
import 'package:twe/models/feedback.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/models/mentor.dart';
import 'package:http/http.dart' as http;
import 'package:twe/models/nofication.dart';
import 'package:twe/models/subject.dart';
import 'package:twe/models/user.dart';

class ApiServices {
  static const baseURL = 'https://theweekendexpertise.azurewebsites.net/api/v1';

  static getListMentorPagination(int page, int limit) async {
    try {
      final response = await http.get(
          Uri.parse('${baseURL}/mentors?pageIndex=${page}&pageSize=${limit}'));

      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<MentorModel> mentors =
            body.map((dynamic item) => MentorModel.fromJson(item)).toList();
        return mentors;
      } else {
        print('Error with status code: ${response.statusCode}');
      }
    } on SocketException {
      print("Fail to connect API!");
    }
  }

  static getListMentorSortingPagination(bool sort, int page, int limit) async {
    try {
      final response = await http.get(Uri.parse(
          '${baseURL}/mentors/sorting?order_by_name=${sort ? "asc" : "desc"}&pageIndex=${page}&pageSize=${limit}'));

      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<MentorModel> mentors =
            body.map((dynamic item) => MentorModel.fromJson(item)).toList();
        return mentors;
      } else {
        print('Error with status code: ${response.statusCode}');
      }
    } on SocketException {
      print("Fail to connect API!");
    }
  }

  static Future<MentorModel> getMentorDetailByID(String id) async {
    var mentorModel = Completer<MentorModel>();

    var body;
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/mentors/${id}'),
      );
      body = convert.jsonDecode(response.body);
      mentorModel.complete(MentorModel.fromJson(body['data']));
    } catch (_) {
      mentorModel.complete(MentorModel.fromJson(body));
    } on SocketException {
      print("Fail to connect API!");
    }
    return mentorModel.future;
  }

  static Future<dynamic> getListMentorBySearchKey(String key) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/mentors/byName?name=${key}&pageIndex=1&pageSize=4'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<MentorModel> mentors =
            body.map((dynamic item) => MentorModel.fromJson(item)).toList();
        return mentors;
      } else if (response.statusCode == 404) {
        return [];
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getMajors() async {
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/majors'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<MajorModel> majorModel =
            body.map((dynamic item) => MajorModel.fromJson(item)).toList();
        return majorModel;
      } else if (response.statusCode == 404) {
        return [];
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getSkillBymajorId(String id) async {
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/skills/majorId?majorId=${id}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<SubjectModel> listSubjects =
            body.map((dynamic item) => SubjectModel.fromJson(item)).toList();
        return listSubjects;
      } else if (response.statusCode == 404) {
        return [];
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListMentorBymajorName(
      String majorName, int page, int limit) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/mentors/filter?major=${majorName}&pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<MentorModel> listMentors =
            body.map((dynamic item) => MentorModel.fromJson(item)).toList();
        return listMentors;
      } else if (response.statusCode == 404) {
        List<MentorModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListMentorTopRank(int page, int limit) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/mentors/top_rate?pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<MentorModel> listMentors =
            body.map((dynamic item) => MentorModel.fromJson(item)).toList();
        return listMentors;
      } else if (response.statusCode == 404) {
        List<MentorModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListFeebackByMentorId(
      String mentorId, int page, int limit) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/mentors/feedback/${mentorId}?pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<FeedbackModel> listFeedback =
            body.map((dynamic item) => FeedbackModel.fromJson(item)).toList();
        return listFeedback;
      } else if (response.statusCode == 404) {
        List<FeedbackModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListCoffeePagination(int page, int limit) async {
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/cafe?pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<CoffeeModel> listCoffee =
            body.map((dynamic item) => CoffeeModel.fromJson(item)).toList();
        return listCoffee;
      } else if (response.statusCode == 404) {
        List<CoffeeModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListCoffeeByKeySearch(String key) async {
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/cafe/name?name=${key}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<CoffeeModel> listCoffee =
            body.map((dynamic item) => CoffeeModel.fromJson(item)).toList();
        return listCoffee;
      } else if (response.statusCode == 404) {
        List<CoffeeModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListCoffeeByDistric(String distric) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/cafe/Distric?distric=${distric.split(" ")[1]}&pageIndex=1&pageSize=5'),
      );
      print(distric);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<CoffeeModel> listCoffee =
            body.map((dynamic item) => CoffeeModel.fromJson(item)).toList();
        return listCoffee;
      } else if (response.statusCode == 404 || response.statusCode == 400) {
        List<CoffeeModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getDetailLocationById(String locationId) async {
    var coffeeModel = Completer<CoffeeModel>();
    var body;
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/cafe/${locationId}'),
      );
      body = convert.jsonDecode(response.body);
      coffeeModel.complete(CoffeeModel.fromJson(body['data']));
    } catch (_) {
      coffeeModel.complete(CoffeeModel.fromJson(body));
    } on SocketException {
      print("Fail to connect API!");
    }
    return coffeeModel.future;
  }

  static Future<dynamic> getListMeetingRecommendByUserId(
      String userId, int page, int limit) async {
    print(userId);
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/sessions/home?memberId=${userId}&pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<SessionModel> listMeeting =
            body.map((dynamic item) => SessionModel.fromJson(item)).toList();
        return listMeeting;
      } else if (response.statusCode == 404) {
        List<SessionModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListAllMyMeetup(
      String userId, int page, int limit) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    print(userId);

    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/sessions/my-sessions?memberId=${userId}&pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<SessionModel> listMeeting =
            body.map((dynamic item) => SessionModel.fromJson(item)).toList();

        return listMeeting;
      } else if (response.statusCode == 404) {
        List<SessionModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getLisMyMeetupByMajor(
      String userId, String majorId, int page, int limit) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    print(userId);

    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/sessions/byMajor?memberId=${userId}&majorId=${majorId}&pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<SessionModel> listMeeting =
            body.map((dynamic item) => SessionModel.fromJson(item)).toList();

        return listMeeting;
      } else if (response.statusCode == 404) {
        List<SessionModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListAllMyMeetupByStatus(
      String userId, int status, int page, int limit) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    print(userId);

    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/sessions/my-sessions-by-status?memberId=${userId}&status=${status}&pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<SessionModel> listMeeting =
            body.map((dynamic item) => SessionModel.fromJson(item)).toList();
        print(listMeeting.length);
        return listMeeting;
      } else if (response.statusCode == 404) {
        List<SessionModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getMeetingDetailByMeetingId(
      String userId, String meetingId) async {
    var meetingModel = Completer<SessionModel>();
    var body;
    try {
      var response = await http.get(Uri.parse(
          '${baseURL}/sessions/detail?memberId=${userId}&sessionId=${meetingId}'));
      body = convert.jsonDecode(response.body);
      meetingModel.complete(SessionModel.fromJson(body['data']));
    } catch (_) {
      meetingModel.complete(SessionModel.fromJson(body));
    } on SocketException {
      print("Fail to connect API!");
    }
    return meetingModel.future;
  }

  static Future<dynamic> getListAllMeetingPaginationByUserId(
      String userId, int page, int limit) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/sessions?memberId=${userId}&pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<SessionModel> listMeeting =
            body.map((dynamic item) => SessionModel.fromJson(item)).toList();
        return listMeeting;
      } else if (response.statusCode == 404) {
        List<SessionModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListVoucherHome() async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/voucher/voucher_home'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<String> list = body.cast<String>();
        return list;
      } else if (response.statusCode == 404) {
        List<String> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getScheduleMentorByDate(
      String date, String mentorId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/mentors/${mentorId}/schedule?date=${date}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<int> list = body.cast<int>();
        return list;
      } else if (response.statusCode == 404) {
        List<int> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getProfileByUsername(String username) async {
    var user = Completer<UserModel>();

    var body;
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/members/profile/${username}'),
      );
      body = convert.jsonDecode(response.body);
      user.complete(UserModel.fromJson(body['data']));
    } catch (_) {
      user.complete(UserModel.fromJson(body));
    } on SocketException {
      print("Fail to connect API!");
    }
    return user.future;
  }

  static Future<dynamic> getListHistory(String id, int page, int limit) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/histories/${id}?pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<HistoryModel> list =
            body.map((dynamic item) => HistoryModel.fromJson(item)).toList();
        return list;
      } else if (response.statusCode == 404) {
        List<HistoryModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListMemberRequest(String meetingId) async {
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/sessions/${meetingId}/awaiting-members'),
      );
      if (response.statusCode == 200) {
        List<dynamic> list = convert.jsonDecode(response.body);
        return list;
      } else if (response.statusCode == 404) {
        List<HistoryModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> getListNotification(
      String userId, int page, int limit) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${baseURL}/Notification/${userId}?pageIndex=${page}&pageSize=${limit}'),
      );
      if (response.statusCode == 200) {
        List<dynamic> body = convert.jsonDecode(response.body);
        List<NoficationModel> list =
            body.map((dynamic item) => NoficationModel.fromJson(item)).toList();
        return list;
      } else if (response.statusCode == 404) {
        List<NoficationModel> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  //API POST
  //-------------------------------------------------------------------------
  static Future<dynamic> putUpdateProfileByUserId(UserModel user) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.put(
          Uri.parse(
            '${baseURL}/members/profile/${user.id}',
          ),
          headers: headers,
          body: convert.jsonEncode({
            'fullname': user.fullname.toString(),
            'image': user.image.toString(),
            'address': user.address.toString(),
            'phone': user.phone.toString(),
            'sex': user.sex.toString(),
            'birthday': user.birthday.toString(),
            'grade': 0.toString(),
            'majorName': user.majorName.toString()
          }));

      if (response.statusCode == 200) {
        String body = response.body;

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> postCreateMeetup(
      BookingModel booking,
      List<String> listMentorInviteString,
      String uid,
      String image,
      String fullname) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
          Uri.parse(
            '${baseURL}/sessions',
          ),
          headers: headers,
          body: convert.jsonEncode({
            "listMentor": listMentorInviteString,
            "cafeId": booking.coffee.id.toString(),
            "memberId": uid.toString(),
            "memberName": fullname.toString(),
            "memberImage": image.toString(),
            "date": booking.date.toString(),
            "slot": booking.slot,
            "majorId": booking.major.majorId.toString(),
            "skillId": booking.subject.subjectId.toString(),
            "maxPerson": 5,
            "payments": {"amount": 200, "type": "string"}
          }));

      if (response.statusCode == 200) {
        String body = response.body;

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> postRequestJoinMeetup(
      String meetupId, String memberId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
        Uri.parse(
          '${baseURL}/session-management/${meetupId}/members/${memberId}/join',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = "Successfull";

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> postLeaveMeetup(
      String meetupId, String memberId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
        Uri.parse(
          '${baseURL}/session-management/${meetupId}/members/${memberId}/leave',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = "Successfull";

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> putCancelMeetup(
      String meetupId, String memberId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.put(
        Uri.parse(
          '${baseURL}/session-management/${meetupId}/user/${memberId}/Cancel',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = "Successfull";

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> putAcceptRequestMeetup(
      String meetupId, String memberId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.put(
        Uri.parse(
          '${baseURL}/session-management/${meetupId}/members/${memberId}/accept',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = "Successfull";

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> deleteRejectRequestMeetup(
      String meetupId, String memberId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.delete(
        Uri.parse(
          '${baseURL}/session-management/${meetupId}/members/${memberId}/reject',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = "Successfull";

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> postLoginToInsertFCM(
      String userId, String fcnToken) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
        Uri.parse(
          '${baseURL}/login?userId=${userId}&token=${fcnToken}',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = response.body;

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> postLogoutToInsertFCM(
      String userId, String fcnToken) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
        Uri.parse(
          '${baseURL}/logout?userId=${userId}&token=${fcnToken}',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 204) {
        String body = response.body;

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> postRegiter(
      String userId, String name, String email, String majorId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
          Uri.parse(
            '${baseURL}/newAccounts',
          ),
          headers: headers,
          body: convert.jsonEncode({
            "id": userId.toString(),
            "name": name.toString(),
            "email": email.toString(),
            "majorId": majorId.toString()
          }));

      if (response.statusCode == 200) {
        String body = response.body;

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> postFeedback(
      String userId,
      int voteMentor,
      int voteLocaiton,
      String feedbackMentor,
      String feedbackLocation,
      String sessionId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.post(
          Uri.parse(
            '${baseURL}/members/new_feedback/${userId}',
          ),
          headers: headers,
          body: convert.jsonEncode({
            "mentorVoting": voteMentor,
            "cafeVoting": voteLocaiton,
            "feedbackOfMentor": feedbackMentor.toString(),
            "feedbackOfCafe": feedbackLocation.toString(),
            "sessionId": sessionId.toString()
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        String body = response.body;

        return body;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }
}
