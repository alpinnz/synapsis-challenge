import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';
import 'package:synapsis/app/presentation/cubits/app/app_cubit.dart';
import 'package:synapsis/app/presentation/cubits/login/login_cubit.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

class LoginTabletPage extends StatefulWidget {
  const LoginTabletPage({super.key});

  @override
  State<LoginTabletPage> createState() => _LoginTabletPageState();
}

class _LoginTabletPageState extends State<LoginTabletPage> {
  TextEditingController txtNik = TextEditingController();

  Widget wSuccess(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 500.w,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeColor.x1073FC,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: ThemeTextStyle.custom(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: ThemeColor.xFFFFFF,
              ),
            ),
          ),
          Container(
            width: 500.w,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeColor.xFFFFFF,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.images.profile.path),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ichwan",
                      style: ThemeTextStyle.custom(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontSize: 41.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeColor.x000000,
                      ),
                    ),
                    Text(
                      "Operator",
                      style: ThemeTextStyle.custom(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeColor.x989898,
                      ),
                    ),
                  ],
                ),
                CircularProgressIndicator(
                  color: ThemeColor.xD9D9D9,
                  strokeWidth: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget wDefault(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 700.w,
      ),
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: ThemeColor.xFFFFFF,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              "Login by Code",
              style: ThemeTextStyle.custom(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: ThemeColor.x1F3251,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 18,
              children: [
                Text(
                  "Enter your NIK",
                  style: ThemeTextStyle.custom(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeColor.xA0AAB4,
                  ),
                ),
              ],
            ),
            BlocSelector<LoginCubit, LoginState, BaseException?>(
              selector: (state) => state.login.status.exception,
              builder: (context, state) {
                return TextField(
                  controller: txtNik,
                  style: ThemeTextStyle.custom(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeColor.x646464,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ThemeColor.xFAFDFD,
                      border: OutlineInputBorder(
                        gapPadding: 8,
                        borderSide: BorderSide(color: ThemeColor.xD0D7DE, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 8,
                        borderSide: BorderSide(color: ThemeColor.xD0D7DE, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorBorder: OutlineInputBorder(
                        gapPadding: 8,
                        borderSide: BorderSide(color: ThemeColor.xFF1B1B, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorText: state is ServerException
                          ? state.code == 400
                              ? "Can’t find your NIK"
                              : state.message
                          : state?.message,
                      errorStyle: ThemeTextStyle.custom(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: ThemeColor.xFF1B1B,
                      )),
                );
              },
            ),
            BlocSelector<LoginCubit, LoginState, LoginState>(
              selector: (state) => state,
              builder: (context, state) {
                bool isLoading = state.login.status.isLoading || state.device.status.isLoading;
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.x1073FC,
                    minimumSize: const Size.fromHeight(50), // NEW
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    if (!isLoading) {
                      context.read<LoginCubit>().onLogin(nik: txtNik.text);
                    }
                  },
                  child: isLoading
                      ? SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: ThemeColor.xFFFFFF))
                      : Text(
                          'Submit',
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeColor.xFFFFFF,
                          ),
                        ),
                );
              },
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.login.status.isSuccess) {
          if (state.login.data is User) {
            context.read<AppCubit>().setUser(state.login.data!);
          }

          if (state.device.data is Device) {
            context.read<AppCubit>().setDevice(state.device.data!);
          }
          Future.delayed(Duration(seconds: 1), () {
            appRouter.toOnDuty(context);
          });
        }
      },
      child: Scaffold(
        backgroundColor: ThemeColor.x000000,
        body: Center(
          child: BlocSelector<LoginCubit, LoginState, CubitState<dynamic>>(
            selector: (state) => state.login,
            builder: (context, state) {
              bool isSuccess = state.status.isSuccess;
              if (isSuccess) {
                return wSuccess(context);
              } else {
                return wDefault(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
