import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/common/presentation/widgets/v_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable text input field for use in forms.
///
/// This widget allows you to create a highly customizable text field with various options for configuration, 
/// such as hint text, input validation, custom styling, input formatting, and error handling. 
/// It's commonly used in forms or other user input scenarios where flexibility is needed.

class CustomTextField extends StatelessWidget {
  /// The text to display as the hint for the input field.
  final String hintText;

  /// Whether the text field should obscure input (e.g., for passwords).
  final bool obscureText;

  /// Callback function to handle changes in the text input.
  final Function(String)? onChanged;

  /// Function to validate the input field. 
  /// Should return a string error message if validation fails, or null if the input is valid.
  final String? Function(String?)? validator;

  /// Specifies the type of input (e.g., text, email, number).
  final TextInputType? keyboardType;

  /// The style to apply to the hint text.
  final TextStyle? hintStyle;

  /// Error message to be displayed if validation fails.
  final String errorMessage;

  /// A controller to manage the text input.
  final TextEditingController? controller;

  /// A callback to trigger when the text field is tapped.
  final Function()? onTap;

  /// An input formatter to modify the text as it's being entered.
  final TextInputFormatter? formater;

  /// The form key to manage the validation state.
  final GlobalKey<FormState>? formKey;

  /// A focus node to manage the focus state of the text field.
  final FocusNode? focusNode;

  /// Defines the alignment of the input text (e.g., left, center, right).
  final TextAlign textAlign;

  /// The width of the text field relative to the screen width (in percentage).
  final double widthPer;

  /// The label for the input field, displayed above the text field.
  final String label;

  /// Whether the text field should autofocus when the widget is rendered.
  final bool autofocus;

  /// The style to apply to the input text.
  final TextStyle? style;

  /// The maximum number of characters allowed in the text field.
  final int? maxLength;

  /// A callback function triggered when editing is complete.
  final Function()? onEditingComplete;

  /// A widget to display at the end of the text field (e.g., a password visibility toggle).
  final Widget? suffixIcon;

  /// A widget to display at the beginning of the text field (e.g., an icon).
  final Widget? prefixIcon;

  /// The border radius of the text field.
  final double borderRadius;

  /// The padding inside the text field.
  final double contentPadding;

  /// Whether the text field is enabled (can be interacted with).
  final bool? enabled;

  /// The fill color for the background of the text field.
  final Color? fillColor;

  /// The height of the text field.
  final double? height;

  /// Whether to enable autocorrection of the input.
  final bool autocorrect;

  /// Whether to enable text suggestions.
  final bool enableSuggestions;

  /// The left padding (in percentage) inside the text field.
  final double leftPaddingPer;

  const CustomTextField({
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.keyboardType,
    super.key,
    this.hintStyle,
    this.errorMessage = "",
    this.controller,
    this.onTap,
    this.formater,
    this.formKey,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.widthPer = 90,
    this.autofocus = false,
    required this.label,
    this.maxLength,
    this.onEditingComplete,
    this.style,
    this.suffixIcon,
    this.prefixIcon,
    this.borderRadius = 8,
    this.contentPadding = 15,
    this.enabled,
    this.fillColor,
    this.height = 55,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.leftPaddingPer = 5
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorMessage.isNotEmpty;

    return SizedBox(
      width: mqWidth(context, widthPer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: mqWidth(context, widthPer),
            height: height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  offset: const Offset(2, 2),
                  blurRadius: 5
                )
              ]
            ),
            child: TextFormField(
              autocorrect: autocorrect,
              enabled: enabled,
              autofocus: autofocus,
              key: formKey,
              onTap: onTap,
              enableSuggestions: enableSuggestions,
              focusNode: focusNode,
              controller: controller,
              enableInteractiveSelection: false,
              clipBehavior: Clip.none,
              obscureText: obscureText,
              onChanged: onChanged,
              validator: validator,
              obscuringCharacter: "*",
              keyboardType: keyboardType,
              maxLength: maxLength,
              inputFormatters: formater != null ? [formater!] : null,
              style: style ?? TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: obscureText ? FontWeight.w700 : FontWeight.w500,
              ),
              textAlign: textAlign,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                hintText: hintText,
                counterText: "",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: mqWidth(context, leftPaddingPer),
                  vertical: contentPadding
                ),
                hintStyle: hintStyle ?? TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w400
                ),
                fillColor: fillColor,
                filled: fillColor != null,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius)
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon
              ),
            ),
          ),
          if(hasError) Container(
            width: mqWidth(context, widthPer),
            height: 1,
            color: hasError ? Theme.of(context).dividerColor : Colors.white,
          ),
          errorMessage.isNotEmpty ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VSpacing(1),
              Container(
                padding: EdgeInsets.only(
                  left: mqWidth(context, 2)
                ),
                child: Text(errorMessage,
                  style: const TextStyle(
                    color: Colors.red
                  )
                ),
              ),
              const VSpacing(1)
            ],
          ) : const SizedBox()
        ],
      ),
    );
  }
}
