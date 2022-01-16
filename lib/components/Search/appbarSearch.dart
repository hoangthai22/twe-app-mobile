import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBar createState() => _CustomAppBar();

  final String text;

  // late final ValueChanged<String> onChanged;
  final callback;

  CustomAppBar({required this.callback, required this.text});

}

class _CustomAppBar extends State<CustomAppBar> {
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
          // mainAxisAlignment: MainAxisAlignment.center,
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
                )
                ),
            Expanded(
              flex: 9,
              child: TextField(
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                    hintText: 'Tìm một gia sư',
                    contentPadding: const EdgeInsets.only(left: 10, top: 10),
                    suffixIcon: hidingIcon()),
              ),
            ),
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
