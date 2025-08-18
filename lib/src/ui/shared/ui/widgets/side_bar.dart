import 'package:flutter/material.dart';
import 'package:nexunid/src/ui/shared/ui/buttons/buttons_menu.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: size.width * 0.17,
      height: size.height,
      color: colorScheme.background,
      child: Column(
        children: [
          // Header con logo y texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/tapas.png',
                  scale: 30,
                  color: colorScheme.primary,
                ),
                Text(
                  'Nexunid',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.015,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Línea divisoria
          Divider(
            color: colorScheme.primary.withOpacity(0.5),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ButtonsMenu(
            title: 'home',
            icon: Icons.home_rounded,
            onPressed: () {},
          ),
          ButtonsMenu(
            title: 'Profile',
            icon: Icons.person_rounded,
            onPressed: () {},
          ),
          Divider(
            color: colorScheme.primary.withOpacity(0.5),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                Text(
                  'ServersNews',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.012,
                  ),
                ),
                Row(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              height: size.height * 0.06,
              width: size.width,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.03,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'nick',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: size.width * 0.013,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        /*  Text(
                          'name',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: size.width * 0.01,
                          ),
                        ), */
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    padding: EdgeInsets.all(5),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 30,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.notification_add_rounded,
                      size: size.width * 0.015,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(5),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 30,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.message_rounded, size: size.width * 0.015),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(5),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 30,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings_rounded,
                      size: size.width * 0.015,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
