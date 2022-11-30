import 'package:flutter/material.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;

class EmptyPage extends StatelessWidget {
  final List<Widget> children;
  const EmptyPage({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 120),
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 40),
              ...children
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> extraLayers;
  const HeaderPage(
    this.title,
    this.child, {
    super.key,
    this.extraLayers = const [],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: key,
        body: SizedBox.expand(
          child: Stack(
            children: [
              Container(
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
                  ),
                ),
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
                          child: child,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ...extraLayers,
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollableHeaderPage extends HeaderPage {
  final List<Widget> children;
  final bool padding;
  ScrollableHeaderPage(
    String title,
    this.children, {
    super.key,
    this.padding = true,
  }) : super(
            title,
            ListView(
              padding: padding
                  ? const EdgeInsets.symmetric(horizontal: 40)
                  : const EdgeInsets.all(0),
              children: children,
            ));
}
