import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBar createState() => _CustomAppBar();

  late final String text;

  // late final ValueChanged<String> onChanged;
  late final callback;

  CustomAppBar({required this.callback, required this.text});

  @override
  Size get preferredSize => const Size.fromHeight(80);
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
    return Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        color: Colors.white,
        alignment: Alignment.center,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 26,
                    color: Colors.black,
                  ),
                  onPressed: cachbackFunc,
                )),
            Expanded(
              flex: 9,
              child: TextField(
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
        ));
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
