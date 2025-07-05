import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_app/models/enums.dart';
import 'package:rive_app/helpers/rive_helper.dart';

class Mascot extends StatefulWidget {
  final MascotHatOptions? hat;
  final MascotActions? action;

  Mascot({super.key, this.hat, this.action});

  @override
  State<Mascot> createState() => _MascotState();
}

class _MascotState extends State<Mascot> {
  late RiveAnimation animation;
  late StateMachineController controller;
  bool _isLoading = true;
  Map<MascotHatOptions, double> hatMap = {};
  Map<MascotActions, SMITrigger> actionMap = {};
  SMINumber? hatNumber;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.direct(
      RiveHelper.mainFile!,
      artboard: 'fullbody',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller = StateMachineController.fromArtboard(artboard, 'fullbody')!;
    artboard.addController(controller);

    final mascotActions =
        MascotActions.values
            .where((e) => e != MascotActions.none && e != MascotActions.name)
            .toList();
    for (var action in mascotActions) {
      actionMap[action] = controller.findSMI<SMITrigger>(action.name)!;
    }

    final mascotHats = MascotHatOptions.values.toList();
    double index = 0;
    for (var hat in mascotHats) {
      hatMap[hat] = index;
      index++;
    }
    hatNumber = controller.findSMI<SMINumber>('hatstate')!;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      if (widget.action != null && widget.action != MascotActions.none) {
        actionMap[widget.action]?.fire();
      }

      if (widget.hat != null) {
        hatNumber?.value = hatMap[widget.hat]!;
      }
    }

    return animation;
  }
}
