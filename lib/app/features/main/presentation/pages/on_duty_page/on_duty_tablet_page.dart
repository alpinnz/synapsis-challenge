import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/features/main/presentation/cubits/on_duty/on_duty_cubit.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

class OnDutyTabletPage extends StatelessWidget {
  const OnDutyTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnDutyCubit, OnDutyState>(
      listener: (context, state) {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.demo.path),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 24,
            child: SizedBox(
              width: 260,
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.x1C1922,
                        ),
                        child: Column(
                          children: [
                            Assets.icons.speed.svg(width: 36, height: 36),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                "Speed",
                                style: ThemeTextStyle.custom(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeColor.xFFFFFF,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: ThemeColor.xCE230E,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "75",
                              style: ThemeTextStyle.custom(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: ThemeColor.xFFFFFF,
                              ),
                            ),
                            Text(
                              "km/h",
                              style: ThemeTextStyle.custom(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ThemeColor.xFFFFFF,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(color: ThemeColor.xCE230E),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "MAX",
                                  style: ThemeTextStyle.custom(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColor.xFFFFFF,
                                  ),
                                ),
                                Text(
                                  "70",
                                  style: ThemeTextStyle.custom(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColor.xFFFFFF,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(color: ThemeColor.x1073FC),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "MIN",
                                  style: ThemeTextStyle.custom(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColor.xFFFFFF,
                                  ),
                                ),
                                Text(
                                  "35",
                                  style: ThemeTextStyle.custom(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColor.xFFFFFF,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.x1C1922,
                        ),
                        child: Column(
                          children: [
                            Assets.icons.target.svg(width: 36, height: 36),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                "Achievement",
                                style: ThemeTextStyle.custom(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeColor.xFFFFFF,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 160,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.x1C1922.withAlpha((255.0 * 0.5).round()),
                        ),
                        child: Column(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "100/50 Ton",
                              style: ThemeTextStyle.custom(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ThemeColor.xFFFFFF,
                              ),
                            ),
                            Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.x1073FC,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: ThemeColor.x1C1922,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: Text(
                                      "50%",
                                      style: ThemeTextStyle.custom(
                                        fontFamily: GoogleFonts.inter().fontFamily,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ThemeColor.xFFFFFF,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.x1C1922,
                        ),
                        child: Column(
                          children: [
                            Assets.icons.rock.svg(width: 36, height: 36),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                "Materials",
                                style: ThemeTextStyle.custom(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeColor.xFFFFFF,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 160,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.x1C1922.withAlpha((255.0 * 0.5).round()),
                        ),
                        child: Center(
                          child: Text(
                            "COALS",
                            style: ThemeTextStyle.custom(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: ThemeColor.xFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 260,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ThemeColor.x1C1922.withAlpha((255.0 * 0.5).round()),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Text(
                            "HAULING",
                            style: ThemeTextStyle.custom(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                              color: ThemeColor.xFFFFFF,
                            ),
                          ),
                          Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.time.svg(width: 24, height: 24),
                              Text(
                                "02:00",
                                style: ThemeTextStyle.custom(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w300,
                                  color: ThemeColor.xFFFFFF,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  color: ThemeColor.x000000,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          "DSP-2",
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: ThemeColor.xFFFFFF,
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(height: 24, width: 160),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 9.5,
                              child: Container(
                                width: 160,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: ThemeColor.xD9D9D9,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 9.5,
                              child: Container(
                                width: 80,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: ThemeColor.x1073FC,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 80,
                              child: Assets.icons.pin.svg(height: 24, width: 24),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 4,
                          children: [
                            Assets.icons.time.svg(width: 24, height: 24),
                            Text(
                              "14m 42s",
                              style: ThemeTextStyle.custom(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: ThemeColor.xFFFFFF,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "1Km To go",
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeColor.xFFFFFF,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 24,
            bottom: 24,
            child: SizedBox(
              width: 160,
              child: Column(
                spacing: 12,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor.xFF7B1B,
                      minimumSize: Size.fromHeight(45),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 23),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'End Activity',
                      style: ThemeTextStyle.custom(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeColor.xFFFFFF,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor.x000000,
                      minimumSize: Size.fromHeight(45),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 23),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Activity',
                      style: ThemeTextStyle.custom(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeColor.xFFFFFF,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
