import 'package:flutter/material.dart';
import 'package:get/get.dart';

void login(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final formKey = GlobalKey<FormState>();
  final colorScheme = Theme.of(context).colorScheme;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 20, color: colorScheme.primary),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      filled: true,
      fillColor: colorScheme.surface.withOpacity(0.8),
      labelStyle: TextStyle(color: colorScheme.onSurface),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      bool obscurePassword = true;

      return Dialog(
        backgroundColor: Colors.transparent,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: size.width * 0.9,
              height: size.height * 0.7,
              decoration: BoxDecoration(
                color: colorScheme.background,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: colorScheme.primary.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.2),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // ======================
                  // Formulario
                  // ======================
                  Container(
                    width: size.width * 0.54,
                    padding: EdgeInsets.all(32),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'login'.tr,
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 32),

                          // Email
                          TextFormField(
                            controller: emailController,
                            decoration: buildInputDecoration(
                              'email'.tr,
                              Icons.email_outlined,
                            ),
                            style: TextStyle(color: colorScheme.onSurface),
                            validator: (value) {
                              if (value?.trim().isEmpty == true) {
                                return 'El correo es obligatorio';
                              }
                              if (!GetUtils.isEmail(value ?? '')) {
                                return 'Correo no válido';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),

                          // Password con ver botón
                          TextFormField(
                            controller: passwordController,
                            obscureText: obscurePassword,
                            style: TextStyle(color: colorScheme.onSurface),
                            decoration:
                                buildInputDecoration(
                                  'password'.tr,
                                  Icons.lock_outline,
                                ).copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: colorScheme.primary,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                            validator: (value) => value?.isEmpty == true
                                ? 'La contraseña es obligatoria'
                                : null,
                          ),

                          SizedBox(height: 32),

                          // Botón Login
                          Center(
                            child: SizedBox(
                              width: size.width * 0.2,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    // authController.login(
                                    //   emailController.text.trim(),
                                    //   passwordController.text.trim(),
                                    // );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'confirm'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          // Back Button
                          Center(
                            child: TextButton(
                              onPressed: () => Get.back(),
                              style: TextButton.styleFrom(
                                foregroundColor: colorScheme.primary,
                              ),
                              child: Text(
                                'recover password'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ======================
                  // Lado derecho con logo
                  // ======================
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colorScheme.primary.withOpacity(0.1),
                            colorScheme.primary.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorScheme.primary.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                            child: Image.asset(
                              'assets/img/tapas.png',
                              scale: 5,
                              color: colorScheme.primary,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Nexunid',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: size.width * 0.08,
                              letterSpacing: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
