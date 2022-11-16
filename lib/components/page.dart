import 'package:flutter/material.dart';

class HeaderPage extends Scaffold {
  HeaderPage(Widget child, {Key? key})
      : super(
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
                child: child,
              )),
            ));
}
