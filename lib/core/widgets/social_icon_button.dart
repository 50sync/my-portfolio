import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.url,
    this.icon,
    this.svgIcon,
  });
  final String url;
  final IconData? icon;
  final String? svgIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri parsedUrl = Uri.parse(url);
        await launchUrl(parsedUrl);
      },
      child: SizedBox(
        height: 30,
        width: 30,
        child: svgIcon != null
            ? SvgPicture.asset(
                'assets/images/$svgIcon.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              )
            : Icon(icon ?? Icons.abc, color: Colors.white, size: 30),
      ),
    );
  }
}
