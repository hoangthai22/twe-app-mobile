import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:twe/models/coffee.dart';
import 'package:twe/models/feedback.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/mentor.dart';
import 'package:http/http.dart' as http;
import 'package:twe/models/session.dart';
import 'package:twe/models/subject.dart';

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
}
