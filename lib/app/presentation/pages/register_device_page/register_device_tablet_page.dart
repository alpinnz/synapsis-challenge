import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/presentation/cubits/register_device/register_device_cubit.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

class RegisterDeviceTabletPage extends StatelessWidget {
  const RegisterDeviceTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterDeviceCubit, RegisterDeviceState>(
      listener: (context, state) {
        if (state.progressPercent == 100) {
          appRouter.toWaitingActivation(context);
        }
      },
      child: Scaffold(
        backgroundColor: ThemeColor.x000000,
        body: Center(
          child: Container(
            width: 650,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: ThemeColor.xFFFFFF,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 64,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    Assets.icons.install.svg(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Installation Wizard",
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            color: ThemeColor.x1F3251,
                          ),
                        ),
                        Text(
                          "Device must be registered before can be used",
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeColor.x1073FC,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // step 1
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    BlocSelector<RegisterDeviceCubit, RegisterDeviceState, double>(
                      selector: (state) => state.progressPercent,
                      builder: (context, state) {
                        return LinearProgressIndicator(
                          minHeight: 12,
                          color: ThemeColor.x1073FC,
                          backgroundColor: ThemeColor.xD9D9D9,
                          value: state / 100,
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Please Wait",
                              style: ThemeTextStyle.custom(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w600,
                                color: ThemeColor.x121212,
                              ),
                            ),
                            Text(
                              "We tried to install your device",
                              style: ThemeTextStyle.custom(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w300,
                                color: ThemeColor.x121212,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  "Version 1.0.0",
                  style: ThemeTextStyle.custom(
                    fontFamily: GoogleFonts.sora().fontFamily,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeColor.x000000,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
