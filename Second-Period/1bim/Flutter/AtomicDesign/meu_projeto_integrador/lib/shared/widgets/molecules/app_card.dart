import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/shared/constants/app_spacings.dart';
import 'package:meu_projeto_integrador/shared/constants/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;

  const AppCard({
    super.key,
    required this.child,
    this.elevation = 4,
    this.borderRadius = const BorderRadius.all(Radius.circular(AppSpacings.small)),
    this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: AppSpacings.medium, vertical: AppSpacings.small),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      color: AppColors.cardBackground, // Usando cor do Design System
      child: onTap != null
          ? InkWell(
              onTap: onTap,
              borderRadius: borderRadius as BorderRadius, // Cast seguro, ou adaptar para BorderRadiusGeometry
              child: child,
            )
          : child,
    );
  }
}
