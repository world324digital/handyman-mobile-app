import 'package:handyman_provider_flutter/main.dart';
import 'package:handyman_provider_flutter/models/booking_detail_response.dart';
import 'package:handyman_provider_flutter/models/booking_list_response.dart';
import 'package:handyman_provider_flutter/models/dashboard_response.dart';
import 'package:handyman_provider_flutter/models/revenue_chart_data.dart';
import 'package:nb_utils/nb_utils.dart';

class HandymanDashBoardResponse {
  Commission? commission;

  List<RatingData>? handymanReviews;
  bool? status;
  num? todayBooking;
  num? totalBooking;
  num? totalRevenue;
  List<BookingData>? upcomingBookings;
  List<Configurations>? configurations;
  List<double>? chartArray;
  List<int>? monthData;
  PrivacyPolicy? privacyPolicy;
  PrivacyPolicy? termConditions;
  String? inquriyEmail;
  String? helplineNumber;
  List<LanguageOption>? languageOption;
  int? isHandymanAvailable;
  int? completedBooking;
  num? notification_unread_count;

  HandymanDashBoardResponse({
    this.commission,
    this.handymanReviews,
    this.notification_unread_count,
    this.status,
    this.todayBooking,
    this.totalBooking,
    this.configurations,
    this.totalRevenue,
    this.upcomingBookings,
    this.chartArray,
    this.monthData,
    this.privacyPolicy,
    this.termConditions,
    this.inquriyEmail,
    this.helplineNumber,
    this.languageOption,
    this.isHandymanAvailable,
    this.completedBooking,
  });

  HandymanDashBoardResponse.fromJson(Map<String, dynamic> json) {
    commission = json['commission'] != null ? Commission.fromJson(json['commission']) : null;
    configurations = json['configurations'] != null ? (json['configurations'] as List).map((i) => Configurations.fromJson(i)).toList() : null;
    handymanReviews = json['handyman_reviews'] != null ? (json['handyman_reviews'] as List).map((i) => RatingData.fromJson(i)).toList() : null;
    status = json['status'];
    todayBooking = json['today_booking'];
    totalBooking = json['total_booking'];
    totalRevenue = json['total_revenue'];
    notification_unread_count = json['notification_unread_count'];
    upcomingBookings = json['upcomming_booking'] != null ? (json['upcomming_booking'] as List).map((i) => BookingData.fromJson(i)).toList() : null;
    privacyPolicy = json['privacy_policy'] != null ? PrivacyPolicy.fromJson(json['privacy_policy']) : null;
    termConditions = json['term_conditions'] != null ? PrivacyPolicy.fromJson(json['term_conditions']) : null;
    inquriyEmail = json['inquriy_email'];
    helplineNumber = json['helpline_number'];
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];
    languageOption = json['language_option'] != null ? (json['language_option'] as List).map((i) => LanguageOption.fromJson(i)).toList() : null;
    isHandymanAvailable = json['isHandymanAvailable'];
    completedBooking = json['completed_booking'];

    chartArray = [];
    monthData = [];
    Iterable it = json['monthly_revenue']['revenueData'];

    it.forEachIndexed((element, index) {
      if ((element as Map).containsKey('${index + 1}')) {
        chartArray!.add(element[(index + 1).toString()].toString().toDouble());
        monthData!.add(index);
        chartData.add(RevenueChartData(month: months[index], revenue: element[(index + 1).toString()].toString().toDouble()));
      } else {
        chartData.add(RevenueChartData(month: months[index], revenue: 0));
      }
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['today_booking'] = this.todayBooking;
    data['total_booking'] = this.totalBooking;
    data['total_booking'] = this.totalBooking;
    data['completed_booking'] = this.completedBooking;
    if (this.privacyPolicy != null) {
      data['privacy_policy'] = this.privacyPolicy;
    }
    if (this.termConditions != null) {
      data['term_conditions'] = this.termConditions;
    }
    data['inquriy_email'] = this.inquriyEmail;
    data['helpline_number'] = this.helplineNumber;
    if (this.configurations != null) {
      data['configurations'] = this.configurations!.map((v) => v.toJson()).toList();
    }
    if (this.upcomingBookings != null) {
      data['upcomming_booking'] = this.upcomingBookings!.map((v) => v.toJson()).toList();
    }
    if (this.commission != null) {
      data['commission'] = this.commission!.toJson();
    }

    if (this.handymanReviews != null) {
      data['handyman_reviews'] = this.handymanReviews!.map((v) => v.toJson()).toList();
    }

    if (this.languageOption != null) {
      data['language_option'] = this.languageOption!.map((v) => v.toJson()).toList();
    }
    data['isHandymanAvailable'] = this.isHandymanAvailable;

    return data;
  }
}

class Commission {
  int? commission;
  String? createdAt;
  String? deletedAt;
  int? id;
  String? name;
  int? status;
  String? type;
  String? updatedAt;

  Commission({this.commission, this.createdAt, this.deletedAt, this.id, this.name, this.status, this.type, this.updatedAt});

  factory Commission.fromJson(Map<String, dynamic> json) {
    return Commission(
      commission: json['commission'],
      createdAt: json['created_at'],
      deletedAt: json['deleted_at'],
      id: json['id'],
      name: json['name'],
      status: json['status'],
      type: json['type'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commission'] = this.commission;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
