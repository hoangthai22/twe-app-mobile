import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:twe/models/mentor.dart';
import 'package:http/http.dart' as http;

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
}
