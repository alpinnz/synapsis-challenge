import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:synapsis/app/core/di/app_injector.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/presentation/cubits/app/app_cubit.dart';
import 'package:synapsis/app/presentation/cubits/chat/chat_cubit.dart';
import 'package:synapsis/app/shared/base/b_toast.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return ScreenUtilInit(
      designSize: const Size(1366, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => injector<AppCubit>(),
          child: BlocProvider(
            create: (context) => injector<ChatCubit>()..onInitial(equipmentId: context.read<AppCubit>().state.device.data?.equipment?.id ?? ""),
            child: MaterialApp.router(
              routerConfig: appRouter.router,
              builder: (context, child) =>
                  BToastScope(
                    child: child ?? const SizedBox(),
                  ),
            ),
          ),
        );
      },
    );
  }
}
