import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final bool isPassword;
  final bool readOnly;
  final String? Function(String?)? validate;
  final String label;
  final IconData? prefix;
  final Widget? suffix;
  final Function()? prefixPressed;
  final Function()? onTap;
  final bool isClickable;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.isPassword = false,
    this.readOnly = false,
    required this.validate,
    required this.label,
    this.prefix,
    this.suffix,
    this.prefixPressed,
    this.onTap,
    this.isClickable = true,
  }) : super(key: key);

  @override
  _DefaultFormFieldState createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  late TextDirection _textDirection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46.0),
      child: TextFormField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        keyboardType: widget.type,
        obscureText: widget.isPassword,
        onFieldSubmitted: widget.onSubmit,
        onChanged: (value) {
          setState(() {
            _textDirection = _getTextDirection(value);
          });
        },
        onTap: widget.onTap,
        enabled: widget.isClickable,
        validator: widget.validate,
        textDirection: _textDirection,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          prefixIcon: widget.prefix != null
              ? IconButton(
                  onPressed: widget.prefixPressed,
                  icon: Icon(
                    widget.prefix,
                  ),
                )
              : null,
          suffixIcon: widget.suffix,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white)),
        ),
      ),
    );
  }

  TextDirection _getTextDirection(String text) {
    bool hasArabicCharacters = RegExp(
            r'[\u0600-\u06FF\u0750-\u077F\u0590-\u05FF\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]')
        .hasMatch(text);
    return hasArabicCharacters ? TextDirection.rtl : TextDirection.ltr;
  }
}
