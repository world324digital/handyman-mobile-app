import 'package:flutter/material.dart';
import 'package:handyman_provider_flutter/components/cached_image_widget.dart';
import 'package:handyman_provider_flutter/main.dart';
import 'package:handyman_provider_flutter/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';

class OppsScreen extends StatefulWidget {
  const OppsScreen({Key? key}) : super(key: key);

  @override
  _OppsScreenState createState() => _OppsScreenState();
}

class _OppsScreenState extends State<OppsScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF5545B7));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              CachedImageWidget(
                url: noInternetImg,
                fit: BoxFit.cover,
                height: context.height(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${languages!.lblNoInternet}!..', style: secondaryTextStyle(color: white, size: 40)),
                  32.height,
                  Text(
                    languages!.lblNoInternet,
                    style: primaryTextStyle(color: Colors.white54, size: 18),
                  ).paddingAll(8),
                  32.height,
                  AppButton(
                    color: context.cardColor,
                    child: Text(languages!.lblRetry, style: boldTextStyle()),
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                    elevation: 30,
                    onTap: () async {
                      if (await isNetworkAvailable()) {
                        pop();
                      } else {
                        toast(errorInternetNotAvailable);
                      }
                    },
                  ),
                ],
              ).paddingAll(32),
            ],
          ),
        ),
      ),
    );
  }
}
