import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/metier_repository.dart';
import 'data/services/metier_api_service.dart';
import 'presentation/providers/metier_providers.dart';
import 'presentation/screens/metiers_list_screen.dart';

void main() {
  final repository = MetierRepository(MetierApiService());

  runApp(ParcoursApiApp(repository: repository));
}

class ParcoursApiApp extends StatelessWidget {
  const ParcoursApiApp({super.key, required this.repository});

  final MetierRepository repository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MetierRepository>.value(value: repository),
        ChangeNotifierProvider<MetiersNotifier>(
          create: (_) => MetiersNotifier(repository),
        ),
      ],
      child: MaterialApp(
        title: 'Métiers API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
        home: const MetiersListScreen(),
      ),
    );
  }
}
