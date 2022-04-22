import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_stories/utils/colors.dart';

import '../utils/dimensions.dart';

text(String text, {var style, var align, overflow, var maxLine, var height}){
  return Text(
    text,
    overflow: overflow,
    textAlign: align,
    maxLines: maxLine,
    style: GoogleFonts.poppins(textStyle: style, height: height),
  );
}

textField(
    {
      var hintText,
      var labelText,
      var prefixIconData,
      var suffixIconData,
      var obscureText,
      var maxLength,
      var style,
      var keyBoard,
      var controller,
      var errorMessage,
      var readOnly = false,
      var onChanged,
      var onVisibility,
      var focusBorderColor
    }
    ){
  return TextField(
    enabled: !readOnly,
    readOnly: readOnly,
    controller: controller,
    keyboardType: keyBoard,
    onChanged: onChanged,
    obscureText: obscureText,
    cursorColor: Colors.blueGrey,
    style: GoogleFonts.poppins(textStyle: style),
    decoration: InputDecoration(
      focusColor: primaryColor,
      filled: true,
      disabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color: focusBorderColor),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF7E7E7E)),
      labelText: labelText,
      labelStyle: TextStyle(color: readOnly ? const Color(0xFF7E7E7E) : primaryColor),
      errorText: errorMessage,
      contentPadding: EdgeInsets.only(top: Dimension.dimen15,bottom: Dimension.dimen10),
      prefixIcon: Icon(
        prefixIconData,
        size: Dimension.dimen20,
        color: readOnly ? const Color(0xFF7E7E7E) : primaryColor,
      ),

      suffixIcon: suffixIconData == null ? null : GestureDetector(
        onTap: () {
          onVisibility();
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Icon(
            suffixIconData,
            size: Dimension.dimen20,
            color: primaryColor,
          ),
        ),
      ),
    ),
  );
}
