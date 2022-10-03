import 'package:credwise/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget creditCardField({
  TextEditingController? controller,
  Function(String)? onChanged,
  size,
  String? Function(String?)? validator,
}) {
  return Stack(
    children: [
      Container(
        height: 30,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      SizedBox(
          height: 30,
          width: size.width * 0.2,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'xxxx',
              contentPadding: const EdgeInsets.all(5),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: blueColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
              FilteringTextInputFormatter.digitsOnly,
            ],
          )),
    ],
  );
}
