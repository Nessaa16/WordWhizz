part of 'shared.dart';

Color primaryColor = const Color(0xFFFF7600);  // Fixed hex format
Color secondaryColor = const Color(0xFF984E09);
Color darkGreen = const Color(0xFF95D72C);
Color lightGreen = const Color(0xFFA7EC3A);
Color yellowColor = const Color(0xFFFFDE00);
Color bgColor = const Color(0xFF5BCEFF);
Color dropShadow = const Color(0xFF006691);
Color fontColor = const Color(0xFF403C3C);

TextStyle splashTitle1 = TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 37.0,
  fontWeight: FontWeight.bold,
  color: secondaryColor,
);

TextStyle splashTitle2 = TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  color: secondaryColor,
);

TextStyle splashTitle3 = TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
   shadows: [
    Shadow(
      offset: Offset(2.0, 2.0), // Horizontal and vertical shadow offset
      blurRadius: 4.0,          // Shadow blur radius
      color: Colors.black54,    // Shadow color
    ),
  ],
);

TextStyle splashContent1 = TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 19.0,
  color: secondaryColor,
);

TextStyle button1 = TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 20.0,
  fontWeight: FontWeight.w800,
  color: Colors.white,
);

TextStyle button2 = TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 20.0,
  fontWeight: FontWeight.w800,
  color: primaryColor,
);

TextStyle character = TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: secondaryColor,
);

TextStyle story_content = const TextStyle(
  fontFamily: 'BalooChettan2',
  fontSize: 15.0,
  // fontWeight: FontWeight.bold,
  color: Colors.white,
);