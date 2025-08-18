import 'dart:ui';
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
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.secondary.withOpacity(0.05),
              colorScheme.surface,
            ],
          ),
        ),
        child: Stack(
          children: [
            // --- Background decoration circles ---
            Positioned(
              right: -100,
              top: -100,
              child: _buildCircle(size.width * 0.6, colorScheme.primary),
            ),
            Positioned(
              left: -70,
              bottom: -70,
              child: _buildCircle(size.width * 0.5, colorScheme.secondary),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
                vertical: 20,
              ),
              child: Column(
                children: [
                  // --- Top bar: Theme & Language ---
                  Obx(() {
                    final themeController = Get.find<ThemeController>();
                    final languageController = Get.find<LanguageController>();
                    final isEnglish =
                        languageController.currentLocale.value.languageCode ==
                        'en';

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _glassBox(
                          colorScheme,
                          IconButton(
                            icon: Icon(
                              themeController.isDarkMode.value
                                  ? Icons.nightlight_round
                                  : Icons.wb_sunny,
                              color: colorScheme.primary,
                            ),
                            onPressed: themeController.toggleTheme,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _glassBox(
                          colorScheme,
                          Row(
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

                  // --- Main content ---
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: 'app_logo',
                                child: Container(
                                  padding: const EdgeInsets.all(40),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: colorScheme.primary.withOpacity(
                                        0.2,
                                      ),
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/img/tapas.png',
                                    scale: 5,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),

                              Text(
                                'welcome'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),

                              Text(
                                'Una identidad, infinitas conexiones.',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: colorScheme.onSurface.withOpacity(
                                        0.8,
                                      ),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(height: 36),

                              // --- Login button ---
                              SizedBox(
                                width: 220,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () => Get.toNamed('/login'),
                                  child: Text(
                                    'login'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // --- Register ---
                              TextButton(
                                onPressed: () => Get.toNamed('/register'),
                                child: Text(
                                  'register_prompt'.tr,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // --- Footer ---
                              Text(
                                '© 2025 Nexunid · Powered by Flutter & Go',
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: colorScheme.onSurface.withOpacity(
                                        0.6,
                                      ),
                                    ),
                              ),
                            ],
                          ),
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

  // --- Helper widgets ---

  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.05),
      ),
    );
  }

  Widget _glassBox(ColorScheme colorScheme, Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface.withOpacity(0.7),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: colorScheme.primary.withOpacity(0.15)),
          ),
          child: child,
        ),
      ),
    );
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            left: isLeft ? const Radius.circular(12) : Radius.zero,
            right: !isLeft ? const Radius.circular(12) : Radius.zero,
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
}
