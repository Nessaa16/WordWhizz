part of 'pages.dart';

class Potion {
  final String image;
  final int quantity;
  bool selected;

  Potion({
    required this.image,
    required this.quantity,
    this.selected = false,
  });

  void toggleSelection() {
    if (quantity > 0) {
      selected = !selected;
    }
  }
}