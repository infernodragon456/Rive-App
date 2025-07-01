import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Mascot extends StatefulWidget {
  const Mascot({super.key});

  @override
  State<Mascot> createState() => _MascotState();
}

class _MascotState extends State<Mascot> {
  late RiveAnimation animation;
  late StateMachineController controller;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.asset(
      'assets/animations/rive_assets.riv',
      artboard: 'fullbody',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller = StateMachineController.fromArtboard(artboard, 'fullbody')!;
    artboard.addController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return animation;
  }
}
