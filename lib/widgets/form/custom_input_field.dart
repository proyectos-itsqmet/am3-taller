import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isDate;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isDate = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool obscureText = true;

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      widget.controller.text = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
      keyboardType: widget.keyboardType,
      style: TextStyle(color: Colors.white),
      readOnly: widget.isDate,
      obscureText: widget.isPassword ? obscureText : false,
      onTap: widget.isDate ? pickDate : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF2A2A2A),
        labelStyle: TextStyle(color: Colors.grey[400]),
        label: Text(widget.label),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey[700]!, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() {
                  obscureText = !obscureText;
                }),
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[400],
                ),
              )
            : widget.isDate
            ? Icon(Icons.calendar_today, color: Colors.grey[400])
            : null,
      ),
    );
  }
}
