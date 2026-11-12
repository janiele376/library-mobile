
import 'package:flutter/material.dart';

import '../../../core/services/auth/session_service.dart';
import '../../../core/services/routes/app_routes.dart';

class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({super.key});

  // Encerrar a sessão do usuário.
  Future<void> _logout(BuildContext context) async {
    await SessionService.logout();

    if (!context.mounted) return;

    // Voltar ao login e remover as telas anteriores.
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca Dashboard'),

        // Botão de logout.
        actions: [
          IconButton(
            tooltip: 'Sair da conta',
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: const Center(
        child: Text('Dashboard do Usuário'),
      ),
    );
  }
}
