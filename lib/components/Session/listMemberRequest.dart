import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Session/memberItem.dart';
import 'package:twe/components/Session/memberRequestItem.dart';
import 'package:twe/models/mentor.dart';

class ListMemberRequest extends StatefulWidget {
  String meetingId;
  ListMemberRequest({required this.meetingId});
  @override
  State<StatefulWidget> createState() => _ListMemberRequest();
}

class _ListMemberRequest extends State<ListMemberRequest> {
  List listMemberRequest = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getListMemberRequest(widget.meetingId);
  }

  getListMemberRequest(String id) {
    ApiServices.getListMemberRequest(id).then((value) => {
          if (value != null)
            {
              setState(() {
                listMemberRequest = value;
                isLoading = false;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView(children: [
            Column(children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Title(
                    color: Colors.black,
                    child: Text(
                      "Yêu cầu tham gia",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    children: listMemberRequest.map((dynamic item) {
                  var index = listMemberRequest.indexOf(item);
                  return MemberRequestItem(
                      meetingId: widget.meetingId,
                      id: item["id"],
                      majorName: item["majorName"],
                      memberName: item["name"],
                      image: item["image"],
                      function: (v) {
                        getListMemberRequest(widget.meetingId);
                      },
                      isBorderBottom:
                          index == listMemberRequest.length - 1 ? false : true);
                }).toList()),
              )
            ])
          ]);
  }
}
