import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarSearchMentor extends StatefulWidget {
  @override
  _AppBarSearchMentor createState() => _AppBarSearchMentor();

  final String text;

  // late final ValueChanged<String> onChanged;
  final callback;

  AppBarSearchMentor({required this.callback, required this.text});
}

class _AppBarSearchMentor extends State<AppBarSearchMentor> {
  var inputText = "";
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
        Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 24,
                color: Colors.black,
              ),
              onPressed: cachbackFunc,
            )),
        Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: TextField(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto",
                  height: 1.5,
                ),
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
                autofocus: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tìm một Mentor',
                    suffixIcon: hidingIcon()),
              ),
            )),
      ],
      // )
    );
  }

  Widget hidingIcon() {
    if (inputText.isNotEmpty) {
      return IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          splashColor: Colors.black12,
          onPressed: () {
            setState(() {
              _controller.clear();
              inputText = "";
            });
          });
    } else {
      return const Text("");
    }
  }
}
