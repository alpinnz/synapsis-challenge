import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/presentation/cubits/chat_new/chat_new_cubit.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

class ChatNewTabletPage extends StatelessWidget {
  const ChatNewTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatNewCubit, ChatNewState>(
      listener: (context, state) {},
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.x2E2E35,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.only(top: 48, bottom: 24, left: 48, right: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                Assets.icons.mail.svg(width: 40, height: 40),
                Text(
                  "Messages",
                  style: ThemeTextStyle.custom(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: ThemeColor.xFFFFFF,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ChatMessageCard(position: ChatMessageCardPosition.left, isUserMe: false),
                    // ChatMessageCard(position: ChatMessageCardPosition.right, isUserMe: true),
                    // ChatMessageCard(position: ChatMessageCardPosition.left, isUserMe: false),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 72,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(68),
                color: ThemeColor.xA7A7A7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balas Nanti',
                    style: ThemeTextStyle.custom(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeColor.x626262,
                    ),
                  ),
                  Container(
                    height: 72,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(47),
                      color: ThemeColor.xD9D9D9,
                    ),
                    child: Row(
                      spacing: 12,
                      children: [
                        Icon(Icons.chevron_left, size: 36, color: ThemeColor.x121212),
                        Icon(Icons.chevron_right, size: 36, color: ThemeColor.x121212),
                      ],
                    ),
                  ),
                  Text(
                    'Mengerti',
                    style: ThemeTextStyle.custom(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeColor.x626262,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
