import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/core/views/screens/account_screen.dart';
import 'package:habit_tracker/core/views/screens/app_appearance_screen.dart';
import 'package:habit_tracker/core/views/screens/auth_screen.dart';
import 'package:habit_tracker/core/views/screens/habit_creation_screen.dart';
import 'package:habit_tracker/core/views/screens/profile_screen.dart';
import 'package:habit_tracker/core/views/screens/root_screen.dart';
import 'package:habit_tracker/core/views/screens/sign_in_screen.dart';

class AppRouter {
  AppRouter();
  late final router = GoRouter(
    initialLocation: '/account',
    // redirect: (context, state) {
    //   bool isConnectedDevice = GetIt.instance
    //       .get<BluetoothManager>()
    //       .getConnectedDeviceName()
    //       .isNotEmpty;
    //   if (!isConnectedDevice && _isExercisePath(state.fullPath!)) {
    //     extra = state.fullPath!.replaceFirst('/', '');
    //     return '/${AppRouteNames.connection}';
    //   } else {
    //     //extra = null;
    //     return null;
    //   }
    // },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => RootScreen(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/auth',
                name: AppRouteNames.auth,
                builder: (context, state) => const AuthScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/createHabit',
                name: AppRouteNames.createHabit,
                builder: (context, state) => const HabitCreationScreen(),
              ),
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
      GoRoute(
        path: '/signIn',
        name: AppRouteNames.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      // // GoRoute(
      // //   path: '/reportExe/:index',
      // //   name: AppRouteNames.reportExe,
      // //   builder: (context, state) => ReportScreen(
      // //     index: (state.pathParameters['index'] == 'null')
      // //         ? null
      // //         : int.parse(state.pathParameters['index']!),
      // //   ),
      // // ),
    ],

    //errorBuilder: (context, state) => CustomErrorWidget(errorDetails: state.error.toString()),
  );
}
