import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';

enum StepStatus { complete, inProgress, incomplete }

class CustomStep extends StatelessWidget {
  final IconData? icon;
  final String? number;
  final StepStatus status;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? contentColor;
  final double borderRadius;
  final double padding;
  final double size;
  final VoidCallback? onPressed;

  const CustomStep({
    super.key,
    this.icon,
    this.number,
    required this.status,
    this.backgroundColor,
    this.borderColor,
    this.contentColor,
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
    final colorScheme = Theme.of(context).colorScheme;

    // Determine colors based on status and fallback to provided colors or defaults
    Color bgColor = backgroundColor ?? _getBackgroundColor(status, colorScheme);
    Color bColor = borderColor ?? _getBorderColor(status, colorScheme);
    Color cColor = contentColor ?? _getContentColor(status, colorScheme);

    return Material(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: bColor, width: 1),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(child: _buildContent(cColor)),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(StepStatus status, ColorScheme colorScheme) {
    switch (status) {
      case StepStatus.complete:
        return AppColors.success;
      case StepStatus.inProgress:
        return colorScheme.primary;
      case StepStatus.incomplete:
        return colorScheme.surface;
    }
  }

  Color _getBorderColor(StepStatus status, ColorScheme colorScheme) {
    switch (status) {
      case StepStatus.complete:
        return Colors.transparent;
      case StepStatus.inProgress:
        return Colors.transparent;
      case StepStatus.incomplete:
        return colorScheme.outline;
    }
  }

  Color _getContentColor(StepStatus status, ColorScheme colorScheme) {
    switch (status) {
      case StepStatus.complete:
      case StepStatus.inProgress:
        return colorScheme.surface;
      case StepStatus.incomplete:
        return colorScheme.onSurface;
    }
  }

  Widget _buildContent(Color contentColor) {
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
