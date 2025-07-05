import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MascotHeader extends StatefulWidget {
  const MascotHeader({super.key});

  @override
  State<MascotHeader> createState() => _MascotHeaderState();
}

class _MascotHeaderState extends State<MascotHeader> {
  late RiveAnimation animation;
  late StateMachineController controller;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.asset(
      'assets/animations/rive_assets.riv',
      artboard: 'peek',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller = StateMachineController.fromArtboard(artboard, 'peek')!;
    artboard.addController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 250, height: 250, child: animation);
  }
}
