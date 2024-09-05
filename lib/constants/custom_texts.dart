import 'package:flutter/material.dart';
import 'package:kfahi/constants/size.dart';

class FontSizes {
  static double scale = 1;

  static void init(BuildContext context) {
    scale = AppSizes.getScreenWidth(context) / 600;
  }

  static double get h0 => 40 * scale;

  static double get h00 => 38 * scale;

  static double get h1 => 32 * scale;

  static double get h2 => 30 * scale;

  static double get h3 => 24 * scale;

  static double get h4 => 20 * scale;

  static double get h5 => 18 * scale;

  static double get h6 => 12 * scale;
}

class TextWeight {
  static FontWeight get regular => FontWeight.w300;

  static FontWeight get medium => FontWeight.w500;

  static FontWeight get semiBold => FontWeight.w700;

  static FontWeight get bold => FontWeight.w900;
}

class BodyTooLargeText extends StatelessWidget {
  final String text;

  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;

  const BodyTooLargeText(this.text,
      {Key? key,
      this.isUnderlined = false,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h0,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.medium,
            overflow: TextOverflow.ellipsis));
  }
}

class BodyExtraLargeText extends StatelessWidget {
  final String text;

  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;

  const BodyExtraLargeText(this.text,
      {Key? key,
      this.isUnderlined = false,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h1,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.medium,
            overflow: TextOverflow.ellipsis));
  }
}

class BodyLargeText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;

  const BodyLargeText(this.text,
      {Key? key,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color,
      this.isUnderlined = false,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: textOverflow ?? TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h2,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.semiBold));
  }
}

class BodySimiLargeText extends StatelessWidget {
  final String text;

  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;

  const BodySimiLargeText(this.text,
      {Key? key,
      this.isUnderlined = false,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h00,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.medium,
            overflow: TextOverflow.ellipsis));
  }
}

class BodyMediumText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final bool isUnderlined;

  const BodyMediumText(this.text,
      {Key? key,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color,
      this.isUnderlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h3,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.medium,
            overflow: TextOverflow.ellipsis));
  }
}

class BodySmallText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;

  const BodySmallText(this.text,
      {Key? key,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color,
      this.isUnderlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h4,
            overflow: TextOverflow.ellipsis,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.medium));
  }
}

class BodyExtraSmallText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;

  final FontWeight? weight;
  final Color? color;

  const BodyExtraSmallText(this.text,
      {Key? key,
      this.isUnderlined = false,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h5,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.medium));
  }
}

class BodyTooSmallText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;

  final FontWeight? weight;
  final Color? color;

  const BodyTooSmallText(this.text,
      {Key? key,
      this.isUnderlined = false,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h6,
            color: color ?? Colors.black,
            fontWeight: weight ?? TextWeight.medium));
  }
}
