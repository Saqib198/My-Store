import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//User Setting Row Widget having icon and name and on tap
class UserSettingRow extends StatelessWidget {
  final String svgAsset;
  final String name;


  UserSettingRow({
    required this.svgAsset,
    required this.name,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            svgAsset,

          ),
          SizedBox(width: 20),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
