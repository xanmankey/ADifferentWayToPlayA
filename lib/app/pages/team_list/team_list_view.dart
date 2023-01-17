import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TeamList extends StatefulWidget {
  const TeamList({super.key});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(),
    );
  }
}
