import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/shared/theme/theme_color.dart';
import 'package:synapsis/app/shared/theme/theme_text_style.dart';

//  icon: Icon(Icons.error, size: 20, color: BaseThemeColorsEnum.iconSuccess),
enum BToastType {
  success(
    backgroundColor: Color(0xFFEEF8E6),
    borderColor: Color(0xFF77CA33),
    iconColor: Color(0xFF55BD00),
    icon: Icons.check_circle_outline,
  ),
  warning(
    backgroundColor: Color(0xFFFDFAE6),
    borderColor: Color(0xFFEBCB00),
    iconColor: Color(0xFFEBCB00),
    icon: Icons.warning_amber,
  ),
  alert(
    backgroundColor: Color(0xFFFFE7E7),
    borderColor: Color(0xFFFF0F0F),
    iconColor: Color(0xFFFF0F0F),
    icon: Icons.error_outline,
  ),
  information(
    backgroundColor: Color(0xFFE6F5FD),
    borderColor: Color(0xFF0099E6),
    iconColor: Color(0xFF0099E6),
    icon: Icons.info_outline,
  ),
  ;

  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final IconData icon;

  const BToastType({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.icon,
  });
}

abstract final class BToast {
  static final Set<OverlayEntry> _queue = {};

  static bool get isShowing => _queue.isNotEmpty;

  /// @showToast show Toast
  /// @param context BuildContext Default use rootContext
  static void showToast(
    BuildContext context, {
    BToastType type = BToastType.warning,
    String message = 'Terjadi kesalahan yang tidak diketahui',
    Icon? icon,
    BaseException? exception,
  }) {
    // context null use rootContext
    // BuildContext context = rootContext;

    if (exception is BaseException) {
      if (exception is ServerException) {
        type = BToastType.alert;
        message = exception.message;
      }
    }

    // Prepare overlay
    late final OverlayEntry overlayEntry;

    // Create timer remove overlay
    final timer = Timer(const Duration(seconds: 3), () {
      _queue.remove(overlayEntry);
      if (overlayEntry.mounted) overlayEntry.remove();
    });

    // Inject overlay
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        final isBigScreen = MediaQuery.of(context).size.width > 600;

        return Positioned(
          top: isBigScreen ? 40 : 20,
          left: isBigScreen ? null : 20,
          right: isBigScreen ? 40 : 20,
          child: SafeArea(
            child: Material(
              color: Colors.transparent,
              child: _BToast(
                type: type,
                message: message,
                icon: icon,
                onClose: () {
                  timer.cancel();
                  _queue.remove(overlayEntry);
                  overlayEntry.remove();
                },
              ),
            ),
          ),
        );
      },
      maintainState: true,
    );

    // Get context from navigatorKey
    Overlay.of(context).insert(overlayEntry);
    _queue.add(overlayEntry);
  }

  static void closeAll() async {
    // Close all toast
    for (var entry in _queue) {
      // Use future sync to avoid error xixixixi
      Future.sync(() => entry.remove());
    }
    // Clear queue
    _queue.clear();
  }
}

class _BToast extends StatefulWidget {
  const _BToast({
    required this.type,
    required this.message,
    required this.onClose,
    required this.icon,
  });

  final BToastType type;
  final String message;
  final Icon? icon;
  final VoidCallback onClose;

  @override
  _BToastState createState() => _BToastState();
}

class _BToastState extends State<_BToast> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Offset> animation;
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0.0)).chain(CurveTween(curve: Curves.easeOutCirc)).animate(controller);
    // Start animation
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleRemove() {
    if (!context.mounted) return;
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Dismissible(
        key: _key,
        direction: DismissDirection.horizontal,
        onDismissed: (_) => _handleRemove(),
        child: InkWell(
          onTap: () => _handleRemove(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: ShapeDecoration(
              color: widget.type.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: widget.type.borderColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                if (widget.icon != null) widget.icon! else Icon(widget.type.icon, size: 20, color: widget.type.iconColor),
                // Space
                const SizedBox(width: 8.0),
                // Text
                Builder(
                  builder: (context) {
                    final isBigScreen = MediaQuery.of(context).size.width > 600;

                    if (isBigScreen) {
                      return ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Text(
                          widget.message,
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ThemeColor.x121212,
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Text(
                          widget.message,
                          style: ThemeTextStyle.custom(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ThemeColor.x121212,
                          ),
                        ),
                      );
                    }
                  },
                ),
                // Space
                const SizedBox(width: 8.0),
                // Close button
                InkWell(
                  onTap: () => _handleRemove(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 24,
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

class BToastScope extends StatelessWidget {
  const BToastScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Overlay(
      // for showToastNew without context
      initialEntries: [
        // Content
        OverlayEntry(
          maintainState: true,
          builder: (context) => child,
        ),
      ],
    );
  }
}
