import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;
  final Function(String)? onChange;
  final Function(String)? onEditCompleted;
  final String? initialValue;
  final String? text;
  final FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final AutovalidateMode? autoValidateMode;
  final bool? obscureText;
  final bool? readOnly;
  final bool? isGender;
  final bool? isFeedback;
  final bool? isFilled;
  final Function()? onTapped;
  TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final Color? suffixIconColor;
  final Color? borderColor;
  final Color labelColor;
  final Color hintColor;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Key? formKey;
  final double? size;
  final int? maxline;
  final int? minline;
  final double? border;

  TextFormWidget({
    Key? key,
    this.textCapitalization = TextCapitalization.words,
    this.label,
    this.floatingLabel,
    this.hint,
    this.isFilled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.validator,
    this.onPasswordToggle,
    this.initialValue,
    this.inputFormatters,
    this.controller,
    this.autoValidateMode,
    this.obscureText = false,
    this.isGender = false,
    this.readOnly = false,
    this.isFeedback = false,
    this.onTapped,
    this.labelStyle,
    this.onEditCompleted,
    this.keyboardType,
    this.suffixIconColor,
    this.fillColor,
    this.prefixIconColor,
    this.onChange,
    this.formKey,
    this.size,
    this.text,
    this.borderColor = Colors.transparent,
    this.labelColor = Colors.black,
    this.maxline = 1,
    this.border = 4,
    this.minline,
    this.focusNode,
    this.hintColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization!,
      keyboardType: keyboardType,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label ?? '',
        labelStyle: labelStyle,
        filled: isFilled,
        fillColor: fillColor,
        focusColor: Colors.black,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 19),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color:Colors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        prefixIcon:
            prefixWidget ??
            (prefixIcon != null
                ? IconButton(
                  onPressed: onPasswordToggle,
                  icon: Icon(prefixIcon, color: prefixIconColor),
                )
                : null),
        suffixIcon: Padding(
          padding: EdgeInsets.all(1.5),
          child:
              suffixWidget ??
              (suffixIcon != null
                  ? IconButton(
                    onPressed: onPasswordToggle,
                    iconSize: size,
                    icon: Icon(suffixIcon, color: suffixIconColor),
                  )
                  : null),
        ),
      ),
      obscureText: obscureText!,
      controller: controller,
      readOnly: readOnly!,
      onTap: onTapped,
      key: formKey,
      maxLines: maxline,
      minLines: minline,
      cursorColor: Colors.black,
      onChanged: onChange,
      onFieldSubmitted: onEditCompleted,
      validator: validator,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
