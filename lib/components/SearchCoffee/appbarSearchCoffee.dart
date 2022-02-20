import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/provider/appProvider.dart';

class AppBarSearchCoffee extends StatefulWidget {
  @override
  _AppBarSearchCoffee createState() => _AppBarSearchCoffee();

  final String text;
  final String title;
  final String hintText;
  final String step;
  final bool isTabPage;

  // late final ValueChanged<String> onChanged;
  final callback;
  final showListMentorInvite;

  AppBarSearchCoffee(
      {required this.callback,
      required this.text,
      required this.isTabPage,
      required this.step,
      required this.title,
      required this.showListMentorInvite,
      required this.hintText});
}

class _AppBarSearchCoffee extends State<AppBarSearchCoffee> {
  var inputText = "";
  var isSearch = false;
  final _controller = TextEditingController();
  final _counter = 1;

  void cachbackFunc() {
    widget.callback(inputText);
    primaryFocus!.unfocus(disposition: disposition);
  }

  void funcShowListMentorInvite() {
    widget.showListMentorInvite();
  }

  UnfocusDisposition disposition = UnfocusDisposition.scope;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: widget.isTabPage == true ? 0 : 2,
              child: isSearch
                  ? IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        cachbackFunc();
                      })
                  : (widget.isTabPage == true
                      ? Text("")
                      : IconButton(
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            size: 28,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }))),
          Expanded(
              flex: 14,
              child: isSearch
                  ? Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.white,
                            height: 1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                        controller: _controller,
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.words,
                        cursorColor: Colors.white,
                        onSubmitted: (value) {
                          cachbackFunc();
                        },
                        onChanged: (text) {
                          setState(() {
                            inputText = text;
                          });
                        },
                        autofocus: isSearch,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.hintText,
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    )
                  : (widget.isTabPage == true
                      ? Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5, left: 21),
                              child: Text(
                                widget.step,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: "Roboto",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                widget.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Roboto",
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ))),
          Expanded(
              flex: 2,
              child: isSearch
                  ? Container()
                  : (widget.isTabPage == true
                      ? Container()
                      : InkWell(
                          onTap: () => funcShowListMentorInvite(),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.person_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 5),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffc32c37),
                                      border: Border.all(
                                          color: MaterialColors.primary,
                                          width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Center(child: Consumer<AppProvider>(
                                        builder: (context, provider, child) {
                                      return Text(
                                        provider.getListMentorInvite.length
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      );
                                    })),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))),
          Expanded(
              flex: 2,
              child: isSearch
                  ? IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isSearch = false;
                        });
                      })
                  : IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isSearch = true;
                        });
                      })),
        ],
        // )
      ),
    );
  }

  // Widget hidingIcon() {
  //   if (inputText.isNotEmpty) {
  //     return IconButton(
  //         icon: const Icon(
  //           Icons.clear,
  //           color: Colors.black,
  //         ),
  //         splashColor: Colors.black12,
  //         onPressed: () {
  //           setState(() {
  //             _controller.clear();
  //             inputText = "";
  //           });
  //         });
  //   } else {
  //     return const Text("");
  //   }
  // }
}
