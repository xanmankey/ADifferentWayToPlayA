import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Program extends StatefulWidget {
  const Program({super.key});

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(),
    );
  }
}
