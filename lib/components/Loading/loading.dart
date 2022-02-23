import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:provider/provider.dart';

const riveFile = 'assets/loading.riv';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Artboard? _artboard;

  late RiveAnimationController _animationController;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      _onSucess();
    });
  }

  void _loadRiveFile() async {
    _animationController = _animationController = SimpleAnimation('light');
  }

  _onSucess() {
    if (_artboard != null) {
      _artboard!.artboard.removeController(_animationController);
      _artboard!.addController(SimpleAnimation('light_tick'));
      print("success");
    }
  }

  void _onInit(Artboard artboard) {
    _artboard = artboard;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Container(
          height: 150,
          child: RiveAnimation.asset(
            riveFile,
            onInit: _onInit,
            controllers: [_animationController],
          ),
        )),
      ),
    );
  }
}
