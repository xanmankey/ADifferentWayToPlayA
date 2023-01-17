import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Gamemode extends StatefulWidget {
  const Gamemode({super.key});

  @override
  State<Gamemode> createState() => _GamemodeState();
}

class _GamemodeState extends State<Gamemode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(),
    );
  }
}
