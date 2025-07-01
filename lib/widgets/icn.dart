import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MascotIcon extends StatefulWidget {
  const MascotIcon({super.key});

  @override
  State<MascotIcon> createState() => _MascotIconState();
}

class _MascotIconState extends State<MascotIcon> {
  late RiveAnimation animation;
  late StateMachineController controller;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.asset(
      'assets/animations/rive_assets.riv',
      artboard: 'mascoticn',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller = StateMachineController.fromArtboard(artboard, 'mascoticn')!;
    artboard.addController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 50, height: 50, child: animation);
  }
}
