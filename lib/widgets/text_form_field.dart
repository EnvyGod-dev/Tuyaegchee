import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CustomTextFieldStyle {
  primary, // White
  secondary, // Grey
}

class CustomTextField extends StatefulWidget {
  final CustomTextFieldStyle style;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final EdgeInsets margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputFormatter? inputFormatter;
  final String? prefixAsset;
  final String? label;
  final TextStyle? hintStyle;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? padding;
  final Function(String)? onChanged;
  final String? suffixAsset;

  CustomTextField({
    Key? key,
    this.style = CustomTextFieldStyle.primary,
    required this.controller,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.borderRadius,
    this.prefixAsset,
    this.label,
    this.hintStyle,
    this.keyboardType,
    this.obscureText = false,
    this.inputFormatter,
    this.fontSize = 15.0,
    this.fontWeight = FontWeight.w500,
    this.textColor,
    this.maxLines,
    this.maxLength,
    // this.suffixWidget,
    this.suffixAsset,
    this.padding,
    this.onChanged,
    // this.suffixColor,
    // this.visibleSuffix = true,
    // this.alwaysVisibleSuffix = true,
    // this.onPressedSuffix,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;
    // _suffixAsset = _obscureText ? Assets.obscure_hidden : widget.suffixAsset;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            label: Text(widget.label!),
            labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onChanged: widget.onChanged),
    );
  }
}
