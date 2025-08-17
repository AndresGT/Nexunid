import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:nexunid/src/core/controllers/auth_controller.dart';

class AuthRegisterView extends StatefulWidget {
  const AuthRegisterView({super.key});

  @override
  State<AuthRegisterView> createState() => _AuthRegisterViewState();
}

class _AuthRegisterViewState extends State<AuthRegisterView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  //final AuthController authController = Get.put(AuthController());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final nickController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    nameController.dispose();
    emailController.dispose();
    nickController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration(
    String label,
    IconData icon, {
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 20),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.8),
      prefixIconColor: Theme.of(context).colorScheme.primary,
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }

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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
            vertical: size.height * 0.03,
          ),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Section
                Expanded(
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
                          fontSize: size.width * 0.07,
                          letterSpacing: 4,
                        ),
                      ),
                    ],
                  ),
                ),

                // Form Section
                Container(
                  width: size.width * 0.58,
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: colorScheme.primary.withOpacity(0.1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'register'.tr,
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),

                        // Form Fields
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: colorScheme.onSurface),
                          decoration: _buildInputDecoration(
                            'name'.tr,
                            Icons.person_outline,
                          ),
                          validator: (value) => value?.trim().isEmpty == true
                              ? 'El nombre es obligatorio'
                              : null,
                        ),
                        SizedBox(height: 15),

                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: colorScheme.onSurface),
                          decoration: _buildInputDecoration(
                            'email'.tr,
                            Icons.email_outlined,
                          ),
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
                        SizedBox(height: 15),

                        TextFormField(
                          controller: nickController,
                          style: TextStyle(color: colorScheme.onSurface),
                          decoration: _buildInputDecoration(
                            'nick'.tr,
                            Icons.alternate_email,
                          ),
                          validator: (value) => value?.trim().isEmpty == true
                              ? 'El nickname es obligatorio'
                              : null,
                        ),
                        SizedBox(height: 15),

                        // Password
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: colorScheme.onSurface),
                          decoration: _buildInputDecoration(
                            'password'.tr,
                            Icons.lock_outline,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'La contraseña es obligatoria';
                            }
                            if (value!.length < 6) {
                              return 'Debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),

                        // Confirm Password
                        TextFormField(
                          controller: confirmPasswordController,
                          style: TextStyle(color: colorScheme.onSurface),
                          decoration: _buildInputDecoration(
                            'confirmPassword'.tr,
                            Icons.lock_outline,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureConfirmPassword,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Confirma tu contraseña';
                            }
                            if (value != passwordController.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),

                        // Register Button
                        Center(
                          child: SizedBox(
                            width: size.width * 0.2,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                /* if (_formKey.currentState?.validate() ?? false) {
                                  authController.register(
                                    nameController.text.trim(),
                                    emailController.text.trim(),
                                    nickController.text.trim(),
                                    passwordController.text,
                                  );
                                } */
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: Text(
                                'confirm'.tr,
                                style: TextStyle(
                                  fontSize: 15,
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
                              'return to the beginning'.tr,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
