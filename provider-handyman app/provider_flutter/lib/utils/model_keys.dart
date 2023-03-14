class CommonKeys {
  static String id = 'id';
  static String address = 'address';
  static String serviceId = 'service_id';
  static String customerId = 'customer_id';
  static String providerId = 'provider_id';
  static String bookingId = 'booking_id';
  static String handymanId = 'handyman_id';
  static String userId = 'user_id';
  static String type = 'type';
}

class UserKeys {
  static String firstName = 'first_name';
  static String lastName = 'last_name';
  static String userName = 'username';
  static String email = 'email';
  static String password = 'password';
  static String userType = 'user_type';
  static String providerTypeId = 'providertype_id';
  static String handymanTypeId = 'handymantype_id';
  static String status = 'status';
  static String providerId = 'provider_id';
  static String contactNumber = 'contact_number';
  static String address = 'address';
  static String countryId = 'country_id';
  static String stateId = 'state_id';
  static String cityId = 'city_id';
  static String oldPassword = 'old_password';
  static String newPassword = 'new_password';
  static String profileImage = 'profile_image';
  static String playerId = 'player_id';
  static String serviceAddressId = 'service_address_id';
  static String uid = 'uid';
  static String designation = 'designation';
  static String knownLanguages = 'known_languages';
  static String skills = 'skills';
  static String description = 'description';
}

class BookingServiceKeys {
  static String description = 'description';
  static String couponId = 'coupon_id';
  static String date = 'date';
  static String totalAmount = 'total_amount';
  static String extraCharges = 'extra_charges';
}

class BookingStatusKeys {
  static String pending = 'pending';
  static String accept = 'accept';
  static String onGoing = 'on_going';
  static String inProgress = 'in_progress';
  static String hold = 'hold';
  static String rejected = 'rejected';
  static String failed = 'failed';
  static String complete = 'completed';
  static String cancelled = 'cancelled';
  static String all = 'all';
  static String paid = 'paid';
  static String pendingApproval = "pending_approval";
}

class BookingUpdateKeys {
  static String date = 'date';
  static String description = 'description';
  static String startDate = 'start_date';
  static String endDate = 'end_date';
  static String reason = 'reason';
  static String status = 'status';
  static String startAt = 'start_at';
  static String endAt = 'end_at';
  static String durationDiff = 'duration_diff';
  static String paymentStatus = 'payment_status';
}

class NotificationKey {
  static String type = 'type';
  static String page = 'page';
}

class AddServiceKey {
  static String id = 'id';
  static String serviceId = 'service_id';
  static String name = 'name';
  static String providerId = 'provider_id';
  static String categoryId = 'category_id';
  static String subCategoryId = 'subcategory_id';
  static String type = 'type';
  static String price = 'price';
  static String discountPrice = 'discount';
  static String description = 'description';
  static String isFeatured = 'is_featured';
  static String isSlot = 'is_slot';
  static String status = 'status';
  static String duration = 'duration';
  static String attachmentCount = 'attachment_count';
  static String serviceAttachment = 'service_attachment_';
  static String providerAddressId = ' provider_address_id';
  static String attchments = 'attchments';
}

class AddAddressKey {
  static String id = 'id';
  static String providerId = 'provider_id';
  static String latitude = 'latitude';
  static String longitude = 'longitude';
  static String status = 'status';
  static String address = 'address';
}

class AddDocument {
  static String documentId = 'document_id';
  static String isVerified = 'is_verified';
  static String providerDocument = 'provider_document';
}

class Subscription {
  static String planId = "plan_id";
  static String title = "title";
  static String identifier = "identifier";
  static String amount = "amount";
  static String type = "type";
  static String paymentType = "payment_type";
  static String txnId = "txn_id";
  static String paymentStatus = "payment_status";
  static String otherTransactionDetail = "other_transaction_detail";
}

class SaveBookingAttachment {
  static String title = 'title';
  static String description = 'description';
  static String bookingAttachment = 'booking_attachment_';
}

class SaveBidding {
  static String postRequestId = 'post_request_id';
  static String providerId = 'provider_id';
  static String price = 'price';
}

class PostJob {
  static String postRequestId = 'post_request_id';
  static String postTitle = 'title';
  static String description = 'description';
  static String serviceId = 'service_id';
  static String price = 'price';
  static String status = 'status';
  static String providerId = 'provider_id';
}

class PackageKey {
  static String packageId = "id";
  static String categoryId = 'category_id';
  static String subCategoryId = 'subcategory_id';
  static String name = "name";
  static String description = 'description';
  static String price = 'price';
  static String serviceId = 'service_id';
  static String startDate = "start_date";
  static String endDate = "end_date";
  static String status = 'status';
  static String isFeatured = 'is_featured';
  static String packageAttachment = 'package_attachment_';
  static String attachmentCount = 'attachment_count';
  static String packageType = 'package_type';
  static String removePackageAttachment = 'package_attachment';
}


class AddBlogKey {
  static String attachmentCount = 'attachment_count';
  static String blogAttachment = 'blog_attachment_';
  static String id = 'id';
  static String title = 'title';
  static String description = 'description';
  static String isFeatured = 'is_featured';
  static String status = 'status';
  static String providerId = 'provider_id';
  static String authorId = 'author_id';
  static String blogId = 'blog_id';
}