
import 'package:flutter/material.dart';

class FontScaleController extends ChangeNotifier {
  double _fontScale = 1.0;

  double get fontScale => _fontScale;

  void setFontScale(double scale) {
    if (_fontScale == scale) return;

    _fontScale = scale;
    notifyListeners();
  }
}

class FontScaleControllerScope
    extends InheritedNotifier<FontScaleController> {
  const FontScaleControllerScope({
    super.key,
    required FontScaleController controller,
    required super.child,
  }) : super(notifier: controller);

  static FontScaleController of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<FontScaleControllerScope>();

    assert(
      scope != null,
      'FontScaleControllerScope não encontrado na árvore de widgets.',
    );

    return scope!.notifier!;
  }
}
