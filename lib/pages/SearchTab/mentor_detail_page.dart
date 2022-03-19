import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/components/Feedback/feedback.dart';
import 'package:twe/components/SearchMentor/customMentorTab.dart';
import 'package:twe/components/SearchMentor/scheduleModal.dart';
import 'package:twe/models/feedback.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:getwidget/getwidget.dart';

class _MentorDetailPage extends State<MentorDetailPage> {
  late MentorModel mentor;
  bool isLoading = true;
  late String skill;
  String slot = "";
  int slotNumber = 0;
  String date = "";
  List<int> listRate = [];
  List<int> listRateEmpty = [];
  List<FeedbackModel> listFeedback = [];

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    super.initState();
    skill = "";
    // mentor = MENTOR_DATA[2];
    ApiServices.getMentorDetailByID(widget.mentorId).then((value) => {
          setState(() {
            mentor = value;
            isLoading = false;
            listRate = [for (var i = 1; i <= mentor.rate!; i++) i];
            listRateEmpty = [for (var i = 1; i <= 5 - mentor.rate!; i++) i];
          })
        });
    print(widget.mentorId);
    ApiServices.getListFeebackByMentorId(widget.mentorId, 1, 3)
        .then((value) => {
              print(value),
              setState(() {
                listFeedback = value;
              })
            });
  }

  void onSubmit(context) {
    Navigator.pop(context);
    // return _ModalBottom(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (isLoading) ...[
            Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: MaterialColors.primary,
                    )))
          ],
          if (!isLoading) ...[
            Container(
                color: Colors.white,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 0, bottom: 30),
                  children: [
                    ClipRRect(
                        child: Image(
                      // color:70olors.red,
                      height: 130,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/twe-mobile.appspot.com/o/images%2F275131878_1363339264094920_2110274767432423810_n.jpg?alt=media&token=615fadd0-f8e9-4a64-b5e8-4f96f4f60247"),
                    )),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 45, bottom: 10),
                        child: Text(
                          mentor.fullname!,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                          ),
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 20,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  child: Row(children: [
                                    if (listRate.length > 0)
                                      ...listRate.map((e) {
                                        return Icon(
                                          Icons.star,
                                          size: 22,
                                          color: Colors.amber,
                                        );
                                      }).toList(),
                                    if (listRateEmpty.length > 0)
                                      ...listRateEmpty.map((e) {
                                        return Icon(
                                          Icons.star_border,
                                          size: 22,
                                          color: Colors.amber,
                                        );
                                      }).toList(),
                                    Container(
                                      child: Text(
                                        " (${mentor.rate! + .0})",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]),
                                )),
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5, left: 20),
                          child: const Icon(
                            Icons.price_change_outlined,
                            color: MaterialColors.primary,
                            size: 22.0,
                          ),
                        ),
                        Container(
                            child: Text(
                          "${mentor.price!}/buổi",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        )),
                      ],
                    ),
                    Container(
                      height: widget.isMentorTab ? MediaQuery.of(context).size.height - 230 : MediaQuery.of(context).size.height - 280,
                      width: MediaQuery.of(context).size.width,
                      child: CustomTabMentor(
                        isTab: widget.isMentorTab,
                        mentor: mentor,
                      ),
                    ),
                  ],
                )),
            widget.isMentorTab
                ? Text("")
                // Positioned(
                //     bottom: 0,
                //     child: Consumer<AppProvider>(
                //         builder: (context, provider, child) {
                //       return Container(
                //         height: 50,
                //         color: Colors.white,
                //         width: MediaQuery.of(context).size.width,
                //         padding: EdgeInsets.only(
                //             left: 10, right: 10, top: 5, bottom: 5),
                //         child: ElevatedButton(
                //           child: Text(
                //             ("Lên lịch meetup"),
                //             style: TextStyle(
                //                 fontSize: 16,
                //                 fontFamily: 'Roboto',
                //                 fontWeight: FontWeight.w500),
                //           ),
                //           style: ElevatedButton.styleFrom(
                //             primary: MaterialColors.primary,
                //             textStyle: TextStyle(color: Colors.white),
                //             shadowColor: Colors.white,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(12),
                //             ),
                //           ),
                //           onPressed: () {},
                //         ),
                //       );
                //     }),
                //   )
                : Positioned(
                    bottom: 0,
                    child: Consumer<AppProvider>(
                        builder: (context, provider, child) {
                      var checkInvited = provider.checkIsInviteMentor(mentor);

                      return Container(
                        height: 50,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        child: ElevatedButton(
                          child: Text(
                            checkInvited ? ("Bỏ mời") : ("Mời tham gia"),
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: checkInvited
                                ? MaterialColors.primary.withOpacity(0.5)
                                : MaterialColors.primary,
                            textStyle: TextStyle(color: Colors.white),
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            checkInvited
                                ? provider.removeMentor(mentor)
                                : provider.setListMentorInvite(mentor);
                          },
                        ),
                      );
                    }),
                  )
          ],
          if (!isLoading) ...[
            Positioned(
              top: 60,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 54.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(mentor.image!),
                  radius: 50.0,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white38,
                ),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              top: 30,
              left: 15,
            ),
          ]
        ],
      ),
    );
  }
}

class MentorDetailPage extends StatefulWidget {
  final String mentorId;
  final bool isMentorTab;

  const MentorDetailPage({required this.mentorId, required this.isMentorTab});

  @override
  _MentorDetailPage createState() => _MentorDetailPage();
}
