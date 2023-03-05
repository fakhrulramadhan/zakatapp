import 'dart:async';
import 'package:example/module/main/widget/main_view_navigation_item.dart';
import 'package:flutter/material.dart';

class MainViewListItem extends StatefulWidget {
  final String title;
  final List items;
  final Widget? head;
  final Color? color;
  const MainViewListItem({
    Key? key,
    required this.title,
    required this.items,
    this.head,
    this.color,
  }) : super(key: key);

  @override
  State<MainViewListItem> createState() => _MainViewListItemState();
}

class _MainViewListItemState extends State<MainViewListItem> {
  bool expanded = false;
  bool rotated = false;

  header(String title) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 500),
      turns: (rotated && expanded ? -2 : 0) / 360,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: expanded ? Colors.orange : Colors.blueGrey[800],
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 12.0,
            ),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(64.0),
            ),
          ),
          onPressed: () {
            expanded = !expanded;
            setState(() {});
          },
          child: Row(
            children: [
              Expanded(
                child: Text(title),
              ),
              if (!expanded) const Icon(Icons.expand_more),
              if (expanded) const Icon(Icons.expand_less),
            ],
          ),
        ),
      ),
    );
  }

  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (expanded) {
        rotated = !rotated;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(widget.title),
        const SizedBox(
          height: 12.0,
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: expanded ? 1.0 : 0.0,
          child: Container(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                if (widget.head != null && expanded) ...[
                  widget.head!,
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
                LayoutBuilder(builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        widget.items.length,
                        (index) {
                          var item = widget.items[index];
                          var size = (constraints.biggest.width - (10 * 3)) / 4;
                          if (!expanded) {
                            size = 0;
                          }

                          return MainViewNavigationItem(
                            item: item,
                            size: size,
                            index: index,
                            color: widget.color,
                          );
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
