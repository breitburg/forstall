import 'package:flutter/widgets.dart';

class PageDots extends AnimatedWidget {
  final PageController controller;
  final int length;

  const PageDots({super.key, required this.controller, required this.length})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    var current = controller.hasClients ? controller.page ?? 0 : 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var page = 0; page < length; page++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            constraints: BoxConstraints.loose(const Size.square(6)),
            decoration: BoxDecoration(
              color: Color.fromRGBO(
                255,
                255,
                255,
                current.round() == page ? 0.75 : 0.3,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
      ],
    );
  }
}
