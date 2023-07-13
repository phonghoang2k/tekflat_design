part of 'inputs.dart';

InputDecoration tekInputDecoration(
  BuildContext context, {
  bool? enabled,
  bool? isDense,
  bool? filled,
  Color? fillColor,
  Color? hoverColor,
  Widget? prefixIcon,
  Widget? suffixIcon,
  EdgeInsets? contentPadding,
  InputBorder? enabledBorder,
  InputBorder? focusedBorder,
  InputBorder? disabledBorder,
  InputBorder? errorBorder,
  InputBorder? focusedErrorBorder,
  String? labelText,
  TextStyle? labelStyle,
  TextStyle? floatingLabelStyle,
  FloatingLabelBehavior? floatingLabelBehavior,
  String? hintText,
  TextStyle? hintStyle,
  String? errorText,
  int? errorMaxLines,
  TextStyle? errorStyle,
  InputBorder? border,
}) =>
    InputDecoration(
      isDense: isDense,
      filled: filled,
      fillColor: enabled != null && !enabled
          ? context.theme.inputDecorationTheme.disabledBorder?.borderSide.color
          : fillColor,
      hoverColor: hoverColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      disabledBorder: disabledBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,
      labelText: labelText,
      labelStyle: labelStyle,
      floatingLabelStyle: floatingLabelStyle,
      floatingLabelBehavior: floatingLabelBehavior,
      hintText: hintText,
      hintStyle: hintStyle,
      errorText: errorText,
      errorMaxLines: errorMaxLines,
      errorStyle: errorStyle,
      border: border,
    );
