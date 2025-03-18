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
        _buildRow([
          CustomStep(
            number: '1',
            status: StepStatus.inProgress,
            backgroundColor: AppColors.primary,
            contentColor: AppColors.surface,
          ),
          CustomStep(
            number: '1',
            status: StepStatus.incomplete,
            backgroundColor: AppColors.surface,
            borderColor: AppColors.outline,
            contentColor: AppColors.onSurface,
          ),
          CustomStep(
            number: '1',
            status: StepStatus.incomplete,
            backgroundColor: AppColors.surface,
            borderColor: AppColors.outlineLight,
            contentColor: AppColors.onSurfaceVariantLow,
          ),
          CustomStep(
            number: '1',
            status: StepStatus.complete,
            backgroundColor: AppColors.success,
            contentColor: AppColors.surface,
          ),
          CustomStep(
            icon: Icons.check,
            status: StepStatus.complete,
            backgroundColor: AppColors.success,
            contentColor: AppColors.surface,
          ),
        ]),
        const SizedBox(height: 12),
        _buildRow([
          CustomStep(
            number: '1',
            status: StepStatus.inProgress,
            backgroundColor: AppColors.primary,
            contentColor: AppColors.surface,
          ),
          CustomStep(
            number: '1',
            status: StepStatus.incomplete,
            backgroundColor: AppColors.surface,
            borderColor: AppColors.outlineLight,
            contentColor: AppColors.onSurfaceVariantLow,
          ),
          CustomStep(
            number: '1',
            status: StepStatus.complete,
            backgroundColor: AppColors.success,
            contentColor: AppColors.surface,
            borderRadius: 500,
          ),
          CustomStep(
            icon: Icons.check,
            status: StepStatus.complete,
            backgroundColor: AppColors.success,
            contentColor: AppColors.surface,
            borderRadius: 500,
          ),
        ]),
        const SizedBox(height: 12),
        _buildRow([
          CustomStep(
            icon: Icons.folder_open,
            status: StepStatus.inProgress,
            backgroundColor: AppColors.primary,
            contentColor: AppColors.surface,
          ),
          CustomStep(
            icon: Icons.folder_open,
            status: StepStatus.incomplete,
            backgroundColor: AppColors.surface,
            borderColor: AppColors.outline,
            contentColor: AppColors.onSurface,
          ),
          CustomStep(
            icon: Icons.folder_open,
            status: StepStatus.incomplete,
            backgroundColor: AppColors.surface,
            borderColor: AppColors.outlineLight,
            contentColor: AppColors.onSurfaceVariantLow,
          ),
          CustomStep(
            icon: Icons.folder_open,
            status: StepStatus.complete,
            backgroundColor: AppColors.success,
            contentColor: AppColors.surface,
          ),
        ]),
        const SizedBox(height: 12),
        _buildRow([
          CustomStep(
            icon: Icons.folder_open,
            status: StepStatus.incomplete,
            backgroundColor: AppColors.surface,
            borderColor: AppColors.outline,
            contentColor: AppColors.onSurface,
          ),
          CustomStep(
            icon: Icons.folder_open,
            status: StepStatus.complete,
            backgroundColor: AppColors.success,
            contentColor: AppColors.surface,
          ),
          CustomStep(
            icon: Icons.folder_open,
            status: StepStatus.inProgress,
            backgroundColor: AppColors.primary,
            contentColor: AppColors.surface,
          ),
        ]),
      ],
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
