import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

const String headingFont = 'Poppins';

class Title extends Text {
  Title(String data,
      {Key? key, TextAlign? textAlign, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines})
      : super(data,
            key: key,
            textAlign: textAlign,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF5CAF69), fontFamily: headingFont));
}
