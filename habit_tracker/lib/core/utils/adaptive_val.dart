class Adaptive {
  /// ширина экрана фактическая
  static double width = 1;

  /// высота экрана фактическая
  static double height = 1;

  /// Высота системного статус бара
  static double viewPaddingTop = 1;

  /// размеры окна от дизайнера ширина
  static const double desWidth = 430;

  /// размеры окна от дизайнера высота
  static double desHeight = 932;

  /// размеры отступов между элементами
  static const double desIndent = 2;

  /// размеры отступов между кнопками
  static double desIndentButton = 8;

  static double getWidth(double size) => size * width / desWidth;
  static double getHeight(double size) => size * height / desHeight;

  static double getByMin(double size) =>
      (height < width) ? size / desHeight * height : size / desWidth * width;

  static double getByMax(double size) =>
      (height > width) ? size / desHeight * height : size / desWidth * width;
}
