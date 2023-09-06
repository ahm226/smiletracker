import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';

class CountryCodePicker extends StatefulWidget {
  const CountryCodePicker({super.key});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String _countryCode = '';
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        if (_phoneController.text.isNotEmpty &&
            _phoneController.text.startsWith('0')) {
          print('_PHONECONTROLLER: ${_phoneController.text}');
          _phoneController.clear();
          setState(() {});
          return;
        }

        setState(() {
          _countryCode = number.dialCode.toString();
        });
      },
      onInputValidated: (bool value) {},
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        setSelectorButtonAsPrefixIcon: true,
      ),
      ignoreBlank: true,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      hintText: 'Phone Number',
      initialValue: number,
      inputDecoration: InputDecoration(
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 20, minHeight: 20, minWidth: 60),
          fillColor: AppColors.primaryColor.withOpacity(0.1),
          filled: true,
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent, // Make the border transparent
              width: 0, // Set the width to 0 to make it disappear
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent, // Make the border transparent
              width: 0, // Set the width to 0 to make it disappear
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent, // Make the border transparent
              width: 0, // Set the width to 0 to make it disappear
            ),
          ),
          hintText: 'Phone Number',
          hintStyle: const TextStyle(color: Colors.grey)),
      textStyle: const TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      spaceBetweenSelectorAndTextField: 0,
      validator: (String? value) => CustomValidator.number(value),
      textFieldController: _phoneController,
      formatInput: true,
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      inputBorder: InputBorder.none,
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    );
  }
}
