import 'package:flutter/material.dart';
import 'account_type_card.dart';

class AccountTypeSelector extends StatelessWidget {
  final List accountTypes;
  final int selectedIndex;
  final ValueChanged<int> onTypeSelected;

  const AccountTypeSelector({
    super.key,
    required this.accountTypes,
    required this.selectedIndex,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account Type', style: textTheme.labelLarge),
        const SizedBox(height: 8),
        AccountTypeCard(
          icon: Icons.person_outline_rounded,
          title: accountTypes[0],
          description: 'Solve Challenges and Build your portfolio.',
          selected: selectedIndex == 0,
          onTap: () => onTypeSelected(0),
        ),
        AccountTypeCard(
          icon: Icons.person_outline_rounded,
          title: accountTypes[1],
          description:
              'Share expertise and solve challenges to improve your skills!',
          selected: selectedIndex == 1,
          onTap: () => onTypeSelected(1),
        ),
        AccountTypeCard(
          icon: Icons.person_outline_rounded,
          title: accountTypes[2],
          description: 'Post Challenges.',
          selected: selectedIndex == 2,
          onTap: () => onTypeSelected(2),
        ),
      ],
    );
  }
}
