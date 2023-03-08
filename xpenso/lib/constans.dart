import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ************************ Initialising Dimensions ***************************

final double deviceHeight = Get.height.roundToDouble();
final double deviceWidtht = Get.width.roundToDouble();

final double deviceWidth = deviceWidtht * 0.95;
final double safeArea = deviceHeight * 0.07;
final double tabHeight = deviceHeight * 0.08;
final double cardHeight = deviceHeight * 0.25;
final double listHeight = deviceHeight * 0.57;
final double h05 = deviceHeight * 0.005;
final double h10 = deviceHeight * 0.01;
final double h15 = deviceHeight * 0.015;
final double h20 = deviceHeight * 0.02;
final double h25 = deviceHeight * 0.025;
final double h50 = deviceHeight * 0.05;
final double h75 = deviceHeight * 0.075;
final double h100 = deviceHeight * 0.1;

// ************************* Initialising Color Variables *********************

const Color transparent = Colors.transparent;
const Color appBarColor = Color.fromARGB(141, 118, 171, 223);
const Color cardColor = Color.fromARGB(255, 240, 240, 240);
const Color cardFontColor = Colors.black;
Color temp = Colors.white;

// ************************* Initalizing Date formatting  *********************

DateTime date = DateTime.now();
DateTime modDate = DateTime(d1.year - 5, d1.month - 1, d1.day - 5);
DateFormat day = DateFormat('EEE');
DateFormat month = DateFormat('MMM');
DateFormat year = DateFormat('yyyy');

String dateNow = date.toIso8601String();
DateTime d1 = DateTime.parse(dateNow);

// ************************* Custom Text Widget ******************************//

class MyText extends StatelessWidget {
  final String content;
  final double size;
  final Color color;
  final bool isHeader;
  final TextOverflow overflow;
  const MyText(
      {super.key,
      required this.content,
      this.size = 16,
      this.color = Colors.black,
      this.overflow = TextOverflow.ellipsis,
      this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      overflow: overflow,
    );
  }
}

// ************************* Custom Button Widget ****************************//

class MyButton extends StatefulWidget {
  final String content;
  final Function()? onPressed;
  final double textSize;
  final bool isBold;
  final double height;
  final double width;
  final Color textcolor;
  final Color borderColor;
  final Color fillColor;
  final double rad;

  const MyButton(
      {super.key,
      required this.content,
      this.textSize = 15,
      this.isBold = false,
      this.height = 50,
      this.width = 100,
      this.textcolor = Colors.black,
      this.borderColor = Colors.black,
      this.fillColor = Colors.white,
      this.rad = 5,
      required this.onPressed});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.fillColor,
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.rad)),
      child: TextButton(
        onPressed: widget.onPressed,
        child: MyText(
          content: widget.content,
          color: widget.textcolor,
          size: widget.textSize,
          isHeader: widget.isBold,
        ),
      ),
    );
  }
}

//*********************************** Decoration ******************************

class MyCustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyCustomIndicatorPainter();
  }
}

class _MyCustomIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final paint = Paint()
      ..color = appBarColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(rect.center.dx, rect.bottom - 2), h05, paint);
  }
}
