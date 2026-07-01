import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../utils/snackbar_helper.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/gradient_background.dart';
import '../../widgets/primary_button.dart';
import '../dummy/partner_dummy_data.dart';
import '../../core/app_routes.dart';
import '../partner_scope.dart';

class PartnerLoginScreen extends StatefulWidget {
  const PartnerLoginScreen({super.key});

  @override
  State<PartnerLoginScreen> createState() => _PartnerLoginScreenState();
}

class _PartnerLoginScreenState extends State<PartnerLoginScreen>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  late final AnimationController _animController;
  late final Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _animController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin(Future<bool> Function() action) async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 350));
    if (!mounted) return;

    final success = await action();
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (success) {
      SnackbarHelper.show(context, 'Login mitra berhasil');
      Navigator.of(context).pushReplacementNamed(AppRoutes.partnerMain);
    } else {
      SnackbarHelper.show(context, 'Username atau password salah');
    }
  }

  @override
  Widget build(BuildContext context) {
    final partner = PartnerScope.read(context);

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeIn,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.two_wheeler_rounded,
                              size: 16,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Mode Mitra',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const AppLogo(),
                  const SizedBox(height: 32),
                  Text(
                    'Login Mitra Driver',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Username: ${PartnerDummyData.demoUsername} | Password: ${PartnerDummyData.demoPassword}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.subtext,
                        ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(
                            () => _isPasswordVisible = !_isPasswordVisible,
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      text: _isLoading ? 'Sedang masuk...' : 'Login',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: _isLoading
                          ? null
                          : () => _handleLogin(() async {
                                return partner.login(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                );
                              }),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[300])),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'atau',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[300])),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _isLoading
                          ? null
                          : () => _handleLogin(() async {
                                return partner.loginWithGoogle();
                              }),
                      icon: const Icon(Icons.g_mobiledata_rounded, size: 28),
                      label: const Text('Masuk dengan Google'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
