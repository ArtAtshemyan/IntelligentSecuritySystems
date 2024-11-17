import 'dart:io';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final File? image;

  const ProfileAvatar({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 149.77,
          height: 149.51,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: image != null
                ? DecorationImage(
                    image: FileImage(image!),
                    fit: BoxFit.cover,
                  )
                : null,
            color: image == null ? Colors.grey[300] : null,
          ),
          child: image == null
              ? Icon(
                  Icons.person,
                  color: Colors.grey[700],
                  size: 50,
                )
              : null,
        ),
      ),
    );
  }
}
