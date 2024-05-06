import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/AppBar.dart';
import '../Components/UserSettingRow.dart';


class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Mitt Konto',
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //radius of the container
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.05)),
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/user.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saqib Javed',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Saqibjaved19078@gmail.com',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '+92 343 0006006',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


          ),
          SizedBox(height: 10),

// User Setting List with icon
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),

            child: Column(
              children: [

                UserSettingRow(
                  svgAsset: 'assets/icons/setting.svg',
                  name: ' Kontoinstallningar',

                ),
                UserSettingRow(
                  svgAsset: 'assets/icons/payment.svg',
                  name: 'Mina betalmetoder',

                ),
                UserSettingRow(
                  svgAsset: 'assets/icons/support.svg',
                  name: ' Support',

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
