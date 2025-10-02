import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/core/views/screens/account_screen.dart';
import 'package:habit_tracker/core/views/screens/app_appearance_screen.dart';
import 'package:habit_tracker/core/views/screens/auth_screen.dart';
import 'package:habit_tracker/core/views/screens/habit_edit_screen.dart';
import 'package:habit_tracker/core/views/screens/home_screen.dart';
import 'package:habit_tracker/core/views/screens/profile_screen.dart';
import 'package:habit_tracker/core/views/screens/root_screen.dart';
import 'package:habit_tracker/core/views/screens/sign_in_screen.dart';
import 'package:habit_tracker/core/views/screens/sign_up_screen.dart';

final router = GoRouter(
  initialLocation: '/home',
  redirect: (_, state) async {
    if (state.fullPath!.contains('/auth')) {
      return null;
    }
    bool isAuthenticated = FirebaseAuth.instance.currentUser != null;

    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     isAuthenticated = false;
    //   } else {
    //     isAuthenticated = true;
    //   }
    // });

    if (!isAuthenticated) return '/auth';
    return null;
  },
  routes: [
    GoRoute(
        path: '/auth',
        name: AppRouteNames.auth,
        builder: (context, state) => const AuthScreen(),
        routes: [
          GoRoute(
            path: '/signIn',
            name: AppRouteNames.signIn,
            builder: (context, state) => const SignInScreen(),
          ),
          GoRoute(
            path: '/signUp',
            name: AppRouteNames.signUp,
            builder: (context, state) => const SignUpScreen(),
          ),
        ]),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => RootScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/home',
                name: AppRouteNames.home,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: '/editHabit/:name',
                    name: AppRouteNames.editHabit,
                    builder: (context, state) => HabitCreationScreen(
                      name: state.pathParameters['name'] ?? '',
                    ),
                  ),
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/account',
              name: AppRouteNames.account,
              builder: (context, state) => const AccountScreen(),
              routes: [
                GoRoute(
                  path: '/profile',
                  name: AppRouteNames.profile,
                  builder: (context, state) => const ProfileScreen(),
                ),
                GoRoute(
                  path: '/settings',
                  name: AppRouteNames.settings,
                  builder: (context, state) => const AppAppearanceScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
