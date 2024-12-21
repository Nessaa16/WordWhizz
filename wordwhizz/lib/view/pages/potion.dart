part of 'pages.dart';

// ini class buat potionnya 
class Potion {
  final String image; 
  final int quantity; 
  bool selected; 

  Potion({
    required this.image, 
    required this.quantity, 
    this.selected = false,
    });

  void toggleSelection(){
    selected = !selected; 
  }
}