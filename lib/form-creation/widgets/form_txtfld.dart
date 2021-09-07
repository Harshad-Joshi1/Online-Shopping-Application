import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

final requiredValid = RequiredValidator(errorText: 'required');
final emailValid = EmailValidator(errorText: 'invalid');
final minLenValid = MaxLengthValidator(6, errorText: 'Min length exceeded');
final dobValid = DateValidator('dd-mm-yyy', errorText: 'invalid');

Widget form(String text, requiredValid, emailValid, minLenValid, dobValid) {
  return Form(
    // key: _formKey,               //can't use _formKey from other page || _formKey has been used to validate formfield // to use it have to implement form & button which uses _formKey in a same page.
    autovalidate:
        true, //used to validate all 'validator textfield' automatically without using any function.
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        validator: MultiValidator([requiredValid]),
        autocorrect: false,
        autofocus: false,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: 11.0, color: Colors.black),
        decoration: InputDecoration(
            labelText: '$text',
            labelStyle: TextStyle(color: Colors.black, fontSize: 10),
            isDense:
                true, //isDense property should be true then only we can give padding for inneer content.
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            filled:
                true, //filled property should be true then only we can fill the color.
            fillColor: Colors.white,
            border:
                OutlineInputBorder() //used to make a box from a line for text fields.
            ),
      ),
    ),
  );
}


/*
Here custom Widget has been created for making use of multiple textFormField in anywhere.
*/