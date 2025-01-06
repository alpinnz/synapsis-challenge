import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/core/di/app_injector.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/features/main/presentation/cubits/chat/chat_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/chat_new/chat_new_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/login/login_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/on_duty/on_duty_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/register_device/register_device_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/waiting_activation/waiting_activation_cubit.dart';
import 'package:synapsis/app/features/main/presentation/pages/chat_new_page/chat_new_page.dart';
import 'package:synapsis/app/features/main/presentation/pages/chat_page/chat_page.dart';
import 'package:synapsis/app/features/main/presentation/pages/login_page/login_page.dart';
import 'package:synapsis/app/features/main/presentation/pages/on_duty_page/on_duty_page.dart';
import 'package:synapsis/app/features/main/presentation/pages/register_device_page/register_device_page.dart';
import 'package:synapsis/app/features/main/presentation/pages/waiting_activation_page/waiting_activation_page.dart';
import 'package:synapsis/app/features/main/presentation/widgets/bottom_navigation.dart';
import 'package:synapsis/app/shared/base/b_dialog_page.dart';
import 'package:synapsis/app/shared/models/router_data/router_data.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

class MainRouter implements Router {
  static RouterData registerDevice = RouterData(name: "Register Device", path: "/register-device");
  static RouterData waitingActivationPage = RouterData(name: "Waiting Activation", path: "/waiting-activation");
  static RouterData login = RouterData(name: "Login", path: "/login");
  static RouterData onDuty = RouterData(name: "On Duty", path: "/on-duty");
  static RouterData chat = RouterData(name: "Chat", path: "/chat");
  static RouterData chatNew = RouterData(name: "Chat New", path: "/chat-new");
  static RouterData chart = RouterData(name: "Chart", path: "/chart");
  static RouterData settings = RouterData(name: "Settings", path: "/settings");

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
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
        parentNavigatorKey: parentNavigatorKey,
        name: waitingActivationPage.name,
        path: waitingActivationPage.path,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => injector<WaitingActivationCubit>()..onInitial(),
            child: WaitingActivationPage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
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
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            // navigatorKey: settingsNavigatorKey,
            routes: [
              GoRoute(
                // parentNavigatorKey: settingsNavigatorKey,
                name: settings.name,
                path: settings.path,
                pageBuilder: (context, GoRouterState state) {
                  return AppRouter.getPage(
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
            // navigatorKey: chartNavigatorKey,
            routes: [
              GoRoute(
                // parentNavigatorKey: chartNavigatorKey,
                name: chart.name,
                path: chart.path,
                pageBuilder: (context, GoRouterState state) {
                  return AppRouter.getPage(
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
            // navigatorKey: chartNavigatorKey,
            routes: [
              GoRoute(
                // parentNavigatorKey: chartNavigatorKey,
                name: chat.name,
                path: chat.path,
                pageBuilder: (context, GoRouterState state) {
                  return AppRouter.getPage(
                    child: BlocProvider(
                      create: (context) => injector<ChatCubit>(),
                      child: ChatPage(),
                    ),
                    state: state,
                  );
                },
              ),
              GoRoute(
                // parentNavigatorKey: parentNavigatorKey,
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
            // navigatorKey: onDutyNavigatorKey,
            routes: [
              GoRoute(
                // parentNavigatorKey: onDutyNavigatorKey,
                name: onDuty.name,
                path: onDuty.path,
                pageBuilder: (context, GoRouterState state) {
                  return AppRouter.getPage(
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
          return AppRouter.getPage(
            child: BottomNavigation(child: navigationShell),
            state: state,
          );
        },
      ),
    ];
  }

  static toRegisterDevice(BuildContext context) => context.goNamed(registerDevice.name);

  static toWaitingActivation(BuildContext context) => context.goNamed(waitingActivationPage.name);

  static toLogin(BuildContext context) => context.goNamed(login.name);

  static toOnDuty(BuildContext context) => context.goNamed(onDuty.name);

  static toCart(BuildContext context) => context.goNamed(chat.name);

  static toNewCart(BuildContext context) => context.pushNamed(chatNew.name);
}
