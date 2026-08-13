import 'package:challenge_lab_flutter/features/home/widgets/text_icon.dart';
import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key});

  final texto =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
      "nisi ut aliquip ex ea commodo consequat. "
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum "
      "dolore eu fugiat nulla pariatur. "
      "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui "
      "officia deserunt mollit anim id est laborum";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 10,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffE7E8E9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Data Science',
                      style: TextStyle(color: Color(0xff5D5E61), fontSize: 12),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffE6F4EA),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffCEEAD6), width: 2),
                    ),
                    child: Text(
                      'Beginner',
                      style: TextStyle(color: Color(0xff5D5E61), fontSize: 12),
                    ),
                  ),
                ],
              ),
              Icon(Icons.bookmark_outline_rounded),
            ],
          ),
          Column(
            children: [
              Text(
                'Optimize Urban Delivery Routes with AI',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                texto,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: TextIcon(
                      icon: Icons.timer_outlined,
                      text: "3 days left",
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: TextIcon(
                      icon: Icons.people_alt_outlined,
                      text: "Max 4",
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: Row(
                  children: [Text("View Details"), Icon(Icons.arrow_forward)],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
