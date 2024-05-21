import 'package:flutter/material.dart';
import 'package:hyper_ui_test_test/core.dart';

class QRadioField2 extends StatefulWidget {
  final String label;
  final String? hint;
  final String? helper;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final Function(dynamic value, String? label) onChanged;
  final String? value;

  const QRadioField2({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.hint,
    this.helper,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QRadioField2> createState() => _QRadioField2State();
}

class _QRadioField2State extends State<QRadioField2> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      items.add(Map.from(item));
      if (items.last["value"] == widget.value) {
        items.last["checked"] = true;
      }
    }
  }

  setAllItemsToFalse() {
    for (var item in items) {
      item["checked"] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) => widget.validator!(items),
        enabled: true,
        builder: (FormFieldState<bool> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.label,
              errorText: field.errorText,
              border: InputBorder.none,
              helperText: widget.helper,
              hintText: widget.hint,
            ),
            child: Row(
              children: List.generate(
                items.length,
                (index) {
                  var item = items[index];
                  bool selected = item["checked"] == true;
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        setAllItemsToFalse();
                        item["checked"] = true;
                        setState(() {});
                        widget.onChanged(item["label"], item["value"]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: selected ? infoColor : Colors.white,
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey[300]!,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            item["label"],
                            style: TextStyle(
                              fontSize: 12.0,
                              color:
                                  selected ? Colors.white : secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
