import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/utils/validators.dart';
import 'package:flutter_lagos_widget_testing_session/widgets/text_field.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final Function(String)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const PasswordTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.validator,
    this.keyboardType = TextInputType.visiblePassword,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidePassword = true;

  void toggleVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      key: widget.key,
      obscureText: _hidePassword,
      controller: widget.controller,
      focusNode: widget.focusNode,
      label: widget.label,
      hint: widget.hint,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator ?? Validators.validatePassword,
      suffix: PasswordVisibilityIcon(
        onPressed: toggleVisibility,
        value: _hidePassword,
      ),
    );
  }
}

class PasswordVisibilityIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final bool value;

  const PasswordVisibilityIcon({
    Key? key,
    required this.onPressed,
    this.value = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        value ? PhosphorIcons.eye : PhosphorIcons.eye_slash,
        color: Colors.black87,
        size: 18,
      ),
    );
  }
}
