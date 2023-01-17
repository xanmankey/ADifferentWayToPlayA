// A custom scaffold for reusability
// Also comes with an appBar
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  // super. just means to get it from the parent class;
  // in this case, that means get the key from the StatelessWidget class
  // which is an issue
  const CustomAppBar({
    Key? key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    String? route = Navigator.defaultRouteName;
    return AppBar(
      key: key,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        icon: const Icon(Icons.house),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
