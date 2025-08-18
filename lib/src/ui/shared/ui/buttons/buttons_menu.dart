import 'package:flutter/material.dart';

class ButtonsMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const ButtonsMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: colorScheme.primary, size: size.width * 0.015),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: size.width * 0.012,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
