import 'package:flutter/material.dart';

import '../core/config/env_config.dart';
import '../core/network/network_debug_state.dart';
import '../core/storage/token_storage.dart';

class DebugApiPage extends StatefulWidget {
  const DebugApiPage({super.key, TokenStorage? tokenStorage})
      : _tokenStorage = tokenStorage;

  final TokenStorage? _tokenStorage;

  @override
  State<DebugApiPage> createState() => _DebugApiPageState();
}

class _DebugApiPageState extends State<DebugApiPage> {
  late final TokenStorage _tokenStorage;
  bool _hasToken = false;

  @override
  void initState() {
    super.initState();
    _tokenStorage = widget._tokenStorage ?? AppTokenStorage();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await _tokenStorage.readAccessToken();
    if (!mounted) return;
    setState(() {
      _hasToken = (token ?? '').isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug API')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InfoTile(label: 'Environnement', value: EnvConfig.environmentLabel),
          _InfoTile(label: 'Base URL', value: EnvConfig.baseUrl),
          _InfoTile(label: 'Token', value: _hasToken ? 'présent' : 'absent'),
          ValueListenableBuilder<int?>(
            valueListenable: NetworkDebugState.lastStatusCode,
            builder: (_, code, __) {
              return _InfoTile(label: 'Dernier HTTP code', value: '${code ?? '-'}');
            },
          ),
          ValueListenableBuilder<String?>(
            valueListenable: NetworkDebugState.lastErrorMessage,
            builder: (_, message, __) {
              return _InfoTile(
                label: 'Dernière erreur réseau',
                value: (message ?? '').isEmpty ? '-' : message!,
              );
            },
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _loadToken,
            child: const Text('Rafraîchir'),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }
}
