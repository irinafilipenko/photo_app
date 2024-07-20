import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/components/custom_alert_dialog.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF4F3F7),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // padding: EdgeInsets.zero,
            children: [
              Container(
                height: 56,
                // padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF43474E)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/1.jpg'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User name',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1A1C1E)),
                          ),
                          Text(
                            'example@email.com',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1A1C1E)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Flexible(
                flex: 0,
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/icon.svg', // Path to your SVG file in assets
                    width: 16,
                    height: 16,
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF43474E)),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
