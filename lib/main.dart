import 'package:adifferentwaytoplay/app/pages/data_page_view.dart';
import 'package:adifferentwaytoplay/app/pages/input_results_view.dart';
import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/utils/exposed_types.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

// Package imports
import 'package:adifferentwaytoplay/app/pages/home_view.dart';
import 'package:adifferentwaytoplay/app/pages/DWTP_view.dart';
import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/pages/victory_view.dart';
import 'package:xinput_gamepad/xinput_gamepad.dart';

// Import utilites
// import 'package:adifferentwaytoplay/utilities/vars.dart';
// import 'package:adifferentwaytoplay/utilities/settings.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final RouteObserver<ModalRoute<void>> routeObserver =
//     RouteObserver<ModalRoute<void>>();

Future<void> enableFullScreen() async {
  // Initialize
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // Use it only after calling `hiddenWindowAtLaunch`
  // TODO: I probably want to add resizing constraints AFTER the FULL GUI IS MADE
  WindowOptions windowOptions = const WindowOptions(
    backgroundColor: Colors.white,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.maximize();
  });
  return;
}

void initializeLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    dynamic e = record.error;
    String m = e.toString();
    print(
        '${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
  });
  Logger.root.info("Logger initialized.");
}

void main() async {
  Storage();
  initializeLogging();
  XInputManager.enableXInput();
  // Link the app to the class providing state
  runApp(ChangeNotifierProvider<DWTPProvider>(
    create: (_) => DWTPProvider(),
    child: const DWTP(),
  ));
  await enableFullScreen();
}

class DWTP extends StatelessWidget {
  // the apps in terms of routing (e.g. passing args)
  const DWTP({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorObservers: <RouteObserver<ModalRoute<void>>>[routeObserver],
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      initialRoute: Pages.home,
      routes: {
        Pages.home: (context) => const Home(),
        Pages.exception: (context) => ExceptionPage(
              error: (ModalRoute.of(context)!.settings.arguments!
                  as Map<String, String>)["error"]!,
              stacktrace: (ModalRoute.of(context)!.settings.arguments!
                  as Map<String, String?>)["stacktrace"]!,
            ),
        Pages.programs: (context) => DWTPListView(
              exposedDataTypes: const DataTypes.programType(),
            ),
        Pages.characters: (context) => DWTPListView(
              exposedDataTypes: const DataTypes.characterType(),
            ),
        Pages.teams: (context) => DWTPListView(
              exposedDataTypes: const DataTypes.teamType(),
            ),
        Pages.gamemodes: (context) => DWTPListView(
              exposedDataTypes: const DataTypes.gamemodeType(),
            ),
        Pages.dwtp: (context) => const DWTP(),
        Pages.resultsInput: (context) => const ResultsInputView(),
        Pages.victory: (context) => const Victory(),
      },
    );
  }
}

/*
// TESTING AREA
import 'package:flutter/material.dart';

void main() => runApp(const PageViewExampleApp());

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('PageView Sample')),
        body: const PageViewExample(),
      ),
    );
  }
}

class PageViewExample extends StatelessWidget {
  const PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView.builder(

        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,
        itemBuilder: (context, index) {
          return Text("$index page!");
        });
  }
}
*/