import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_app/models/enums.dart';
import 'package:rive_app/helpers/rive_helper.dart';

class MascotHat extends StatefulWidget {
  final MascotHatOptions hat;
  final Function(MascotHatOptions) onHatSelected;
  const MascotHat({super.key, required this.hat, required this.onHatSelected});

  @override
  State<MascotHat> createState() => _MascotHatState();
}

class _MascotHatState extends State<MascotHat> {
  late RiveAnimation animation;
  late StateMachineController controller;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.direct(
      RiveHelper.mainFile!,
      artboard: '${widget.hat.name}hat',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller =
        StateMachineController.fromArtboard(artboard, '${widget.hat.name}hat')!;
    artboard.addController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onHatSelected(widget.hat),
      child: SizedBox.square(dimension: 80, child: animation),
    );
  }
}
