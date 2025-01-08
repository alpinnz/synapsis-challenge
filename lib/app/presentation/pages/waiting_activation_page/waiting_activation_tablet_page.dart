import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/presentation/cubits/app/app_cubit.dart';
import 'package:synapsis/app/presentation/cubits/waiting_activation/waiting_activation_cubit.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

class WaitingActivationTabletPage extends StatelessWidget {
  const WaitingActivationTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WaitingActivationCubit, WaitingActivationState>(
      listener: (context, state) {
        if (state.activation.status.isSuccess) {
          appRouter.toLogin(context);
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
            child: SingleChildScrollView(
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
                    spacing: 16,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Your serial number",
                            style: ThemeTextStyle.custom(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeColor.x121212,
                            ),
                          ),
                          BlocBuilder<WaitingActivationCubit, WaitingActivationState>(
                            builder: (context, state) {
                              return TextField(
                                controller: TextEditingController(text: context.read<AppCubit>().state.device.data?.headUnitSn ?? "-"),
                                style: ThemeTextStyle.custom(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeColor.x646464,
                                ),
                                readOnly: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ThemeColor.xFAFDFD,
                                  border: OutlineInputBorder(
                                    gapPadding: 8,
                                    borderSide: BorderSide(color: ThemeColor.xD0D7DE, width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Text(
                        "Waiting for activation...",
                        style: ThemeTextStyle.custom(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: ThemeColor.x1073FC,
                        ),
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
      ),
    );
  }
}
