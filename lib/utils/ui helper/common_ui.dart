import 'package:flutter/material.dart';

class UIHelper {
  // For height and width based on screen size
  static double kSize(BuildContext context, double value,
      {bool isHeight = true}) {
    return isHeight
        ? MediaQuery.of(context).size.height * value
        : MediaQuery.of(context).size.width * value;
  }

  // Height Box
  static Widget heightBox(double height) => SizedBox(height: height);

  // Width Box
  static Widget widthBox(double width) => SizedBox(width: width);

  // Flexible SizedBox
  static Widget flexibleBox({double? height, double? width}) {
    if (height != null && width == null) {
      return heightBox(height);
    } else if (width != null && height == null) {
      return widthBox(width);
    } else {
      return const SizedBox.shrink();
    }
  }

  // Padding helper
  static EdgeInsets kPadding({
    double all = 0.0,
    double horizontal = 0.0,
    double vertical = 0.0,
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return all != 0.0
        ? EdgeInsets.all(all)
        : EdgeInsets.only(
            left: left != 0.0 ? left : horizontal,
            right: right != 0.0 ? right : horizontal,
            top: top != 0.0 ? top : vertical,
            bottom: bottom != 0.0 ? bottom : vertical,
          );
  }

  // Margin helper
  static EdgeInsets kMargin({
    double all = 0.0,
    double horizontal = 0.0,
    double vertical = 0.0,
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return kPadding(
      all: all,
      horizontal: horizontal,
      vertical: vertical,
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    );
  }

  // For TextStyle
  static TextStyle kTextStyle({
    Color color = Colors.black,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
    FontStyle fontStyle = FontStyle.normal,
    double letterSpacing = 0.0,
    double? height,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  // Divider helper
  static Widget kDivider({
    double thickness = 1.0,
    Color color = Colors.grey,
    double indent = 0.0,
    double endIndent = 0.0,
  }) {
    return Divider(
      thickness: thickness,
      color: color,
      indent: indent,
      endIndent: endIndent,
    );
  }

  // Rounded container
  static Container kRoundedContainer({
    required Widget child,
    Color color = Colors.white,
    double borderRadius = 12.0,
    double elevation = 2.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8.0),
  }) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: elevation,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  // Colors helper
  static Color kColor({int hexColor = 0xFF000000, double opacity = 1.0}) {
    return Color(hexColor).withOpacity(opacity);
  }

  // Predefined Smooth Colors
  static const Color smoothBlue = Color(0xFFADD8E6);
  static const Color smoothGreen = Color(0xFF90EE90);
  static const Color smoothYellow = Color(0xFFFFF9C4);
  static const Color smoothPink = Color(0xFFFFC1CC);
  static const Color smoothPurple = Color(0xFFD1C4E9);

  // Gradient helper
  static LinearGradient kGradient({
    required List<Color> colors,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
    );
  }

  // Shadow helper
  static List<BoxShadow> kShadow({
    Color color = Colors.black,
    double blurRadius = 10.0,
    double spreadRadius = 1.0,
    Offset offset = const Offset(0, 3),
  }) {
    return [
      BoxShadow(
        color: color.withOpacity(0.1),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: offset,
      ),
    ];
  }
}
