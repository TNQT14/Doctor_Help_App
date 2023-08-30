import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

class RadioButtonGroup extends StatefulWidget {
  final String option1;
  final String option2;
  final void Function(String) onChanged;

  RadioButtonGroup({
    required this.option1,
    required this.option2,
    required this.onChanged,
  });

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  String? currentOption;

  @override
  void initState() {
    super.initState();
    currentOption = widget.option1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentOption = widget.option1;
                widget.onChanged(widget.option1);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: currentOption == widget.option1
                      ? colorSelectedOption
                      : Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(widget.option1),
                value: widget.option1,
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value as String?;
                    widget.onChanged(value!);
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentOption = widget.option2;
                widget.onChanged(widget.option2);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: currentOption == widget.option2
                      ? colorSelectedOption
                      : Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(widget.option2),
                value: widget.option2,
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value as String?;
                    widget.onChanged(value!);
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}



