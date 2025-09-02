
import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/shared/constants/app_colors.dart';

enum AppTextStyle {
  headlineLarge,
  headlineMedium,
  titleLarge,
  bodyLarge,
  bodyMedium,
  button,
  caption,
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool isBold;

  const AppText(
    this.text, {
    super.key,
    this.style = AppTextStyle.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    switch (style) {
      case AppTextStyle.headlineLarge:
        textStyle = Theme.of(context).textTheme.headlineLarge!;
        break;
      case AppTextStyle.headlineMedium:
        textStyle = Theme.of(context).textTheme.headlineMedium!;
        break;
      case AppTextStyle.titleLarge:
        textStyle = Theme.of(context).textTheme.titleLarge!;
        break;
      case AppTextStyle.bodyLarge:
        textStyle = Theme.of(context).textTheme.bodyLarge!;
        break;
      case AppTextStyle.bodyMedium:
        textStyle = Theme.of(context).textTheme.bodyMedium!;
        break;
      case AppTextStyle.button:
        textStyle = Theme.of(context).textTheme.labelLarge!; // labelLarge é o estilo de botão padrão
        break;
      case AppTextStyle.caption:
        textStyle = Theme.of(context).textTheme.bodySmall!; // bodySmall é bom para legendas
        break;
    }

    if (isBold) {
      textStyle = textStyle.copyWith(fontWeight: FontWeight.bold);
    }

    return Text(
      text,
      style: textStyle.copyWith(color: color ?? AppColors.textPrimary), // Usa cor padrão ou sobrescreve
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
