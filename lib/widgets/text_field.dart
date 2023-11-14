import 'package:flutter/material.dart';

class MaterialTextField extends StatefulWidget {
  final bool isPassword;
  final TextEditingController controller;
  final String labelText;

  final double? width;
  final double? height;

  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;
  final bool? isReadOnly;
  final String? errorText;
  final String? hintText;

  const MaterialTextField(
      {super.key,
      required this.isPassword,
      required this.controller,
      required this.labelText,
      this.width,
      this.height,
      this.marginTop,
      this.marginBottom,
      this.marginLeft,
      this.marginRight,
      this.isReadOnly,
      this.errorText,
      this.hintText});

  @override
  // ignore: library_private_types_in_public_api
  _MaterialTextFieldState createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<MaterialTextField> {
  bool _obscureText = true;
  bool _showSuffixIcon = false;
  bool _showPasswordSuffixIcon = false;

  @override
  void initState() {
    super.initState();
    _showPasswordSuffixIcon = widget.controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: widget.marginTop ?? 0,
          bottom: widget.marginBottom ?? 0,
          left: widget.marginLeft ?? 0,
          right: widget.marginRight ?? 0,
        ),
        child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: TextField(
              readOnly: widget.isReadOnly ?? false,
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                errorText: widget.errorText,
                labelText: widget.labelText,
                border: const OutlineInputBorder(),
                suffixIcon: widget.isPassword
                    ? (_showPasswordSuffixIcon
                        ? IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )
                        : null)
                    : (_showSuffixIcon
                        ? IconButton(
                            icon: const Icon(Icons.cancel_outlined),
                            onPressed: () {
                              widget.controller.clear();
                              setState(() {
                                _showSuffixIcon = false;
                              });
                            },
                          )
                        : null),
              ),
              onChanged: (text) {
                setState(() {
                  _showSuffixIcon = text.isNotEmpty;
                  _showPasswordSuffixIcon = text.isNotEmpty;
                });
              },
              onTap: () {
                // check if readonly is false
                if (!widget.isReadOnly! &&
                    !widget.isPassword &&
                    widget.controller.text.isNotEmpty) {
                  setState(() {
                    _showSuffixIcon = true;
                  });
                }
              },
              obscureText: widget.isPassword && _obscureText,
            )));
  }
}
