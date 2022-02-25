import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:twe/components/Loading/loading.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const riveFile = 'assets/loading.riv';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool _isLoading = true;
  int test = 0;
  late Future<List<MentorModel>> futureMentor;

  List<MentorModel> parseProducts(String responseBody) {
    final parsed =
        convert.json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<MentorModel>((json) => MentorModel.fromJson(json))
        .toList();
  }

  Future<List<MentorModel>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://theweekendexpertisewebapi.azurewebsites.net/api/v1/mentors?pageIndex=1&pageSize=3'));
    if (response.statusCode == 200) {
      // print("data: ${MentorModel.fromJson(convert.jsonDecode(response.body))}");
      return parseProducts(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // loadData();
    // futureMentor = fetchData();
    // futureMentor.then((vallue) => {print(vallue.toList()[0])});

    super.initState();

    //dang code
  }

  @override
  Widget build(BuildContext context) {
    print("Home");
    return Scaffold(
        // backgroundColor: Colors.blue,
        body: _isLoading
            ? Loading()
            : Center(
                child: Text("List session"),
              ));
  }
}
