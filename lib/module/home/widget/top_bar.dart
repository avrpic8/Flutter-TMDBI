import 'package:flutter/material.dart';
import 'package:flutter_tmdbi/module/home/widget/category_select.dart';
import 'package:flutter_tmdbi/module/home/widget/search_.dart';

class TopBar extends StatelessWidget {

  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double heightDevice = MediaQuery.of(context).size.height;

    return Container(
      height: heightDevice * 0.15,
      child: Center(
        child: Container(
          height: heightDevice * 0.08,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const[
              Search(),
              CategorySelect(),
            ],
          ),
        ),
      ),
    );
  }  
}
