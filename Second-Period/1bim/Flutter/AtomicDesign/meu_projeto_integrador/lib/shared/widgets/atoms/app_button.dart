import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/shared/constants/app_colors.dart';
import 'package:meu_projeto_integrador/shared/widgets/atoms/app_text.dart';
import 'package:meu_projeto_integrador/shared/constants/app_spacings.dart';

enum AppButtonType { primary, secondary, danger, outline }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonType type;
  final IconData? icon;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;
    Color textColor;

    switch (type) {
      case AppButtonType.primary:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
        );
        textColor = AppColors.textOnPrimary;
        break;
      case AppButtonType.secondary:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.textPrimary,
        );
        textColor = AppColors.textPrimary;
        break;
      case AppButtonType.danger:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          foregroundColor: AppColors.textOnPrimary,
        );
        textColor = AppColors.textOnPrimary;
        break;
      case AppButtonType.outline:
        buttonStyle = OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
        );
        textColor = AppColors.primary;
        return OutlinedButton(
          style: buttonStyle,
          onPressed: isLoading ? null : onPressed,
          child: _buildChild(textColor),
        );
    }

    return ElevatedButton(
      style: buttonStyle,
      onPressed: isLoading ? null : onPressed,
      child: _buildChild(textColor),
    );
  }

  Widget _buildChild(Color textColor) {
    if (isLoading) {
      return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          color: textColor,
          strokeWidth: 2,
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, color: textColor),
          const SizedBox(width: AppSpacings.small),
        ],
        AppText(
          text,
          style: AppTextStyle.button,
          color: textColor,
        ),
      ],
    );
  }
}
