import 'package:flutter/material.dart';

class AccountTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const AccountTypeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xff007070).withAlpha(90)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? const Color(0xff005656) : const Color(0xffc5cece),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: const Color(0xff6E7979)),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff191C1D),
                  ),
                ),
              ],
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 15, color: Color(0xff5D5E61)),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
