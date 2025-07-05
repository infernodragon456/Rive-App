import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_app/models/enums.dart';

class MascotBtn extends StatefulWidget {
  final String? label;
  final MascotActions action;
  final Function(MascotActions) onActionSelected;
  const MascotBtn({
    super.key,
    required this.action,
    required this.onActionSelected,
    this.label,
  });

  @override
  State<MascotBtn> createState() => _MascotBtnState();
}

class _MascotBtnState extends State<MascotBtn> {
  late RiveAnimation animation;
  late StateMachineController controller;

  @override
  void initState() {
    super.initState();
    animation = RiveAnimation.asset(
      'assets/animations/rive_assets.riv',
      artboard: '${widget.action.name}btn',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    controller =
        StateMachineController.fromArtboard(
          artboard,
          '${widget.action.name}btn',
        )!;
    artboard.addController(controller);

    TextValueRun label = artboard.component<TextValueRun>('label')!;
    label.text = widget.label ?? widget.action.name.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) => widget.onActionSelected(widget.action),
      child: SizedBox(width: 380, height: 120, child: animation),
    );
  }
}
