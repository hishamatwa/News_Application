import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticelsItem extends StatelessWidget {
  final String image;
  final String id;
  final String title;
  final String time;
  //final String description;

  const ArticelsItem({super.key, required this.image, required this.title, required this.id, required this.time, });



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            height: 233,
            width: size.width,
            color: Colors.black,
            child: Image.network(image)
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(id,style:theme.textTheme.bodySmall!.copyWith(color: Color(0xFF79828B),fontSize: 20),),

          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(title,style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.w500), ),),

          Container(
            alignment: Alignment.bottomRight,
            child: Text(time,style: theme.textTheme.bodyMedium!.copyWith(color: Color(0xFFA3A3A3),fontWeight: FontWeight.w500), ),),


        ],

      ),
    );
  }
}