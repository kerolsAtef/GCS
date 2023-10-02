import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DateTimeSearchCustomTextField extends StatefulWidget {
  DateTimeSearchCustomTextField({
    super.key,
    required this.hint,
    required this.fieldIcon,
    required this.editController
  });
  Icon fieldIcon;
  String hint;
  TextEditingController editController;


  @override
  State<DateTimeSearchCustomTextField> createState() => _DateTimeSearchCustomTextFieldState();
}
class _DateTimeSearchCustomTextFieldState extends State<DateTimeSearchCustomTextField> {
  DateTime? _selectedDate;
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
        widget.editController.text = _selectedDate.toString(); // You can format the date as you like
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.w),
        child: TextField(
          controller: widget.editController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: widget.fieldIcon, // Replace with your desired icon
            ),
            hintText: widget.hint,
          ),
          onTap: ()=> _selectDate(context),
        ),
      ),
    );
  }
}
