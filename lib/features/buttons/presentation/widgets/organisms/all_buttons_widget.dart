import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/widgets/step_button.dart';

class AllButtonsWidget extends StatelessWidget {
  const AllButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRow(_buildFirstRowButtons()),
        const SizedBox(height: 12),
        _buildRow(_buildSecondRowButtons()),
        const SizedBox(height: 12),
        _buildRow(_buildIconButtons(StepStatus.inProgress)),
        const SizedBox(height: 12),
        _buildRow(_buildLastRowButtons()),
      ],
    );
  }

  List<Widget> _buildFirstRowButtons() {
    return [
      _createNumberStep(
        '1',
        StepStatus.inProgress,
        AppColors.primary,
        AppColors.surface,
      ),
      _createNumberStep(
        '1',
        StepStatus.incomplete,
        AppColors.surface,
        AppColors.onSurface,
        borderColor: AppColors.outline,
      ),
      _createNumberStep(
        '1',
        StepStatus.incomplete,
        AppColors.surface,
        AppColors.onSurfaceVariantLow,
        borderColor: AppColors.outlineLight,
      ),
      _createNumberStep(
        '1',
        StepStatus.complete,
        AppColors.success,
        AppColors.surface,
      ),
      _createIconStep(
        Icons.check,
        StepStatus.complete,
        AppColors.success,
        AppColors.surface,
      ),
    ];
  }

  List<Widget> _buildSecondRowButtons() {
    return [
      _createNumberStep(
        '1',
        StepStatus.inProgress,
        AppColors.primary,
        AppColors.surface,
      ),
      _createNumberStep(
        '1',
        StepStatus.incomplete,
        AppColors.surface,
        AppColors.onSurfaceVariantLow,
        borderColor: AppColors.outlineLight,
      ),
      _createNumberStep(
        '1',
        StepStatus.complete,
        AppColors.success,
        AppColors.surface,
        borderRadius: 500,
      ),
      _createIconStep(
        Icons.check,
        StepStatus.complete,
        AppColors.success,
        AppColors.surface,
        borderRadius: 500,
      ),
    ];
  }

  List<Widget> _buildIconButtons(StepStatus initialStatus) {
    return [
      _createIconStep(
        Icons.folder_open,
        initialStatus,
        AppColors.primary,
        AppColors.surface,
      ),
      _createIconStep(
        Icons.folder_open,
        StepStatus.incomplete,
        AppColors.surface,
        AppColors.onSurface,
        borderColor: AppColors.outline,
      ),
      _createIconStep(
        Icons.folder_open,
        StepStatus.incomplete,
        AppColors.surface,
        AppColors.onSurfaceVariantLow,
        borderColor: AppColors.outlineLight,
      ),
      _createIconStep(
        Icons.folder_open,
        StepStatus.complete,
        AppColors.success,
        AppColors.surface,
      ),
    ];
  }

  List<Widget> _buildLastRowButtons() {
    return [
      _createIconStep(
        Icons.folder_open,
        StepStatus.incomplete,
        AppColors.surface,
        AppColors.onSurface,
        borderColor: AppColors.outline,
      ),
      _createIconStep(
        Icons.folder_open,
        StepStatus.complete,
        AppColors.success,
        AppColors.surface,
      ),
      _createIconStep(
        Icons.folder_open,
        StepStatus.inProgress,
        AppColors.primary,
        AppColors.surface,
      ),
    ];
  }

  CustomStep _createNumberStep(
    String number,
    StepStatus status,
    Color backgroundColor,
    Color contentColor, {
    Color? borderColor,
    double borderRadius = 8.0,
  }) {
    return CustomStep(
      number: number,
      status: status,
      backgroundColor: backgroundColor,
      contentColor: contentColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
    );
  }

  CustomStep _createIconStep(
    IconData icon,
    StepStatus status,
    Color backgroundColor,
    Color contentColor, {
    Color? borderColor,
    double borderRadius = 8.0,
  }) {
    return CustomStep(
      icon: icon,
      status: status,
      backgroundColor: backgroundColor,
      contentColor: contentColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
    );
  }

  Widget _buildRow(List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          buttons
              .map(
                (btn) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: btn,
                ),
              )
              .toList(),
    );
  }
}
