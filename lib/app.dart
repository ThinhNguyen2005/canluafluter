import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'features/weighing/presentation/screens/card_list_screen.dart';
import 'features/weighing/presentation/screens/card_detail_screen.dart';
import 'features/weighing/presentation/screens/weight_input_screen.dart';
import 'features/market/presentation/screens/market_screen.dart';
import 'features/news/presentation/screens/news_screen.dart';
import 'features/ai_chat/presentation/screens/ai_chat_screen.dart';
import 'features/dashboard/presentation/screens/dashboard_screen.dart';

// Key for root navigator to push screens above bottom navigation bar if needed
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class CanLuaApp extends ConsumerWidget {
  const CanLuaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      initialLocation: '/weighing',
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return NavigationShell(child: child);
          },
          routes: [
            GoRoute(
              path: '/weighing',
              builder: (context, state) => const CardListScreen(),
              routes: [
                GoRoute(
                  path: 'detail/:id',
                  parentNavigatorKey: _rootNavigatorKey, // Open details full screen (hides bottom bar)
                  builder: (context, state) {
                    final idStr = state.pathParameters['id'] ?? '';
                    final id = int.tryParse(idStr) ?? 0;
                    return CardDetailScreen(cardId: id);
                  },
                  routes: [
                    GoRoute(
                      path: 'weigh',
                      parentNavigatorKey: _rootNavigatorKey, // Open weigh full screen
                      builder: (context, state) {
                        final idStr = state.pathParameters['id'] ?? '';
                        final id = int.tryParse(idStr) ?? 0;
                        return WeightInputScreen(cardId: id);
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/market',
              builder: (context, state) => const MarketScreen(),
            ),
            GoRoute(
              path: '/news',
              builder: (context, state) => const NewsScreen(),
            ),
            GoRoute(
              path: '/ai-chat',
              builder: (context, state) => const AiChatScreen(),
            ),
            GoRoute(
              path: '/dashboard',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Cân Lúa',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationShell extends StatelessWidget {
  final Widget child;

  const NavigationShell({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/weighing')) return 0;
    if (location.startsWith('/market')) return 1;
    if (location.startsWith('/news')) return 2;
    if (location.startsWith('/ai-chat')) return 3;
    if (location.startsWith('/dashboard')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/weighing');
        break;
      case 1:
        context.go('/market');
        break;
      case 2:
        context.go('/news');
        break;
      case 3:
        context.go('/ai-chat');
        break;
      case 4:
        context.go('/dashboard');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(index, context),
        backgroundColor: AppColors.primaryDark,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grass_outlined),
            activeIcon: Icon(Icons.grass),
            label: 'Cân Lúa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart),
            label: 'Bảng Giá',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            activeIcon: Icon(Icons.newspaper),
            label: 'Tin Tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined),
            activeIcon: Icon(Icons.smart_toy),
            label: 'AI Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_outlined),
            activeIcon: Icon(Icons.assessment),
            label: 'Tổng Quan',
          ),
        ],
      ),
    );
  }
}
