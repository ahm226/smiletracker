import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smiletracker/helpers/globalvariables.dart';

class CustomTextField extends StatefulWidget {
  final bool isHint;
  final String? hintText;
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
      this.isHint = true,
      this.hintText,
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
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.isObscure ?? false,
      controller: widget.controller,
      readOnly: widget.isReadOnly ?? false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        fillColor: AppColors.primaryColor.withOpacity(0.12),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        border: InputBorder.none,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            color: Colors.transparent, // Make the border transparent
            width: 0, // Set the width to 0 to make it disappear
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            color: Colors.transparent, // Make the border transparent
            width: 0, // Set the width to 0 to make it disappear
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(
            color: Colors.transparent, // Make the border transparent
            width: 0, // Set the width to 0 to make it disappear
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(
            color: Colors.transparent, // Make the border transparent
            width: 0, // Set the width to 0 to make it disappear
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            color: Colors.transparent, // Make the border transparent
            width: 0, // Set the width to 0 to make it disappear
          ),
        ),
        hintText: widget.isHint ? widget.hintText : null,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: Colors.white.withOpacity(0.4),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: Colors.black54,
        suffixIconConstraints:
            const BoxConstraints(minWidth: 20, maxHeight: 20),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 20, maxHeight: 20),
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
    return PinCodeTextField(
      appContext: context,
      textStyle: TextStyle(color: AppColors.primaryColor, fontSize: 30),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      length: 4,
      obscureText: false,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        return null;
      },

      pinTheme: PinTheme(
        borderWidth: 0.0,
        selectedColor: Colors.transparent,
        selectedFillColor: AppColors.primaryColor.withOpacity(0.1),
        activeColor: Colors.transparent,
        activeFillColor: AppColors.primaryColor.withOpacity(0.1),
        shape: PinCodeFieldShape.box,
        errorBorderColor: Colors.transparent,
        errorBorderWidth: 0.0,
        inactiveColor: Colors.transparent,
        inactiveFillColor: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 55,
        fieldWidth: 50,
      ),
      cursorColor: AppColors.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      keyboardType: TextInputType.number,
      onCompleted: (v) {},
      onChanged: (value) {
        if (value.isNotEmpty) {
          // setState(() {
          //   currentText = value;
          //   error = "";
          //   hasError = false;
          // });
        }
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        return true;
      },
    );
    // return OtpTextField(
    //   autoFocus: true,
    //   fillColor: AppColors.primaryColor.withOpacity(0.1),
    //   filled: true,
    //   numberOfFields: 4,
    //   fieldWidth: 55,
    //   margin: const EdgeInsets.fromLTRB(2, 0, 4, 2),
    //   keyboardType: TextInputType.number,
    //   borderRadius: BorderRadius.circular(15),
    //   borderColor: Colors.transparent,
    //   focusedBorderColor: Colors.transparent,
    //   enabledBorderColor: Colors.transparent,
    //   disabledBorderColor: Colors.transparent,
    //   cursorColor: AppColors.primaryColor,
    //   showFieldAsBox: true,
    //   textStyle: TextStyle(
    //       fontSize: 30,
    //       fontFamily: 'Poppins',
    //       color: AppColors.primaryColor,
    //       fontWeight: FontWeight.w500),
    //   // bodyNormal.copyWith(fontSize: 22, fontFamily: "InterSemiBold"),
    //   //runs when a code is typed in
    //   onCodeChanged: (String code) {
    //     print("wds");
    //   },
    //   //runs when every textField is filled
    //   onSubmit: (String verificationCode) {
    //     // showCustomDialog(context, 'OTP Verified!', 'Continue', '');
    //     // Get.to(() => ResetPassword(controller: TextEditingController()));
    //   }, // end onSubmit
    // );
  }
}
