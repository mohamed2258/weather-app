import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti/core/theme/theme_cubit.dart';
import '../../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white54 : Colors.black54;
    final cardColor = isDark ? AppColors.secondaryNavy : Colors.white;
    final primaryIconColor = isDark
        ? AppColors.accentCyan
        : Colors.blue.shade700;
    final dividerColor = isDark ? Colors.white12 : Colors.grey.shade300;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryIconColor, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: isDark
                          ? AppColors.secondaryNavy
                          : Colors.blue.shade50,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: isDark ? Colors.white : Colors.blueGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Mohamed',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'mohamed@example.com',
                    style: TextStyle(fontSize: 16, color: subTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isDark
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
              ),
              child: Column(
                children: [
                  BlocBuilder<ThemeCubit, ThemeMode>(
                    builder: (context, themeMode) {
                      final isDarkModeActive = themeMode == ThemeMode.dark;
                      return _ProfileTile(
                        icon: Icons.dark_mode,
                        title: 'Dark Mode',
                        iconColor: primaryIconColor,
                        textColor: textColor,
                        trailing: Switch(
                          value: isDarkModeActive,
                          activeColor: primaryIconColor,
                          onChanged: (value) {
                            context.read<ThemeCubit>().toggleTheme(value);
                          },
                        ),
                      );
                    },
                  ),
                  Divider(color: dividerColor, height: 1),
                  _ProfileTile(
                    icon: Icons.favorite,
                    title: 'Favorite Cities',
                    iconColor: primaryIconColor,
                    textColor: textColor,
                    onTap: () {},
                  ),
                  Divider(color: dividerColor, height: 1),
                  _ProfileTile(
                    icon: Icons.language,
                    title: 'Language (EN/AR)',
                    iconColor: primaryIconColor,
                    textColor: textColor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isDark
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
              ),
              child: _ProfileTile(
                icon: Icons.logout,
                title: 'Logout',
                iconColor: Colors.redAccent,
                textColor: Colors.redAccent,
                trailing: const SizedBox(),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color textColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.textColor,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final arrowColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white54
        : Colors.black38;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing:
          trailing ??
          Icon(Icons.arrow_forward_ios, color: arrowColor, size: 16),
      onTap: onTap,
    );
  }
}
