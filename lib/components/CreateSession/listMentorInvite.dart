import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/models/subject.dart';
import 'package:twe/provider/appProvider.dart';

class ListMentorInvite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Center(
                // decoration: BoxDecoration(),

                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "Danh sách giáo viên",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              Consumer<AppProvider>(builder: (context, provider, child) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: provider.getListMentorInvite
                      .map((mentor) => Container(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 10, top: 15),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18)),
                                        // padding: const EdgeInsets.only(right: 15, left: 0),
                                        child: Image(
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,
                                          image: NetworkImage(mentor.avatar),
                                        ))),
                                Expanded(
                                  child: Container(
                                    height: 55,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              mentor.mentorName,
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                left: 8,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.subject_outlined,
                                                    color:
                                                        MaterialColors.primary,
                                                    size: 24,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child: Text(
                                                      "Kỹ Thuật Phần Mềm  ",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontFamily: "Roboto",
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  flex: 5,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: MaterialColors.primary,
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        shadowColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                      child: Text(
                                        "Hủy",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Roboto"),
                                      ),
                                      onPressed: () {
                                        provider.romoveMentor(mentor);
                                      },
                                    ))
                              ],
                            ),
                          ))
                      .toList(),
                );
              })
            ]));
  }
}
