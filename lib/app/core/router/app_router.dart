import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/core/di/app_injector.dart';
import 'package:synapsis/app/presentation/cubits/chat/chat_cubit.dart';
import 'package:synapsis/app/presentation/cubits/chat_new/chat_new_cubit.dart';
import 'package:synapsis/app/presentation/cubits/login/login_cubit.dart';
import 'package:synapsis/app/presentation/cubits/on_duty/on_duty_cubit.dart';
import 'package:synapsis/app/presentation/cubits/register_device/register_device_cubit.dart';
import 'package:synapsis/app/presentation/cubits/waiting_activation/waiting_activation_cubit.dart';
import 'package:synapsis/app/presentation/pages/chat_new_page/chat_new_page.dart';
import 'package:synapsis/app/presentation/pages/chat_page/chat_page.dart';
import 'package:synapsis/app/presentation/pages/login_page/login_page.dart';
import 'package:synapsis/app/presentation/pages/on_duty_page/on_duty_page.dart';
import 'package:synapsis/app/presentation/pages/register_device_page/register_device_page.dart';
import 'package:synapsis/app/presentation/pages/waiting_activation_page/waiting_activation_page.dart';
import 'package:synapsis/app/presentation/widgets/bottom_navigation.dart';
import 'package:synapsis/app/shared/base/b_dialog_page.dart';
import 'package:synapsis/app/shared/models/router_data/router_data.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

final appRouter = injector<AppRouter>();

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static RouterData registerDevice = RouterData(name: "Register Device", path: "/register-device");
  static RouterData waitingActivation = RouterData(name: "Waiting Activation", path: "/waiting-Activation");
  static RouterData login = RouterData(name: "Login", path: "/login");
  static RouterData onDuty = RouterData(name: "On Duty", path: "/on-duty");
  static RouterData chat = RouterData(name: "Chat", path: "/chat");
  static RouterData chatNew = RouterData(name: "Chat New", path: "/chat-new");
  static RouterData chart = RouterData(name: "Chart", path: "/chart");
  static RouterData settings = RouterData(name: "Settings", path: "/settings");

  final router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: registerDevice.path,
    routes: [
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        name: registerDevice.name,
        path: registerDevice.path,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => injector<RegisterDeviceCubit>()..onInitial(),
            child: RegisterDevicePage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        name: waitingActivation.name,
        path: waitingActivation.path,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => injector<WaitingActivationCubit>()..onInitial(state.extra as WaitingActivationArgs),
            child: WaitingActivationPage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        name: login.name,
        path: login.path,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => injector<LoginCubit>(),
            child: LoginPage(),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: appNavigatorKey,
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: settings.name,
                path: settings.path,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: Center(
                      child: Text(
                        "No Content",
                        style: ThemeTextStyle.custom(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeColor.xFFFFFF,
                        ),
                      ),
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: chart.name,
                path: chart.path,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: Center(
                      child: Text(
                        "No Content",
                        style: ThemeTextStyle.custom(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeColor.xFFFFFF,
                        ),
                      ),
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: chat.name,
                path: chat.path,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: BlocProvider(
                      create: (context) => injector<ChatCubit>(),
                      child: ChatPage(),
                    ),
                    state: state,
                  );
                },
              ),
              GoRoute(
                name: chatNew.name,
                path: chatNew.path,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return BDialogPage(
                    key: state.pageKey,
                    builder: (_) => BlocProvider(
                      create: (context) => injector<ChatNewCubit>(),
                      child: ChatNewPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: onDuty.name,
                path: onDuty.path,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: BlocProvider(
                      create: (context) => injector<OnDutyCubit>(),
                      child: OnDutyPage(),
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
          return getPage(
            child: BottomNavigation(child: navigationShell),
            state: state,
          );
        },
      ),
    ],
  );

  toRegisterDevice(BuildContext context) => context.goNamed(registerDevice.name);

  toWaitingActivation(BuildContext context, {required WaitingActivationArgs args}) => context.goNamed(waitingActivation.name, extra: args);

  toLogin(BuildContext context) => context.goNamed(login.name);

  toOnDuty(BuildContext context) => context.goNamed(onDuty.name);

  toCart(BuildContext context) => context.goNamed(chat.name);

  toNewCart(BuildContext context) => context.pushNamed(chatNew.name);
}

Page getPage({required Widget child, required GoRouterState state}) {
  return MaterialPage(key: state.pageKey, child: child);
}
