import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  final List<String> option;
  final String hintText;
  final Function(String) onSelected;
  const BaseSelect(
      {super.key,
      required this.option,
      required this.hintText,
      required this.onSelected});

  @override
  BaseSelectState createState() => BaseSelectState();
}

class BaseSelectState extends State<BaseSelect> {
  String? value;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: value,
          hint: Text(widget.hintText),
          onChanged: (String? newValue) {
            setState(() {
              value = newValue;
            });
            widget.onSelected(newValue!);
          },
          items: widget.option.map<DropdownMenuItem<String>>((select) {
            return DropdownMenuItem<String>(
              value: select,
              child: Text(select),
            );
          }).toList(),
        ));
  }
}
