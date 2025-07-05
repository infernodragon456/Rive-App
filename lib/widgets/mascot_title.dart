import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_app/helpers/rive_helper.dart';

class MascotTitle extends StatefulWidget {
  final String name;
  const MascotTitle({super.key, required this.name});

  @override
  State<MascotTitle> createState() => _MascotTitleState();
}

class _MascotTitleState extends State<MascotTitle> {
  late RiveAnimation animation;
  late StateMachineController controller;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.direct(
      RiveHelper.mainFile!,
      artboard: 'title',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(controller);
    TextValueRun mascotText = artboard.component<TextValueRun>('mascotName')!;
    mascotText.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 40, height: 40, child: animation);
  }
}
