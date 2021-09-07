import 'package:flutter/material.dart';
import 'package:online_shop_app/form-creation/models/ckbmodel.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  final allCheckBox = CheckBoxModel(title: 'AllCheck'); //single checkbox
  final checkBoxList = [
    //list of checkboxes
    CheckBoxModel(title: 'Python'),
    CheckBoxModel(title: 'Java'),
    CheckBoxModel(title: 'C/C++'),
    CheckBoxModel(title: 'HTML'),
    CheckBoxModel(title: 'CSS'),
    CheckBoxModel(title: 'JavaScript'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      //used ListView for giving scrollable action on checkbox part and to implement multiple checkbox at once by using list.
      children: [
        //SINGLE CHECKBOX
        ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            //VisualDensity class used to get checkboxes closer to each other by both horizontal/vertical way.
            onTap: () => onAllClicked(allCheckBox),
            leading: Transform.scale(
              scale: 0.7,
              child: Checkbox(
                value: allCheckBox.value,
                onChanged: (value) => onAllClicked(allCheckBox),
              ),
            ),
            title: Align(
              alignment: Alignment.topLeft,
              child: Text(
                allCheckBox.title,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
            )),
        Divider(color: Colors.black, thickness: 1.0),
        //CHECKBOX LIST
        ...checkBoxList
            .map((item) => ListTile(
                visualDensity: VisualDensity(horizontal: -2, vertical: -4),
                onTap: () => onItemClicked(item),
                leading: Transform.scale(
                  scale: 0.7,
                  child: Checkbox(
                    value: item.value,
                    onChanged: (value) => onItemClicked(item),
                  ),
                ),
                title: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    item.title,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                )))
            .toList(),
        // SizedBox(height: 40.0),
      ],
    );
  }

  onAllClicked(CheckBoxModel ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxModel ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if (!newValue) {
        //Here this is list checkbox if any of checkbox in list not checked then allcheked box will be unchecked.
        allCheckBox.value = false;
      } else {
        //Here if all checkboxes in list are checked then allcheked box will be checked too.
        final allListCheckbox = checkBoxList.every((element) => element.value);
        allCheckBox.value = allListCheckbox;
      }
    });
  }
}

/*
Here CheckBoxes(single as well as listOfCheckbox) have been created on class named CheckBox which extends statefull widget.
*/
