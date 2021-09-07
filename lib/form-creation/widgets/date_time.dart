import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? _date = null;
  final dateFormat = DateFormat('dd-mm-yyy');

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: TextFormField(
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //for current dateTime
                    firstDate: DateTime(
                        1967), //for initial year in calender|| calender starts from mentioned year
                    lastDate: DateTime(
                        2022), //for end uear in calender || calender stops on mentioned year
                    initialEntryMode: DatePickerEntryMode.input)
                .then((value) {
              //value returns the selected date
              setState(() {
                _date = value!;
                // print('Selected time is: $value');
              });
            });
          },
          autocorrect: false,
          autofocus: false,
          cursorColor: Colors.black,
          style: TextStyle(fontSize: 11.0, color: Colors.black),
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
              hintText:
                  (_date == null) ? "pick date!!" : dateFormat.format(_date!),
              //if user doesn't choose any date from calendar it return 'pick date!!' otherwise return choosen date with date format.
              hintStyle: TextStyle(color: Colors.black),
              labelText: 'DOB',
              labelStyle: TextStyle(color: Colors.black, fontSize: 10),
              isDense:
                  true, //isDense property should be true then only we can give padding for inneer content.
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              filled:
                  true, //filled property should be true then only we can fill the color.
              fillColor: Colors.white,
              suffixIcon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              border:
                  OutlineInputBorder() //used to make a box from a line for text fields.
              ),
        ),
      ),
    );
  }
}

/*
Here calender for DateOfBirth and Logic as well as TextFormField for dob have been created to get user dob.
*/
