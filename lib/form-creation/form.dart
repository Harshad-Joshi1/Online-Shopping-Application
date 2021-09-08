import 'package:flutter/material.dart';
import 'package:online_shop_app/form-creation/widgets/checkbox.dart';
import 'package:online_shop_app/form-creation/widgets/date_time.dart';
import 'package:online_shop_app/form-creation/widgets/form_txtfld.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey =
      GlobalKey<FormState>(); //created Global key to validate textfields
  void register() {
    //validation function
    if (_formKey.currentState!.validate()) {
      //if all textfield validates correctly will print below text.
      print('successfully registered');
    } else {
      //if not validates correctly will print below text.
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Scaffold class has been implemented to provide the basic material design layout for this application.
        body: Container(
      color: Colors.grey[200],
      child: Row(children: [
        Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                //MediaQuiery used for the expantion of image in vertical way.
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/111.jpg"),
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.indigoAccent[100],
              child: Expanded(
                child: Column(
                  children: [
                    //HEADING as REGISTRATION FORM
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 0.0, bottom: 8.0),
                      child: Text(
                        'REGISTRATION FORM',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                    ),
                    //VARIOUS TextFormFields
                    form("FULL NAME", requiredValid, emailValid, null, null),
                    DateTimePicker(),
                    /*
                    imported from 'package:online_shop_app/form-creation/widgets/date_time.dart'
                    it's a class of statefull widget which is for getting DATE in a textformfield.
                    */
                    form("DEPT", requiredValid, emailValid, null, null),
                    form("YEAR O STUDYING", requiredValid, null, null, null),
                    form("COLLEGE NAME", requiredValid, emailValid, null, null),
                    form("EMAIL-ID", requiredValid, emailValid, null, null),
                    //SUB HEADING for interest
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'AREA OF INTEREST',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    //CHECKBOX
                    Expanded(
                      child: CheckBox(),
                      /*
                      imported from 'package:online_shop_app/form-creation/widgets/checkbox.dart'
                      it's a class of statefull widget which is for getting checkboxes.
                      */
                    ),
                    Divider(
                        color: Colors.black,
                        thickness:
                            1.0), //implemented to divide sub widgets(checkbox) for less confussion on UI.
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: MaterialButton(
                        onPressed: () =>
                            register(), //onClick on this button it validates all the textformfields.
                        color: Colors.white,
                        splashColor: Colors.indigoAccent,
                        child: Text(
                          'REGISTER',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    //IT'S THERE FOR MY CONCERN || HAVE TO IMPLEMENT IN FUTURE USING THIS.
                    // Expanded(
                    //   child: Align(
                    //       alignment: FractionalOffset.bottomCenter,
                    //       child: Padding(
                    //         padding: EdgeInsets.only(bottom: 5.0),
                    //         child: MaterialButton(
                    //           onPressed: () {},
                    //           color: Colors.white,
                    //           splashColor: Colors.indigoAccent,
                    //           child: Text(
                    //             'REGISTER',
                    //             style: TextStyle(fontSize: 16),
                    //           ),
                    //         ),
                    //       )),
                    // ),
                  ],
                ),
              )),
        )
      ]),
    ));
  }
}


/*
here all details such as (UserFullName, DateOfBirth, Department, YearOfStudying, CollegeName, EmailId) of users will be collected as registration form.
*/
