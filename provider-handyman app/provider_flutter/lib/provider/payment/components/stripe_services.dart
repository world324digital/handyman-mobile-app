import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:handyman_provider_flutter/main.dart';
import 'package:handyman_provider_flutter/models/provider_subscription_model.dart';
import 'package:handyman_provider_flutter/models/stripe_pay_model.dart';
import 'package:handyman_provider_flutter/networks/network_utils.dart';
import 'package:handyman_provider_flutter/networks/rest_apis.dart';
import 'package:handyman_provider_flutter/utils/common.dart';
import 'package:handyman_provider_flutter/utils/configs.dart';
import 'package:handyman_provider_flutter/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

class StripeServices {
  ProviderSubscriptionModel? data;
  num totalAmount = 0;
  String stripeURL = "";
  String stripePaymentKey = "";
  bool isTest = false;

  init({
    required String stripePaymentPublishKey,
    ProviderSubscriptionModel? providerData,
    required num totalAmount,
    required String stripeURL,
    required String stripePaymentKey,
    required bool isTest,
  }) async {
    Stripe.publishableKey = stripePaymentPublishKey;

    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';

    await Stripe.instance.applySettings().catchError((e) {
      return e;
    });

    this.data = providerData;
    this.totalAmount = totalAmount;
    this.stripeURL = stripeURL;
    this.stripePaymentKey = stripePaymentKey;
    this.isTest = isTest;
  }

  //StripPayment
  void stripePay({VoidCallback? onPaymentComplete}) async {
    http.Request tempRequest = http.Request(HttpMethod.POST.name, Uri.parse(stripeURL));

    tempRequest.headers.addAll(buildHeaderTokens(isStripePayment: true, stripeKeyPayment: stripePaymentKey));

    tempRequest.bodyFields = {
      'amount': '${(totalAmount.toInt() * 100)}',
      'currency': isIqonicProduct ? STRIPE_CURRENCY_CODE : '${appStore.currencyCode}',
    };

    await tempRequest.send().then((value) {
      appStore.setLoading(false);

      http.Response.fromStream(value).then((response) async {
        if (response.statusCode.isSuccessful()) {
          StripePayModel res = StripePayModel.fromJson(await handleResponse(response));

          SetupPaymentSheetParameters setupPaymentSheetParameters = SetupPaymentSheetParameters(
            paymentIntentClientSecret: res.clientSecret.validate(),
            style: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            appearance: PaymentSheetAppearance(colors: PaymentSheetAppearanceColors(primary: primaryColor)),
            applePay: PaymentSheetApplePay(merchantCountryCode: STRIPE_MERCHANT_COUNTRY_CODE),
            googlePay: PaymentSheetGooglePay(merchantCountryCode: STRIPE_MERCHANT_COUNTRY_CODE, testEnv: isTest),
            merchantDisplayName: APP_NAME,
            customerId: appStore.userId.toString(),
            customerEphemeralKeySecret: isAndroid ? res.clientSecret.validate() : null,
            setupIntentClientSecret: res.clientSecret.validate(),
          );

          await Stripe.instance.initPaymentSheet(paymentSheetParameters: setupPaymentSheetParameters).then((value) async {
            await Stripe.instance.presentPaymentSheet().then((value) async {
              await savePayment(data: data, paymentMethod: PAYMENT_METHOD_STRIPE, paymentStatus: SERVICE_PAYMENT_STATUS_PAID);
              onPaymentComplete?.call();
            });
          });
        } else if (response.statusCode == 400) {
          toast(response.body, print: true);
          toast(languages!.lblStripeTestCredential);
        }
      });
    }).catchError((e) {
      appStore.setLoading(false);
      toast(e.toString(), print: true);
    });
  }
}

StripeServices stripeServices = StripeServices();
