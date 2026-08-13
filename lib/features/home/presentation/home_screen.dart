import 'package:flutter/material.dart';

import '../widgets/challenge_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final values = ["Difficulty", "Category", "Max Allowed"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined,),
            label: "Feed"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined,),
            label: "Groups"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded,),
            label: "Profile"
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 1,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffbdc9c8), width: 2),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Challenge Lab",
              style: TextStyle(
                color: Color(0xff005656),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xffFFDFA0),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "@username",
                style: TextStyle(
                  color: Color(0xff261A00),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [Icon(Icons.tune_rounded), Text("Filters")],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: values.length,
                    itemBuilder: (context, i) {
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff007070),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Text(
                          "$i: ${values[i]}",
                          style: TextStyle(color: Color(0xff9CF0EF)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          ChallengeCard(),
          ChallengeCard(),
        ],
      ),
    );
  }
}
