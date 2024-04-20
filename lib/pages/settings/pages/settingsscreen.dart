import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:newsapp/core/config/constants.dart';
class settingsscreen extends StatelessWidget {
  const settingsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constants.theme.primaryColor,
        title: Text("Settings Screen",style: constants.theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Text("",style: constants.theme.textTheme.titleLarge,),

          ],
        ),
      ),
    );
  }
}
