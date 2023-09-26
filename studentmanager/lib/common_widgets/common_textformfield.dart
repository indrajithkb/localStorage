import 'package:flutter/material.dart';

TextFormField commonTextField(
    {required String text,
    required TextEditingController ctlr,
    FocusNode? focusNode,
    Function(String)? onFieldSub,
    Function(String)? onChanged,
    String? inputText,
    int? maxLines,
    String? Function(String?)? onValidate,
    required bool isObscure,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? isRaiseAlert,
    required bool isPasswordType,
    VoidCallback? onTap,
    TextEditingController? controller}) {
  return TextFormField(
    controller:ctlr ,
    textInputAction: maxLines != null && maxLines! > 1
        ? TextInputAction.newline
        : TextInputAction.done,
    onTap: onTap,
    // controller: controller ?? TextEditingController(),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    obscureText: isObscure,
    validator: onValidate,
    onChanged: onChanged,
    maxLines: maxLines,
    focusNode: focusNode,
    initialValue: inputText,

    onFieldSubmitted: onFieldSub,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      // contentPadding: EdgeInsets.only(top: 15.sp, left: 10.sp),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red.shade200, width: 2),
      ),
      hintText: text,

      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefixIconColor: Colors.grey,
      // prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
      hintStyle: TextStyle(
        color: Colors.blueGrey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      // fillColor: (isRaiseAlert != null && isRaiseAlert)
      //     ? OdinColors.homeLightBgColor4
      //     : OdinColors.texFormColor,
      border: (isRaiseAlert != null && isRaiseAlert)
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            )
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
    ),
  );
}
