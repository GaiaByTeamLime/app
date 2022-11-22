import 'package:flutter/material.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;

class HeaderPage extends StatelessWidget {
String title;
List<Widget> children;
  HeaderPage(this.title, this.children, {super.key});


  @override
  Widget build(BuildContext context) {
  return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () { FocusScope.of(context).requestFocus(new FocusNode()); },
            child: Scaffold(
            key: key,
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.39, 0.4, 1],
                colors: [
                  Color(0xFF9ED0B3),
                  Color(0xFF9ED0B3),
                  Colors.white,
                  Colors.white,
                ],
              )),
              child: SafeArea(
                  child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Gradient.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Typography.Header(title),
                      Expanded(
                          child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        children: children,
                      ))
                    ]),
              )),
            )));
}
}
