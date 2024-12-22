  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
Widget CustomTextField(BuildContext context,String title, TextEditingController controller) {

    return TextFormField(  
        maxLength: 200,
        onChanged: (value) {
          if (value.length > 200) {
            return;
          }
        },
        controller: controller,
        cursorColor: Colors.black,
       style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,   
        decoration: InputDecoration(
          counterText: "",
          floatingLabelBehavior: FloatingLabelBehavior.always,
     
          hintText:title, //getLang(context, "phoneNumber"),
         hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.only(
              left: 14.0, bottom: 10.0, top: 10.0, right: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(1)),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }