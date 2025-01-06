import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/features/main/main_router.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

class BottomNavigation extends StatelessWidget {
  final StatefulNavigationShell child;

  const BottomNavigation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.x000000,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 65,
              top: 0,
              child: child,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                height: 65,
                decoration: BoxDecoration(
                  color: ThemeColor.x1C1922.withAlpha((255.0 * 0.4).round()),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.xFF1B1B,
                        minimumSize: Size.copy(Size(100, 50)),
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 23),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'EMERGENCY',
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
                        backgroundColor: ThemeColor.xFF1B1B,
                        minimumSize: Size.copy(Size(100, 50)),
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 23),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () => MainRouter.toNewCart(context),
                      child: Text(
                        'BREAKDOWN',
                        style: ThemeTextStyle.custom(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600,
                          color: ThemeColor.xFFFFFF,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...[
                          Assets.icons.settings.svg(
                            width: 40,
                            height: 40,
                          ),
                          Assets.icons.chart.svg(
                            width: 40,
                            height: 40,
                          ),
                          Assets.icons.mail.svg(
                            width: 40,
                            height: 40,
                          ),
                          Assets.icons.menu.svg(
                            width: 40,
                            height: 40,
                          )
                        ].asMap().entries.map((e) {
                          return InkWell(
                            onTap: () {
                              child.goBranch(e.key, initialLocation: e.key == child.currentIndex);
                              // switch (e.key) {
                              //   case 2:
                              //     {
                              //       MainRouter.toCart(context);
                              //     }
                              // }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: child.currentIndex == e.key ? ThemeColor.x1073FC : null,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: e.value,
                            ),
                          );
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
