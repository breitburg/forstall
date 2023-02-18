import 'package:flutter/widgets.dart';

class ForstallPageRoute<T> extends PageRoute<T> {
  final bool _maintainState;
  final String? _barrierLabel;
  final WidgetBuilder _builder;

  ForstallPageRoute({
    required WidgetBuilder builder,
    super.settings,
    String? barrierLabel,
    bool maintainState = true,
  })  : _maintainState = maintainState,
        _barrierLabel = barrierLabel,
        _builder = builder;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = _builder(context);

    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: ScaleTransition(
        scale: CurveTween(curve: Curves.easeOutSine).animate(animation),
        child: result,
      ),
    );
  }

  @override
  String? get barrierLabel => _barrierLabel;

  @override
  bool get maintainState => _maintainState;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
  
  @override
  Color? get barrierColor => const Color.fromRGBO(0, 0, 0, 0.75);
}
