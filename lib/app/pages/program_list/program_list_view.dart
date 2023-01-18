import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/program/program_entry.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class ProgramList extends StatefulWidget {
  const ProgramList({super.key});

  @override
  State<ProgramList> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
  late List<Program> programs;
  Storage storage = Storage();
  @override
  void initState() async {
    programs = await storage.getProgramList([
      {"abbreviation": Sort.asc}
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
        children: [
          for (Program program in programs) ProgramEntry(program: program)
        ],
      ),
    );
  }
}
