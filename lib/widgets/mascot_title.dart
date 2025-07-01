import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MascotTitle extends StatefulWidget {
  const MascotTitle({super.key});

  @override
  State<MascotTitle> createState() => _MascotTitleState();
}

class _MascotTitleState extends State<MascotTitle> {
  late RiveAnimation animation;
  late StateMachineController controller;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.asset(
      'assets/animations/rive_assets.riv',
      artboard: 'title',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 300, height: 300, child: animation);
  }
}
