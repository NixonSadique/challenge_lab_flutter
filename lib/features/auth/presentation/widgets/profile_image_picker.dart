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
                color: const Color(0xffe1e3e4),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffbdc9c8), width: 2),
                image: image != null
                    ? DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                color: Color(0xff6E7979),
                size: 33,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text("Upload Profile Photo"),
      ],
    );
  }
}
