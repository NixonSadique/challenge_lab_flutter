import 'package:flutter/material.dart';

class HomeFilterSection extends StatelessWidget {
  final List<dynamic> filters;
  final VoidCallback onFilterPressed;

  const HomeFilterSection({
    super.key,
    required this.filters,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: onFilterPressed,
          child: const Row(
            children: [Icon(Icons.tune_rounded), Text("Filters")],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, i) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xff007070),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Text(
                    "$i: ${filters[i]}",
                    style: const TextStyle(color: Color(0xff9CF0EF)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
