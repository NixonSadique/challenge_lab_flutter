import 'package:challenge_lab_flutter/core/theme/app_theme.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? image;
  final VoidCallback onPickImage;

  const ProfileImagePicker({
    super.key,
    required this.image,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: onPickImage,
            child: Container(
              alignment: Alignment.center,
              height: 98,
              width: 98,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outlineVariant, width: 2),
                image: image != null
                    ? DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                color: AppColors.outline,
                size: 33,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Upload Profile Photo",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
