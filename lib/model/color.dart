class Color {
  final String name;
  final String hexCode;

  Color(this.name, this.hexCode);

  static List<Color> fetchAll() {
    return [
      Color('Maya Blue', '5FC9F8'),
      Color('Sunglow', 'FECB2E'),
      Color('Radical Red', 'FC3158'),
      Color('Blue (Crayola)', '147EFB'),
      Color('Emerald', '53D769'),
      Color('Coral Red', 'FC3D39'),
    ];
  }
}
