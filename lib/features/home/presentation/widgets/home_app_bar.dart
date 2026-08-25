import 'package:challenge_lab_flutter/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;

  const HomeAppBar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.outlineVariant, width: 2),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Challenge Lab"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.winnerAccentSoft,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              username.startsWith('@') ? username : '@$username',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
