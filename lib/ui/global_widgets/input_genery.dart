import 'package:flutter/material.dart';

class InputGenery extends StatelessWidget {
  const InputGenery({
    super.key,
    this.obscureText,
    this.textInputType,
    this.prefixIcon,
    this.onChanged,
    this.hintText,
    this.isPrefixIcon = true,
    this.suixIcon,
    this.isSufixIcon = false,
    this.onTap,
    this.initialValue,
  });

  final bool? obscureText;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Widget? suixIcon;
  final Function(String)? onChanged;
  final String? hintText;
  final bool isPrefixIcon;
  final bool isSufixIcon;
  final Function()? onTap;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        initialValue: initialValue,
        style: textStyle,
        keyboardType: textInputType ?? TextInputType.emailAddress,
        obscureText: obscureText ?? false,
        onTap: onTap,
        onChanged: onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: hintText ?? 'Correo',
          hintStyle: Theme.of(context).textTheme.labelSmall,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: InputBorder.none,
          label: Text(hintText ?? 'Correo'),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.8),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class InputGeneryAmplio extends StatelessWidget {
  const InputGeneryAmplio({super.key, this.obscureText, this.textInputType, this.prefixIcon, this.onChanged, this.hintText, this.initialValue});
  final String? initialValue;

  final bool? obscureText;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TextFormField(
        initialValue: initialValue,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: textInputType ?? TextInputType.emailAddress,
        obscureText: obscureText ?? false,
        maxLines: 15,
        minLines: 10,
        onChanged: onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: hintText ?? 'Correo',
          hintStyle: textStyle,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: InputBorder.none,
          label: Text(hintText!, style: textStyle),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

var textStyle = TextStyle(
  color: Colors.grey.withOpacity(.8),
  fontSize: 17.0,
  fontWeight: FontWeight.normal,
);
