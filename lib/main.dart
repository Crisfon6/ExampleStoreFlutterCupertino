import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import './src/app.dart';
import './src/models/app_state_model.dart';

void main() {
  runApp(ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(), child: SmartFit()));
}
