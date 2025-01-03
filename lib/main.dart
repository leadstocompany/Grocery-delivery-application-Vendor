import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';

import 'package:vendor_app/src/presentation/my_application.dart';

void main() 
{
   WidgetsFlutterBinding.ensureInitialized();
   ServiceLocator.setup();
  runApp(const MyApplication());
}

