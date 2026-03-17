import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoicing_business_management/core/constants/constants/assets.dart';
import 'package:invoicing_business_management/features/dashboard/presentation/page/home_screen.dart';
import 'package:invoicing_business_management/features/dashboard/presentation/page/settings_screen.dart';
import 'package:invoicing_business_management/shared/styles/app_colors.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import 'contacts_screen.dart';
import 'invoice_screen.dart';
import 'more_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<({String icon, String label})> _tabs = [
    (icon: DashboardAssets.dashboardIcon, label: 'Dashboard'),
    (icon: DashboardAssets.contactIcon, label: 'Contact'),
    (icon: DashboardAssets.invoiceIcon, label: 'Invoice'),
    (icon: DashboardAssets.moreIcon, label: 'More'),
    (icon: DashboardAssets.settingsIcon, label: 'Settings'),
  ];

  final List<Widget> _screens = const [
    HomeScreen(),
    ContactsScreen(),
    InvoiceScreen(),
    MoreScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white.withValues(alpha: 0.95),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPadding + 14),
        child: LiquidGlass.withOwnLayer(
          glassContainsChild: false,
          settings: const LiquidGlassSettings(
            thickness: 18,
            blur: 40,
            lightIntensity: 35,
            chromaticAberration: 1.2,
            glassColor: Colors.transparent,
          ),
          shape: LiquidRoundedSuperellipse(
            borderRadius: 40.r,
          ),
          child: Container(
            height: 72,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_tabs.length, (index) {
                final tab = _tabs[index];
                final isSelected = _currentIndex == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      setState(() => _currentIndex = index);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      padding: EdgeInsets.symmetric(
                        horizontal: isSelected ? 14 : 10,
                        vertical: 6,
                      ),
                      decoration: isSelected
                          ? BoxDecoration(
                        color: AppColors.bgSurface.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(80.r),
                      )
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedScale(
                            scale: isSelected ? 1.15 : 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            child: Image.asset(
                              tab.icon,
                              width: 20,
                              height: 20,
                              color: isSelected
                                  ? const Color(0xFF007AFF)
                                  : const Color(0xFF8E8E93),
                            ),
                          ),
                          const SizedBox(height: 2),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? const Color(0xFF007AFF)
                                  : const Color(0xFF8E8E93),
                              letterSpacing: -0.2,
                            ),
                            child: Text(tab.label),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}