import 'package:flutter/material.dart';

class AppDecoration {
  static InputDecoration mDecoration({
    required String label,
    required String hint,
    IconData? mIcon,
    bool isPassword = false,
    bool isPasswordVisible =false,
    void Function()? onObscuretap,
  }){
    return InputDecoration(
      labelText: label,
      hintText: hint,
      suffixIcon: isPassword ? InkWell(
        onTap: onObscuretap,
        child: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
      ): null,prefixIcon: mIcon != null? Icon(mIcon) : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(21),
      ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),


    );
  }
}
