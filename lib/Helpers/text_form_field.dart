import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final bool? isReadOnly;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.isObscure,
      this.controller,
      this.prefixIcon,
      this.isReadOnly,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.sentences,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
      child: TextFormField(
        textCapitalization: widget.textCapitalization,
        validator: widget.validator,
        obscureText: widget.isObscure ?? false,
        controller: widget.controller,
        readOnly: widget.isReadOnly ?? false,
        keyboardType: widget.keyboardType,
        // cursorColor: Colors.white.withOpacity(0.7),
        // style: TextStyle(color: Colors.white, fontSize: 13),
        // You can apply a custom style here if needed
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          border: InputBorder.none,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          suffixIconColor: Colors.white.withOpacity(0.4),
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Colors.black54,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 18, minHeight: 18, minWidth: 60),
        ),
      ),
    );
  }
}

// class CustomTextFieldEditProfile extends StatefulWidget {
//   final String hintText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final bool? isObscure;
//   final bool? isReadOnly;
//   final TextCapitalization textCapitalization;
//   final TextInputType? keyboardType;
//
//   final TextEditingController? controller;
//   final FormFieldValidator<String>? validator;
//   const CustomTextFieldEditProfile(
//       {Key? key,
//       required this.hintText,
//       this.suffixIcon,
//       this.isObscure,
//       this.controller,
//       this.prefixIcon,
//       this.isReadOnly,
//       this.keyboardType,
//       this.textCapitalization = TextCapitalization.sentences,
//       this.validator})
//       : super(key: key);
//
//   @override
//   State<CustomTextFieldEditProfile> createState() =>
//       _CustomTextFieldEditProfileState();
// }

// class _CustomTextFieldEditProfileState
//     extends State<CustomTextFieldEditProfile> {
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(27),
//           border: Border.all(
//               color: AppColors.blue,
//               width: 0.3), // Adjust the radius value as needed
//           color: AppColors.textfield),
//       child: TextFormField(
//         textCapitalization: widget.textCapitalization,
//         validator: widget.validator,
//         obscureText: widget.isObscure ?? false,
//         controller: widget.controller,
//         readOnly: widget.isReadOnly ?? false,
//         keyboardType: widget.keyboardType,
//         cursorColor: Colors.white.withOpacity(0.7),
//         style: TextStyle(color: Colors.white, fontSize: 13),
//         // You can apply a custom style here if needed
//         decoration: InputDecoration(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 27, vertical: 15),
//           hintStyle: TextStyle(
//               color: AppColors.blue, fontSize: 14, fontWeight: FontWeight.w600),
//           border: InputBorder.none,
//           hintText: widget.hintText,
//           suffixIcon: widget.suffixIcon,
//           suffixIconColor: Colors.black54,
//           prefixIcon: widget.prefixIcon,
//           prefixIconColor: Colors.black54,
//           prefixIconConstraints:
//               const BoxConstraints(maxHeight: 18, minHeight: 18, minWidth: 60),
//         ),
//       ),
//     );
//   }
// }
//
///Otp Fields
class OtpField extends StatefulWidget {
  const OtpField({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: OtpTextField(
        numberOfFields: 4,
        fieldWidth: 56,
        borderWidth: 1.2,
        margin: const EdgeInsets.fromLTRB(2, 0, 4, 2),
        keyboardType: TextInputType.number,
        borderRadius: BorderRadius.circular(15),
        borderColor: Colors.black26,
        focusedBorderColor: Colors.black,
        enabledBorderColor: Colors.black26,
        disabledBorderColor: Colors.black26,
        cursorColor: AppColors.primaryColor,
        showFieldAsBox: true,
        textStyle: TextStyle(
            fontSize: 32,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold),
        // bodyNormal.copyWith(fontSize: 22, fontFamily: "InterSemiBold"),
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textField is filled
        onSubmit: (String verificationCode) {
          // showCustomDialog(context, 'OTP Verified!', 'Continue', '');
          // Get.to(() => ResetPassword(controller: TextEditingController()));
        }, // end onSubmit
      ),
    );
  }
}
