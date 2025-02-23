import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/common/presentation/widgets/h_spacing.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed, 
    required this.buttonText, 
    required this.width, 
    required this.backgroundColor, 
    super.key, 
    this.heigth = 60,
    this.borderRadius = 10,
    this.disabled = false,
    this.leading,
    this.loading = false, 
    this.labelColor = Colors.white,
    this.textColor,
  });
  final void Function()? onPressed;
  final String buttonText;
  final double width;
  final Color? backgroundColor;
  final double heigth;
  final double borderRadius;
  final bool disabled;
  final Widget? leading;
  final bool loading;
  final Color labelColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: MaterialButton(
        color: disabled ? Theme.of(context).hintColor.withOpacity(0.6) : 
          backgroundColor ?? (
          onPressed == null ? 
          Theme.of(context).hintColor.withOpacity(0.6) : 
          Theme.of(context).primaryColor
        ),
        minWidth: width,
        height: heigth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: () {
          if (disabled) return;
          if (loading) return;
          onPressed?.call();
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              if (leading != null) Row(
                children: [
                  leading!,
                  const HSpacing(1),
                ],
              ) else Container(),
              if (!loading) Text(
                buttonText,
                style: TextStyle(
                  color: labelColor
                ),
                textAlign: TextAlign.center,
              ) else SizedBox(
                width: mqHeigth(context, 4),
                height: mqHeigth(context, 4),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
