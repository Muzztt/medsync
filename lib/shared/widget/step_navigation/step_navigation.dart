import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../../core.dart';

class StepNavigation extends StatefulWidget {
  final List<String> navigations;
  final List<Widget> children;
  final int initialIndex;
  StepNavigation({
    Key? key,
    required this.navigations,
    required this.children,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<StepNavigation> createState() => StepNavigationController();
}

class StepNavigationController extends State<StepNavigation> {
  static late StepNavigationController instance;
  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  double get progress {
    return (selectedIndex + 1) / widget.navigations.length;
  }

  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    instance = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (selectedIndex > 0) {
                      setState(() {
                        selectedIndex--; // Kurangi indeks untuk kembali ke langkah sebelumnya
                      });
                    } else {
                      Navigator.pop(
                          context); // Kembali ke layar sebelumnya jika tidak ada langkah sebelumnya dalam langkah navigasi
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 18.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: List.generate(widget.navigations.length, (index) {
                      var navigationName = widget.navigations[index];
                      bool selected = selectedIndex == index;
                      return Row(
                        children: [
                          if (!selected)
                            InkWell(
                              onTap: () => updateIndex(index),
                              child: CircleAvatar(
                                backgroundColor: infoColor,
                                radius: 12,
                                child: Icon(
                                  MdiIcons.check,
                                  size: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          if (selected) ...[
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: infoColor,
                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              "$navigationName",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                          if (index < widget.navigations.length - 1)
                            Container(
                              height: 2,
                              width: 16,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffe9e9e9),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  width: MediaQuery.of(context).size.width * progress,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xfffe9039),
                        Color(0xfff7586a),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}
