import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/features/auth/presentation/auth_screen.dart';
import 'package:habit_tracker/features/habit_creation/presentation/habit_creation_screen.dart';
import 'package:habit_tracker/features/sign_in/presentation/sign_in_screen.dart';

class AppRouter {
  AppRouter();
  late final router = GoRouter(
    initialLocation: '/createHabit',
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
      GoRoute(
        path: '/auth',
        name: AppRouteNames.auth,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRouteNames.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/createHabit',
        name: AppRouteNames.createHabit,
        builder: (context, state) => const HabitCreationScreen(),
      ),
      // GoRoute(
      //   path: '/reportExe/:index',
      //   name: AppRouteNames.reportExe,
      //   builder: (context, state) => ReportScreen(
      //     index: (state.pathParameters['index'] == 'null')
      //         ? null
      //         : int.parse(state.pathParameters['index']!),
      //   ),
      // ),
    ],

    //errorBuilder: (context, state) => CustomErrorWidget(errorDetails: state.error.toString()),
  );
}
