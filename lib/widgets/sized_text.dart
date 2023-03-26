import 'package:todo/export_files.dart';

class SizedText extends StatelessWidget {
  final dynamic text;
  final TextStyle? textStyle;
  final bool useLocaleText;
  final bool softWrap;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final int? maxLines;

  SizedText({
    required this.text,
    this.textStyle,
    this.useLocaleText = true,
    this.softWrap = true,
    this.overflow = TextOverflow.visible,
    this.textAlign = TextAlign.left,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
          height: textStyle?.height,
          color: textStyle?.color,
          fontSize: textStyle?.fontSize,
          fontWeight: textStyle?.fontWeight,
          decoration: textStyle?.decoration,
          background: textStyle?.background,
          fontFamily: textStyle?.fontFamily,
          fontFamilyFallback: textStyle?.fontFamilyFallback,
          fontStyle: textStyle?.fontStyle,
          wordSpacing: textStyle?.wordSpacing,
          textBaseline: textStyle?.textBaseline,
          overflow: textStyle?.overflow,
          letterSpacing: textStyle?.letterSpacing,
          decorationThickness: textStyle?.decorationThickness,
          decorationColor: textStyle?.decorationColor,
          decorationStyle: textStyle?.decorationStyle),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
