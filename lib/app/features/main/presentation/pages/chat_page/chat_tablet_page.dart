import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/features/main/presentation/cubits/chat/chat_cubit.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

enum ChatMessageCardPosition { left, right }

class ChatTabletPage extends StatelessWidget {
  const ChatTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = ["Mengerti", "Sedang dalam perjalanan", "Menuju lokasi", "Siap dalam 5 menit", "Siap dalam 10 menit", "Siap dalam 15 menit"];
    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {},
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.x2E2E35,
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.x121212,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 23),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Back',
                    style: ThemeTextStyle.custom(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeColor.xFFFFFF,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ChatMessageCard(position: ChatMessageCardPosition.left, isUserMe: false),
                    ChatMessageCard(position: ChatMessageCardPosition.right, isUserMe: true),
                    ChatMessageCard(position: ChatMessageCardPosition.left, isUserMe: false),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 12,
                children: [
                  Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      color: ThemeColor.xFFFFFF,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Row(
                      spacing: 12,
                      children: [
                        Text(
                          "Search",
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: ThemeColor.x9E9E9E,
                          ),
                        ),
                        Icon(Icons.search, size: 24, color: ThemeColor.x9E9E9E)
                      ],
                    ),
                  ),
                  ...list.map((e) {
                    return Container(
                      height: 56,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      decoration: BoxDecoration(
                        color: ThemeColor.x1073FC,
                        borderRadius: BorderRadius.circular(44),
                      ),
                      child: Text(
                        e,
                        style: ThemeTextStyle.custom(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeColor.xFFFFFF,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5),
              child: Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: TextField(
                        controller: TextEditingController(text: "SID986asd97asf0"),
                        style: ThemeTextStyle.custom(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeColor.x9E9E9E,
                        ),
                        readOnly: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ThemeColor.xFAFDFD,
                          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          border: OutlineInputBorder(
                            gapPadding: 8,
                            borderSide: BorderSide(color: ThemeColor.xD0D7DE, width: 1),
                            borderRadius: BorderRadius.circular(44),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.x1073FC,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        spacing: 4,
                        children: [
                          Text(
                            'Send',
                            style: ThemeTextStyle.custom(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: ThemeColor.xFFFFFF,
                            ),
                          ),
                          Assets.icons.send.svg(height: 24, width: 24),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.x1073FC,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44),
                        ),
                      ),
                      onPressed: () {},
                      child: Assets.icons.voice.svg(height: 24, width: 24),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessageCard extends StatelessWidget {
  final ChatMessageCardPosition position;
  final bool isUserMe;

  const ChatMessageCard({super.key, required this.position, required this.isUserMe});

  @override
  Widget build(BuildContext context) {
    bool isLeft = position == ChatMessageCardPosition.left;
    bool isRight = position == ChatMessageCardPosition.right;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isUserMe ? ThemeColor.x1073FC : ThemeColor.xC99D00,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(isRight ? 0 : 8),
                topLeft: Radius.circular(isLeft ? 0 : 8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 4,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          isUserMe ? Assets.icons.notification.svg(width: 20, height: 20) : Assets.icons.warning.svg(width: 20, height: 20),
                          Text(
                            "RAHMAT (45678)",
                            style: ThemeTextStyle.custom(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: ThemeColor.xFFFFFF,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Proses Blasting sedang berlangsung pastikan Anda berada pada area aman ",
                        style: ThemeTextStyle.custom(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: ThemeColor.xFFFFFF,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                  child: Text(
                    "23 Nov 2024, 12:00",
                    style: ThemeTextStyle.custom(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: ThemeColor.xFFFFFF,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
