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
  const Header(this.text,
      {this.backButton, this.menuItems = const [], super.key});
  final String text;
  final List<Widget> menuItems;
  final Function()? backButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color(0xFF9ED0B3),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
      child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                backButton != null
                    ? IconButton(
                        icon: const Icon(Icons.navigate_before),
                        color: const Color(0xFF0A5251),
                        onPressed: backButton,
                        padding: EdgeInsets.zero,
                        iconSize: 42,
                      )
                    : const SizedBox(width: 35),
                Expanded(
                    child: Text(text,
                        style: const TextStyle(
                            color: Color(0xFF0A5251),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 28))),
                ...menuItems,
              ])),
    );
  }
}
