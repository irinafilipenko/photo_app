import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/components/widgets/custom_alert_dialog.dart';
import 'package:photo_app/components/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Drawer(
      backgroundColor: customColors!.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 56,
                // padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: customColors.onSurfaceVariant),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/1.jpg'),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User name',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: customColors.onSurface),
                          ),
                          Text(
                            'example@email.com',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: customColors.onSurface),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Flexible(
                flex: 0,
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/icon.svg', // Path to your SVG file in assets
                    width: 16,
                    height: 16,
                    // ignore: deprecated_member_use
                    color: customColors.onSurfaceVariant,
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: customColors.onSurfaceVariant),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomAlertDialog();
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
