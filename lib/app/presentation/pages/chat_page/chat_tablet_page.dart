import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';
import 'package:synapsis/app/domain/entities/message_template/message_template.dart';
import 'package:synapsis/app/presentation/cubits/app/app_cubit.dart';
import 'package:synapsis/app/presentation/cubits/chat/chat_cubit.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';
import 'package:synapsis/app/shared/utils/extension_date_time.dart';

enum ChatMessageCardPosition { left, right }

class ChatTabletPage extends StatefulWidget {
  const ChatTabletPage({super.key});

  @override
  State<ChatTabletPage> createState() => _ChatTabletPageState();
}

class _ChatTabletPageState extends State<ChatTabletPage> {
  TextEditingController txtSearch = TextEditingController();
  TextEditingController txtMessage = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    txtMessage.dispose();
    txtSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state.getMessages.status.isSuccess || state.createMessages.status.isSuccess) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
        if (state.createMessages.status.isLoading) {
          txtMessage.clear();
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
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
                  onPressed: () => context.pop(),
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
              child: BlocSelector<ChatCubit, ChatState, CubitState<List<Message>>>(
                selector: (state) => state.getMessages,
                builder: (context, state) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        if (state.status.isLoading) LinearProgressIndicator(),
                        ...(state.data ?? []).asMap().entries.map((e) {
                          return ChatMessageCard(message: e.value);
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
            BlocSelector<ChatCubit, ChatState, CubitState<List<MessageTemplate>>>(
              selector: (state) => state.getMessagesTemplate,
              builder: (context, state) {
                return SingleChildScrollView(
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
                      if (state.status.isLoading) SizedBox(width: 24, height: 24, child: CircularProgressIndicator()),
                      ...(state.data ?? []).map((e) {
                        return InkWell(
                          onTap: () {
                            txtMessage.text = e.defaultMessage;
                            context.read<ChatCubit>().onMessageTemplateSelect(e);
                          },
                          child: Container(
                            height: 56,
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            decoration: BoxDecoration(
                              color: ThemeColor.x1073FC,
                              borderRadius: BorderRadius.circular(44),
                            ),
                            child: Text(
                              e.defaultMessage,
                              style: ThemeTextStyle.custom(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: ThemeColor.xFFFFFF,
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: BlocSelector<ChatCubit, ChatState, CubitState<Message>>(
                        selector: (state) => state.createMessages,
                        builder: (context, state) {
                          return TextField(
                            controller: txtMessage,
                            style: ThemeTextStyle.custom(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ThemeColor.x9E9E9E,
                            ),
                            readOnly: state.status.isLoading,
                            textAlign: TextAlign.left,
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
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: BlocSelector<ChatCubit, ChatState, CubitState<Message>>(
                      selector: (state) => state.createMessages,
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.x1073FC,
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44),
                            ),
                          ),
                          onPressed: () => context.read<ChatCubit>().onCreateMessages(
                                message: txtMessage.text,
                                equipmentId: context.read<AppCubit>().state.device.data?.equipment?.id ?? "",
                              ),
                          child: state.status.isLoading
                              ? SizedBox(width: 24, height: 24, child: CircularProgressIndicator())
                              : Row(
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
                        );
                      },
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
  final Message message;

  const ChatMessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isUserMe = (context.read<AppCubit>().state.device.data?.equipment?.id ?? "") == message.equipmentId;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: isUserMe == false ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isUserMe ? ThemeColor.x1073FC : ThemeColor.xC99D00,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(isUserMe ? 0 : 8),
                topLeft: Radius.circular(isUserMe == false ? 0 : 8),
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
                            message.senderName,
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
                        message.message,
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
                    message.createdAt.formatLocal("DD MMM y, HH:mm"), //  "23 Nov 2024, 12:00"
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
