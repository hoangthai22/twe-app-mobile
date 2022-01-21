import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarSearchCoffee extends StatefulWidget {
  @override
  _AppBarSearchCoffee createState() => _AppBarSearchCoffee();

  final String text;

  // late final ValueChanged<String> onChanged;
  final callback;

  AppBarSearchCoffee({required this.callback, required this.text});
}

class _AppBarSearchCoffee extends State<AppBarSearchCoffee> {
  var inputText = "";
  var isSearch = false;
  final _controller = TextEditingController();

  void cachbackFunc() {
    widget.callback(inputText);
    primaryFocus!.unfocus(disposition: disposition);
  }

  UnfocusDisposition disposition = UnfocusDisposition.scope;

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //     // padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        //     color: Colors.white,
        //     // alignment: Alignment.centerLeft,
        //     // height: 80,
        //     child:
        Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: isSearch
                  ? IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        cachbackFunc();
                      })
                  : IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 24,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })),
          Expanded(
              flex: 8,
              child: isSearch
                  ? Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField( 
                        style: const TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                        controller: _controller,
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.words,
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
                          hintText: 'Tìm một quán coffee',
                        ),
                      ),
                    )
                  : Text(
                      "Chọn địa điểm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    )),
          Expanded(
              flex: 1,
              child: isSearch
                  ? IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isSearch = false;
                        });
                      })
                  : IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.black,
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
