import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Profile { development, production }

@immutable
class Constants {
  const Constants._({
    required this.endpoint,
    required this.apiKey,
  });

  factory Constants.of() {
    final profile = EnumToString.fromString(
      Profile.values, 'development',
      // const String.fromEnvironment('ENV'),
    );

    switch (profile) {
      case Profile.development:
        return Constants._dev();
      case Profile.production:
      default:
        return Constants._prd();
    }
  }

  factory Constants._dev() {
    return const Constants._(
      endpoint: 'https://thirosue.github.io/hosting-image2/flutter_study',
      apiKey: '98c8df982b8b4da8b86cd70e851fc521',
    );
  }

  factory Constants._prd() {
    return const Constants._(
      endpoint: 'https://thirosue.github.io/hosting-image2/flutter_study',
      apiKey: '4bc454db94464956aea4cbb01f4bf9f4',
    );
  }

  static final Constants instance = Constants.of();

  final String endpoint;
  final String apiKey;
}
