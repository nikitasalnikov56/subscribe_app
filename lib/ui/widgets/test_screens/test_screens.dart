import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/community_features/community_features.dart';
import 'package:flutter_application_1/ui/widgets/free_or_paid_version/free_or_paid_version.dart';
import 'package:flutter_application_1/ui/widgets/notification_services/notification_services.dart';
import 'package:flutter_application_1/ui/widgets/services_platforms/services_platforms.dart';
import 'package:flutter_application_1/ui/widgets/services_quantity/services_quantity.dart';
import 'package:flutter_application_1/ui/widgets/subscription_challenges/subscription_challenges.dart';
import 'package:flutter_application_1/ui/widgets/subscription_features/subscription_features.dart';
import 'package:flutter_application_1/ui/widgets/subscription_important/subscription_important.dart';
import 'package:flutter_application_1/ui/widgets/subscription_service/subscription_service.dart';
import 'package:flutter_application_1/ui/widgets/subscription_time/subscription_time.dart';

class TestScreens {
  List<Widget> screens = [
    const SubscriptionService(),
    const SubscriptionTime(),
    const SubscriptionFeatures(),
    const ServicesQuantity(),
    const ServicesPlatforms(),
    const SubscriptionChallenges(),
    const SubscriptionImportant(),
    const FreeOrPaidVersion(),
    const NotificationServices(),
    const CommunityFeatures(),
  ];
}
