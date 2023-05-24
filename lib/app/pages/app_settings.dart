import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/provider/app_settings_provider.dart';
import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:flutter/material.dart';

/// A page for custom user settings. These include:
/// - App theme (dark mode or light mode)
class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  /// Get and display all app settings
  late Future<List<Setting?>>? settings;

  @override
  void initState() {
    settings = storage.getSetting({"app": true});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: settings,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            snapshot.data!.removeWhere((element) => element == null);
            return (snapshot.hasData)
                ? Scaffold(
                    appBar: CustomAppBar(),
                    body: Center(
                      child: Column(
                        children: [
                          const TextWidget(
                            text: "Settings",
                            fontSize: 60,
                          ),
                          //         DropdownButton(
                          //           items: [
                          //             DropdownMenuItem(
                          //               value: Themes.dark.name,
                          //               child: TextWidget(text: Themes.dark.name),
                          //             ),
                          //             DropdownMenuItem(
                          //               value: Themes.light.name,
                          //               child: TextWidget(text: Themes.light.name),
                          //             ),
                          //             DropdownMenuItem(
                          //               value: Themes.blue.name,
                          //               child: const TextWidget(text: "BLUE MODE!!!"),
                          //             ),
                          //           ],
                          //           onChanged: (value) {
                          //             if (value == "BLUE MODE!!!") {
                          //               value = Themes.blue.name;
                          //             }
                          //             appSettingsProvider
                          //                 .updateTheme(Themes.toTheme(value ?? ''));
                          //             setState(() {
                          //               theme = value ?? theme;
                          //             });
                          //           },
                          //           value: theme,
                          //           borderRadius:
                          //               const BorderRadius.all(Radius.elliptical(10, 10)),
                          //           hint: const TextWidget(text: "Theme"),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
                          for (Widget widget in generateSettingsWidgets(
                              snapshot.data!.cast<Setting>()))
                            widget
                        ],
                      ),
                    ))
                : (snapshot.hasError)
                    ? renderException(
                        context,
                        snapshot.error.toString(),
                        snapshot.stackTrace.toString(),
                      )
                    : const CircularProgressIndicator();
          } else {
            return Column(
              children: const [
                TextWidget(
                  text: "Settings",
                  fontSize: 60,
                ),
              ],
            );
          }
        });
  }
}
