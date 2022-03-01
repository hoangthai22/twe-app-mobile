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
            ),
    */
    return Scaffold(
        appBar: AppBar(
            elevation: 0.8,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            primary: false,
            excludeHeaderSemantics: true,
            flexibleSpace: SafeArea(
                child: Container(
              padding: EdgeInsets.only(left: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 0),
                            width: 60,
                            child: Image.asset(
                              'assets/logo_transparent.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Toad Study",
                            style: TextStyle(
                                color: Color.fromARGB(255, 14, 105, 17),
                                fontFamily: "Roboto",
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 140),
                            width: 28,
                            child: Image.asset(
                              'assets/chuongvip.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ))),
        body: Container(
          padding: EdgeInsets.only(top: 15, right: 15, left: 15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      Text(
                        "Tuần nay có gì!",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Stack(
                        children: [

                          Row(
                            children: [
                              Container(
                                child: Image.asset('assets/home1.png'),
                                ),
                              ],
                          ),

                      ),
                      ],
                      ),
                      ),
            ],
          ),
        )
        );
  }
}
