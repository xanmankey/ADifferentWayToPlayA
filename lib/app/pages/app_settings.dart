import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/provider/app_settings_provider.dart';
import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

/// A page for custom user settings. These include:
/// - App theme (dark mode or light mode)
class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Column(
            children: [
              const TextWidget(
                text: "Settings",
                fontSize: 60,
              ),
              for (Widget widget in generateSettingsWidgets(storage
                  .isarDB.settings
                  .where()
                  .appEqualTo(true)
                  .findAllSync()))
                widget
            ],
          ),
        ));
  }
}
