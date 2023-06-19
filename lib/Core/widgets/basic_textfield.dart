import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mastore/Core/utils/palette.dart';

class BasicBorderedTextField extends StatelessWidget {
  final String? hintText;
  final int maxLines;
  final int? maxLength;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color borderColor;
  final Color fillColor;
  final Color hintTextColor;
  final TextEditingController? controller;
  final String? errorText;
  final bool? enabled;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? txtInputFormatter;
  final TextCapitalization textCapitalization;
  final Function(String)? onChangedFunc;
  final Function(String)? onSubmittedFunc;
  final FocusNode? focusNode;
  final bool isPasswordType;
  final bool? showLabel;
  final bool isRounded;

  const BasicBorderedTextField(
      {Key? key,
        this.hintText,
        this.maxLines = 1,
        this.maxLength,
        this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        this.suffixIcon,
        this.prefixIcon,
        this.borderColor = Palette.mdlSpaceCadet20,
        this.fillColor = Colors.white,
        this.hintTextColor = Palette.mdlSpaceCadet20,
        this.controller,
        this.errorText,
        this.enabled,
        this.keyboardType = TextInputType.text,
        this.txtInputFormatter,
        this.textCapitalization = TextCapitalization.none,
        this.onChangedFunc,
        this.onSubmittedFunc,
        this.focusNode,
        this.isPasswordType = false,
        this.showLabel,
        this.isRounded = false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: (maxLines > 1) ? TextInputType.multiline : keyboardType,
      style: Palette.mdlBodyRegular.copyWith(
        color: Palette.mdlSpaceCadet100, height: 0
      ),
      enabled: enabled,
      inputFormatters: (keyboardType == TextInputType.emailAddress)
          ? [FilteringTextInputFormatter.deny(RegExp(r'\s')),]
          : txtInputFormatter,
      textCapitalization: textCapitalization,
      focusNode: focusNode,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: fillColor,
        labelText: (showLabel == null) ? null : hintText,
        labelStyle: (showLabel == null) ? null : TextStyle(
          fontSize: 14,
          color: hintTextColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: hintTextColor,
        ),
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorText: errorText,
        errorStyle: Palette.mdlBodyRegular.copyWith(
            color: Palette.mdlEnglishVermilion100, height: 0
        ),
        border: buildOutlineInputBorder(borderColor),
        enabledBorder: buildOutlineInputBorder(borderColor),
        disabledBorder: buildOutlineInputBorder(borderColor),
        errorBorder: buildOutlineInputBorder(Colors.red),
        focusedBorder: buildOutlineInputBorder(Palette.textColor),
        focusedErrorBorder: buildOutlineInputBorder(Palette.textColor),
      ),
      onChanged: (value) {
        if (onChangedFunc != null) onChangedFunc!(value);
      },
      onSubmitted: (value){
        if (onSubmittedFunc != null) onSubmittedFunc!(value);
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: BorderRadius.circular(isRounded ? 25.0 : 8.0),
    );
  }
}