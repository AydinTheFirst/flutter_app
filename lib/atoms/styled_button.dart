import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, danger, success }

enum ButtonSize { small, medium, large }

enum ButtonShape { rounded, full, none }

class StyledButton {
  final Widget child;
  final VoidCallback onPressed;
  final ButtonType type;
  final ButtonSize size;
  final ButtonShape shape;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;

  StyledButton({
    required this.child,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.shape = ButtonShape.rounded,
    this.color,
    this.textColor,
    this.width,
    this.height,
  });

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? _getButtonColors(type)['background'],
        foregroundColor: textColor ?? _getButtonColors(type)['foreground'],
        minimumSize: Size(
          width ?? _getButtonSize(size).width,
          height ?? _getButtonSize(size).height,
        ),
        shape: _getButtonShape(shape),
      ),
      child: child,
    );
  }

  Map<String, Color> _getButtonColors(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return {'background': Colors.black, 'foreground': Colors.white};
      case ButtonType.secondary:
        return {'background': Colors.grey, 'foreground': Colors.black};
      case ButtonType.danger:
        return {'background': Colors.red, 'foreground': Colors.white};
      case ButtonType.success:
        return {'background': Colors.green, 'foreground': Colors.white};
    }
  }

  Size _getButtonSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return const Size(double.infinity, 30);
      case ButtonSize.medium:
        return const Size(double.infinity, 40);
      case ButtonSize.large:
        return const Size(double.infinity, 50);
    }
  }

  OutlinedBorder _getButtonShape(ButtonShape shape) {
    switch (shape) {
      case ButtonShape.rounded:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      case ButtonShape.full:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));
      case ButtonShape.none:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(0));
    }
  }
}
