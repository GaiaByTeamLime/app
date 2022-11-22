import 'package:flutter/material.dart';

const String headingFont = 'Poppins';

class Title extends Text {
  const Title(String data,
      {Key? key,
      TextAlign? textAlign,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines})
      : super(data,
            key: key,
            textAlign: textAlign,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A5251),
                fontFamily: headingFont));
}

class Header extends StatelessWidget {
  const Header(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);

    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color(0xFF9ED0B3),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
      child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(text,
                    style: const TextStyle(
                        color: Color(0xFF0A5251),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28))
              ])),
    );
  }
}
