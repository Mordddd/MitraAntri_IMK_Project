import 'package:flutter/material.dart';

import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../services/auth_service.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/app_logo.dart';
import '../widgets/app_motion.dart';
import '../widgets/gradient_background.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin(AuthResult Function() action) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    await Future.delayed(const Duration(milliseconds: 350));
    if (!mounted) return;

    final result = action();
    setState(() => _isLoading = false);

    if (result.success) {
      AppScope.read(context).enterCustomerMode();
      SnackbarHelper.show(context, 'Login berhasil');
      Navigator.of(context).pushReplacementNamed(AppRoutes.main);
    } else {
      final message = result.message ?? 'Login gagal';
      setState(() => _errorMessage = message);
      SnackbarHelper.show(context, message);
    }
  }

  void _loginWithCredentials() {
    _handleLogin(
      () => AuthService.login(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FadeSlideIn(
                        child: AppLogo(compact: true, center: false),
                      ),
                      const SizedBox(height: 36),
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat datang kembali',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Masuk untuk mengelola antrean dan pesanan Anda.',
                              style: TextStyle(
                                color: AppColors.subtext,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      const _FormLabel('Username'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _usernameController,
                        autofillHints: const [AutofillHints.username],
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Masukkan username',
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const _FormLabel('Password'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        autofillHints: const [AutofillHints.password],
                        textInputAction: TextInputAction.done,
                        onSubmitted:
                            _isLoading ? null : (_) => _loginWithCredentials(),
                        decoration: InputDecoration(
                          hintText: 'Masukkan password',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(
                            tooltip: _isPasswordVisible
                                ? 'Sembunyikan password'
                                : 'Tampilkan password',
                            onPressed: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            ),
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 180),
                        child: _errorMessage == null
                            ? const SizedBox.shrink()
                            : Padding(
                                key: ValueKey(_errorMessage),
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  _errorMessage!,
                                  style: const TextStyle(
                                    color: AppColors.danger,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 22),
                      PrimaryButton(
                        text: _isLoading ? 'Memproses...' : 'Masuk',
                        onPressed: _isLoading ? null : _loginWithCredentials,
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'atau',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _isLoading
                              ? null
                              : () => _handleLogin(AuthService.loginWithGoogle),
                          icon:
                              const Icon(Icons.g_mobiledata_rounded, size: 26),
                          label: const Text('Masuk dengan Google'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: _isLoading
                              ? null
                              : () {
                                  AppScope.read(context).enterPartnerMode();
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.partnerLogin,
                                  );
                                },
                          icon: const Icon(Icons.two_wheeler_rounded),
                          label: const Text('Masuk sebagai Mitra'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Akun demo: user / 123456',
                          style: TextStyle(
                            color: AppColors.subtext,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  const _FormLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    );
  }
}
