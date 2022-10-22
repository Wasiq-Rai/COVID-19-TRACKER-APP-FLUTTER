import 'package:flutter/material.dart';
class DepartmentsList extends StatefulWidget {
  const DepartmentsList({Key? key}) : super(key: key);

  @override
  State<DepartmentsList> createState() => _DepartmentsListState();
}

class _DepartmentsListState extends State<DepartmentsList> {
  var departments = ['Computer Science','Software Engineering','Chemical Engineering',
    "BBA",
    "Engineering – BE, B. Tech and B. Arch",
    "Computer Application-BCA",
    "Designing – Fashion/Interior/Web",
    "Mass-Communication/Journalism BJMC",
    "Hospitality (Hotel) – Hotel Management",
    "Medical-BDS and MBBS",
    "Finance -B,Com/CA",];
  var dropdownValue='Computer Science';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(

          decoration: InputDecoration(
              helperText: 'Choose Department or degree',
              label: Text('Department')
          ),

          focusColor: Colors.green,
          value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: departments.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),

          onChanged: (String? value){
            setState(() {
              dropdownValue=value!;
            });
          }),
    );
  }
}
