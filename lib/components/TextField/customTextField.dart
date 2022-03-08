import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Icon icon;
  final String hintText;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText.toString(),
          filled: true,
          fillColor: MaterialColors.primary.withOpacity(0.4),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: widget.icon,
          // isDense: true,
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  color: MaterialColors.primary,
                  onPressed: () => widget.controller.clear(),
                ),
        ),
        // keyboardType: TextInputType.emailAddress,
        // autofillHints: [AutofillHints.email],
        validator: (email) {
          print(email);
          return email!.length > 1 ? null :'Enter a valid email' ;
        },
      );
}
