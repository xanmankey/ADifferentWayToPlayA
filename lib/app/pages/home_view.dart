import 'dart:io';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/card_selector.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';

/// The current structure of the Home Screen;
/// shaped like the 4 buttons on an xbox controller.
/// Does not contain any variation, but can be adapted if desired
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // ALL of these will be layed out as the BUTTONS ON A CONTROLLER
        // Programs (Y button)
        const TextWidget(
          text: "A Different Way to Play",
          fontSize: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(
              text: "Brought to you by ofGameImportance",
              fontFamily: "ComicSans",
              fontSize: 20,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/logo.png'),
            ),
          ],
        ),
        Center(
          child: SizedBox(
            height: 100,
            width: 350,
            child: CardSelector(
              image: FileImage(File("assets/images/custom_game.png")),
              title: "Programs",
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: 5,
              onTap: () {
                Navigator.pushNamed(context, "/programs");
              },
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0)),
        Row(
          children: [
            SizedBox(
              height: 100,
              child: CardSelector(
                image: FileImage(File("assets/images/characters.png")),
                title: "Characters",
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: 5,
                onTap: () => Navigator.pushNamed(context, '/characters'),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60)),
            // Start and Select buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                foregroundColor: Colors.black,
                surfaceTintColor: Colors.white,
              ),
              child: const TextWidget(
                text: "Gamemodes",
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, '/gamemodes'),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60)),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, 'settings'),
              icon: const Icon(Icons.arrow_right_rounded),
            ),
            SizedBox(
              height: 100,
              child: CardSelector(
                image: FileImage(File("assets/images/teams.png")),
                title: "Teams",
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: 50,
                onTap: () => Navigator.pushNamed(context, '/teams'),
              ),
            ),
          ],
        ),
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0)),
        Center(
          child: SizedBox(
            height: 100,
            width: 350,
            child: CardSelector(
              image: FileImage(File("assets/images/tournament.png")),
              title: "Play",
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: 50,
              onTap: () => Navigator.pushNamed(context, '/play'),
            ),
          ),
        ),
      ]),
    );
  }
}
