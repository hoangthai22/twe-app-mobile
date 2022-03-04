import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/major.dart';
import 'package:twe/pages/MentorTab/list_mentor_tab.dart';

class ModalFilter extends StatefulWidget {
  late final ValueChanged<MajorModel> onSeletedMajor;
  ModalFilter({required this.onSeletedMajor});
  @override
  State<StatefulWidget> createState() => _ModalFilter();
}

class _ModalFilter extends State<ModalFilter> {
  String majorSelected = "";
  late MajorModel major;
  List<MajorModel> majors = [];
  callbackFnc() {
    if (majorSelected != "") {
      widget.onSeletedMajor(major);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiServices.getMajors().then((value) => {
          setState(() {
            majors = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 15, right: 0, top: 15, bottom: 15),
          child: ListView(
            children: <Widget>[
              Center(
                child: Text("Bộ lọc tìm kiếm",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 15),
                child: Text("Chuyên ngành",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    )),
              ),
              Container(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    if (majors.length > 0)
                      ...majors
                          .map(
                            (majorItem) => MyRadioListTile<int>(
                              value: majorItem.majorId,
                              groupValue: majorSelected,
                              leading: majorItem.majorName,
                              onChanged: (value) => setState(() =>
                                  {majorSelected = value!, major = majorItem}),
                            ),
                          )
                          .toList()
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              padding: EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5 - 20,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        textStyle: TextStyle(color: MaterialColors.primary),
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                                color: MaterialColors.primary, width: 1)),
                      ),
                      onPressed: () {
                        setState(() {
                          majorSelected = "";
                        });
                      },
                      child: Text(
                        "Thiết đặt lại",
                        style: TextStyle(
                            fontSize: 14,
                            color: MaterialColors.primary,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.5 - 20,
                    margin: EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MaterialColors.primary,
                        textStyle: TextStyle(color: Colors.white),
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.white, width: 1)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        callbackFnc();
                      },
                      child: Text(
                        "Áp dụng",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final String value;
  final String groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<String?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
          height: 45,
          width: 180,
          margin: EdgeInsets.only(right: 15, bottom: 10),
          child: _customRadioButton),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? MaterialColors.primary : null,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? MaterialColors.primary : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            leading,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ));
  }
}
