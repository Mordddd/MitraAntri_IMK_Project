import 'package:flutter/material.dart';

class ServiceCategory {
  const ServiceCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
    this.emoji = '',
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route;
  final String emoji;
}
