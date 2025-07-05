import 'package:flutter/material.dart';
import 'package:rive_app/models/enums.dart';
import 'package:rive_app/widgets/btn.dart';
import 'package:rive_app/widgets/mascot_header.dart';

class NameForm extends StatefulWidget {
  final Function(String) onNameSubmitted;
  const NameForm({super.key, required this.onNameSubmitted});

  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, left: 32, right: 32, bottom: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Text(
                'Enter the name of your mascot!',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.blueAccent),
              ),
              TextFormField(
                controller: nameController,
                maxLength: 10,
                maxLines: 1,
                minLines: 1,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.black),
              ),
              MascotBtn(
                action: MascotActions.name,
                onActionSelected: (event) {
                  widget.onNameSubmitted(nameController.text);
                },
              ),
            ],
          ),
        ),
        Positioned(top: -180, left: 0, right: 0, child: MascotHeader()),
      ],
    );
  }
}
