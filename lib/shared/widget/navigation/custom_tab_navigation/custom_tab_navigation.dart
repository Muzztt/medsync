// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui_test_test/core.dart';

class CustomTabNavigation extends StatefulWidget {
  final List<String> headers;
  final List<Widget> children;
  const CustomTabNavigation({
    Key? key,
    required this.headers,
    required this.children,
  }) : super(key: key);

  @override
  State<CustomTabNavigation> createState() => _CustomTabNavigationState();
}

class _CustomTabNavigationState extends State<CustomTabNavigation> {
  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: List.generate(
                widget.headers.length,
                (index) {
                  var header = widget.headers[index];
                  bool selected = selectedIndex == index;
                  if (selected)
                    return InkWell(
                      onTap: () => updateIndex(index),
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          border: Border(
                            left: BorderSide(
                              width: 1.0,
                              color: Colors.grey[300]!,
                            ),
                            top: BorderSide(
                              width: 1.0,
                              color: Colors.grey[300]!,
                            ),
                            right: BorderSide(
                              width: 1.0,
                              color: Colors.grey[300]!,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "$header",
                            style: TextStyle(
                              color: infoColor,
                            ),
                          ),
                        ),
                      ),
                    );

                  return InkWell(
                    onTap: () => updateIndex(index),
                    child: Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: Color(0xfff3f3f3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[300]!,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "$header",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
            child: IndexedStack(
          index: selectedIndex,
          children: widget.children,
        )),
      ],
    );
  }
}
