import 'package:flutter/material.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/models/subject.dart';

class FilterModal extends StatefulWidget {
  // final List<String> filterSub;
  final List<SubjectModel> subList;
  final ValueChanged<int> onGetSub;
  int checkedInit;

  FilterModal(
      {Key? key,
      required this.onGetSub,
      required this.subList,
      required this.checkedInit})
      : super(key: key);

  @override
  _FilterModal createState() => _FilterModal();
}

class _FilterModal extends State<FilterModal> {
  // bool checkedValue = true;
  // List<String> listCurrentSubs = [];
  // int subChecked = 0;
  @override
  void initState() {
    super.initState();
  }

  void cachbackFunc() {
    widget.onGetSub(widget.checkedInit);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          cachbackFunc();
                          Navigator.pop(context);
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.3333,
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Áp dụng",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            "Bộ lọc",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.checkedInit = 0;
                            cachbackFunc();
                          });
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.3333,
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.topRight,
                          child: const Text(
                            "Xóa",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                // alignment: Alignment.topLeft,
                // padding: EdgeInsets.only(left: 20, right: 20),
                // height: 700,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black12, width: 1.0))),
                        child: const Text("Chuyên Ngành",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            flex: 9,
                            child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: widget.subList
                                    .map((item) => Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black12,
                                                      width: 1.0))),
                                          child: ListTile(
                                            title: Text("${item.subjectName}", style: TextStyle(fontSize: 13),),
                                            onTap: () {
                                              setState(() {
                                                if (item.subjectId ==
                                                    widget.checkedInit) {
                                                  widget.checkedInit = 0;
                                                } else {
                                                  widget.checkedInit =
                                                      item.subjectId;
                                                }
                                                // cachbackFunc();
                                              });
                                            },
                                            leading: Radio(
                                              value: widget.checkedInit,
                                              groupValue: item.subjectId,
                                              onChanged: (value) {
                                                setState(() {
                                                  if (item.subjectId ==
                                                      widget.checkedInit) {
                                                    widget.checkedInit = 0;
                                                  } else {
                                                    widget.checkedInit =
                                                        item.subjectId;
                                                  }
                                                  // cachbackFunc();
                                                });
                                              },
                                            ),
                                          ),
                                        ))
                                    .toList())),
                      ],
                    )
                  ],
                ),
              )
            ]));
  }
}
