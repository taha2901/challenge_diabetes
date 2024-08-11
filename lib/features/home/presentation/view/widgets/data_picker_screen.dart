import 'package:flutter/material.dart';

class MyDatePickerScreen extends StatefulWidget {
  @override
  _MyDatePickerScreenState createState() => _MyDatePickerScreenState();
}
Color? fillColor;
class _MyDatePickerScreenState extends State<MyDatePickerScreen> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Selected Date: ${_selectedDate.toLocal()}',
        //   style: TextStyle(fontSize: 20),
        // ),
        const SizedBox(height: 20),
        TextFormField(
          textAlign: TextAlign.center,
          onTap: () => _selectDate(context),
          
          readOnly: true,
          decoration: const InputDecoration(
            filled: true,
            // fillColor: Colors.grey,
            hintText: 'أختر تاريخ',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.date_range,color: Colors.black,)
          ),
        ),
      ],
    );
  }
}
