import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';

enum StepStatus { complete, inProgress, incomplete }

class CustomStep extends StatelessWidget {
  final IconData? icon;
  final String? number;
  final StepStatus status;
  final Color backgroundColor;
  final Color borderColor;
  final Color contentColor;
  final double borderRadius;
  final double padding;
  final double size;
  final VoidCallback? onPressed;

  const CustomStep({
    super.key,
    this.icon,
    this.number,
    required this.status,
    this.backgroundColor = AppColors.surface,
    this.borderColor = Colors.transparent,
    this.contentColor = AppColors.onSurface,
    this.borderRadius = 6,
    this.padding = 4,
    this.size = 24,
    this.onPressed,
  }) : assert(
         (icon == null) != (number == null),
         'Either icon or number must be provided, but not both.',
       );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor, width: 1),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(child: _buildContent()),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch ((icon, number)) {
      case (IconData _, null):
        return Icon(icon, color: contentColor, size: size * 0.6);
      case (null, String _):
        return Text(
          number!,
          style: TextStyle(
            color: contentColor,
            fontSize: size * 0.5,
            fontWeight: FontWeight.w500,
            height: 1.33,
            letterSpacing: -0.12,
          ),
          textAlign: TextAlign.center,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
