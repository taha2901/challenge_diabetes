import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldDropdown extends StatelessWidget {
  CustomTextFieldDropdown({super.key, this.mealname});

  String? selectedItem;
Function(String?)? mealname;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          disabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(10)
      ),
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
    
        hint: const Text("توقيت الوجبه"),
         value: selectedItem,
         items: ["بعد الوجبه","قبل الوجبه"].map((e){
           return DropdownMenuItem<String>(
             value: e,
             child: Text(e),
           );
         }).toList(),
          onChanged: (value){
            mealname!(value);

          },
          validator: (value){
              if (value == null) {
                return 'Please select an option';
              }
              return null; 
            }
          ),
    );
  }
}
