import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Wraps TextFormField with Shortcuts widget to prevent some key presses being handled
// as system shortcuts before text input engine while typing on macOS desktop
class TextFormFieldWrapper extends StatelessWidget {
  final TextFormField textFormField;

  TextFormFieldWrapper({
    required this.textFormField,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyS):
        DoNothingAndStopPropagationTextIntent(),
      },
      child: textFormField,
    );
  }
}