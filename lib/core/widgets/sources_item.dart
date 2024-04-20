import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String source;
  const TabItem({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(source,style:theme.textTheme.bodyLarge ,)),
          ),
        ],
      ),
    );
  }
}