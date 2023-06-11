import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../utils.dart';


class ClickableWidget extends StatefulWidget {
  final double? onPressZoomPer;
  final Widget widget;

  final Callback onTap;

  const ClickableWidget({
    super.key,
    required this.widget,
    required this.onTap,
    this.onPressZoomPer,
  });

  @override
  State<ClickableWidget> createState() => _ClickableWidgetState();
}

class _ClickableWidgetState extends State<ClickableWidget> {
  bool _toggle = false;
  void _tapDown(TapDownDetails details) {
    HapticFeedback.heavyImpact();
    setState(() {
      _toggle = !_toggle;
    });
  }

  void _tapUp(TapUpDetails details) {
    HapticFeedback.heavyImpact();

    setState(() {
      _toggle = !_toggle;
      widget.onTap.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: () {
      //   widget.onTap.call();
      // },

      onTapDown: _tapDown,
      onTapUp: _tapUp,

      child: widget.widget.animate(target: _toggle ? 1 : 0).scale(
              end: Offset(
            widget.onPressZoomPer != null
                ? (1.0 + (0.01 * widget.onPressZoomPer!))
                : 0.95,
            widget.onPressZoomPer != null
                ? (1.0 + (0.01 * widget.onPressZoomPer!))
                : 0.95,
          )),
    );
  }
}

class MyCustomButton extends StatefulWidget {
  final Icon? icon;
  final FontWeight? fontWeight;
  final bool isFilled;
  final Callback? onTap;
  final double? width;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  final double? fontSize;
  final Color? textColor;

  final String text;
  const MyCustomButton(
      {super.key,
      this.onTap,
      this.isFilled = true,
      this.width,
      this.color,
      required this.text,
      this.borderRadius,
      this.padding,
      this.borderColor,
      this.fontWeight,
      this.icon,
      this.fontSize,
      this.textColor});

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  bool _toggle = false;
  void _tapDown(TapDownDetails details) {
    HapticFeedback.selectionClick();
    setState(() {
      _toggle = !_toggle;
    });
  }

  void _tapUp(TapUpDetails details) {
    HapticFeedback.selectionClick();

    setState(() {
      _toggle = !_toggle;
      widget.onTap?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: (widget.isFilled
              ? Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                    border: widget.borderColor != null
                        ? Border.all(color: widget.borderColor!)
                        : null,
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(gap),
                    color: widget.color ?? const Color(0xffFF003D),
                    gradient: widget.color == null
                        ? const LinearGradient(
                            colors: [
                              Color(0xffFF003D),
                              Color(0xffFF5656),
                            ],
                          )
                        : null,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, gap),
                          color: themeColor.withOpacity(0.2),
                          blurRadius: gap * 4)
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: widget.padding ??
                          const EdgeInsets.symmetric(
                              horizontal: gap * 7, vertical: gap * 2),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            color: widget.textColor ?? Colors.white,
                            fontSize: widget.fontSize,
                            fontWeight: widget.fontWeight ?? FontWeight.normal),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(gap),
                      border: Border.all(
                          color: widget.borderColor ??
                              (widget.color ?? Colors.black)),
                      color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: widget.padding ??
                          const EdgeInsets.symmetric(
                              horizontal: gap * 7 - 2, vertical: gap * 2 - 2),
                      child: widget.icon != null
                          ? Row(
                              children: [
                                widget.icon!,
                                const SizedBox(
                                  width: gap * 3,
                                ),
                                Text(
                                  widget.text,
                                  style: TextStyle(
                                      color: widget.textColor ?? widget.color,
                                      fontSize: widget.fontSize,
                                      fontWeight: widget.fontWeight ??
                                          FontWeight.normal),
                                ),
                              ],
                            )
                          : Text(
                              widget.text,
                              style: TextStyle(
                                  color: widget.textColor ?? widget.color,
                                  fontSize: widget.fontSize,
                                  fontWeight:
                                      widget.fontWeight ?? FontWeight.normal),
                            ),
                    ),
                  ),
                ))
          .animate(target: _toggle ? 1 : 0)
          .scale(
            end: const Offset(0.95, 0.95),
          ),
    );
  }
}
