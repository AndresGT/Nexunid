import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexunid/src/core/controllers/language_controller.dart';
import 'package:nexunid/src/core/controllers/theme_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorScheme.background, colorScheme.surface],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -100,
              top: -100,
              child: Container(
                width: size.width * 0.6,
                height: size.height * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primary.withOpacity(0.05),
                ),
              ),
            ),
            Positioned(
              left: -70,
              bottom: -70,
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primary.withOpacity(0.05),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: 20,
              ),
              child: Column(
                children: [
                  // Control del lenguage y tema
                  Obx(() {
                    final themeController = Get.find<ThemeController>();
                    final languageController = Get.find<LanguageController>();
                    final isEnglish =
                        languageController.currentLocale.value.languageCode ==
                        'en';

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Cambio de tema
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(0.1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.shadow.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              themeController.isDarkMode.value
                                  ? Icons.nightlight_round
                                  : Icons.wb_sunny,
                              color: colorScheme.primary,
                            ),
                            onPressed: themeController.toggleTheme,
                          ),
                        ),

                        SizedBox(width: 16),

                        // Selector de idioma
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(0.1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.shadow.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              _buildLanguageButton(
                                'US',
                                isEnglish,
                                () => languageController.changeLanguage(
                                  'en',
                                  'US',
                                ),
                                colorScheme,
                                true,
                              ),
                              _buildLanguageButton(
                                'ES',
                                !isEnglish,
                                () => languageController.changeLanguage(
                                  'es',
                                  'ES',
                                ),
                                colorScheme,
                                false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                  Expanded(
                    child: Center(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: colorScheme.primary.withOpacity(0.2),
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                'assets/img/tapas.png',
                                scale: 6,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            SizedBox(height: 24),

                            Text(
                              'welcome'.tr,
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontSize: size.width * 0.02,
                                letterSpacing: 4,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 3),

                            Text(
                              'Nexunid',
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontSize: size.width * 0.1,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 28),
                            // Login Button
                            SizedBox(
                              width: 200,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'login'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            TextButton(
                              onPressed: () => Get.toNamed('/register'),
                              style: TextButton.styleFrom(
                                foregroundColor: colorScheme.primary,
                              ),
                              child: Text(
                                'register_prompt'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLanguageButton(
  String text,
  bool isSelected,
  VoidCallback onTap,
  ColorScheme colorScheme,
  bool isLeft,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.horizontal(
          left: isLeft ? Radius.circular(12) : Radius.zero,
          right: !isLeft ? Radius.circular(12) : Radius.zero,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}
