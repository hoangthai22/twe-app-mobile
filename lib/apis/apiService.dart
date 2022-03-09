import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:twe/models/location.dart';
import 'package:twe/models/feedback.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/models/mentor.dart';
import 'package:http/http.dart' as http;
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

  static Future<dynamic> getSubjectBymajorId(String id) async {
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/subjects/MajorId?majorId=${id}'),
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

  // static Future<dynamic> getLocationDetailById(String locationId,int page, int limit) async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse('${baseURL}/cafe?pageIndex=${page}&pageSize=${limit}'),
  //     );
  //     if (response.statusCode == 200) {
  //       List<dynamic> body = convert.jsonDecode(response.body);
  //       List<CoffeeModel> listCoffee =
  //           body.map((dynamic item) => CoffeeModel.fromJson(item)).toList();
  //       return listCoffee;
  //     } else if (response.statusCode == 404) {
  //       List<CoffeeModel> list = [];
  //       return list;
  //     }
  //   } catch (e) {
  //     print('Error with status code: ${e}');
  //   }
  // }

  static Future<dynamic> getListMeetingRecommendByUserId(
      String userId, int page, int limit) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
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

  //API POST
  //-------------------------------------------------------------------------
  static Future<dynamic> putUpdateProfileByUserId(UserModel user) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      String json =
          '{"fullname": "${user.fullname}", "image": "${user.image}", "address": "${user.address}","phone": "${user.phone}","sex"": "${user.sex}", "birthday": "${user.birthday}", "grade": "", "majorName": "${user.majorName}"}';
      var response = await http.put(
          Uri.parse(
            '${baseURL}/api/v1/members/profile/${user.id}',
          ),
          headers: headers,
          body: json);
      print("json: $json");
      print(response.body);
      if (response.statusCode == 200) {
        String body = response.body;

        return body;
      } else if (response.statusCode == 404) {
        List<String> list = [];
        return list;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }
}
