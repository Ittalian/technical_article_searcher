import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  final List<String> option;
  final String hintText;
  final Function(String) onSelected;
  final String? initText;
  const BaseSelect({
    super.key,
    required this.option,
    required this.hintText,
    required this.onSelected,
    this.initText,
  });

  @override
  BaseSelectState createState() => BaseSelectState();
}

class BaseSelectState extends State<BaseSelect> {
  String? value;

  @override
  void initState() {
    super.initState();
    if (widget.option.isNotEmpty && widget.initText != null) {
      value = widget.initText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.hintText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            value: value,
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
          ),
        ),
      ],
    );
  }
}
