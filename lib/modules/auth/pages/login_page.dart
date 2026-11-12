
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../core/widgets/app_header.dart';
import '../../../core/widgets/app_footer.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppHeader(
        pageTitle: l10n.loginTitle,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Área principal com imagem de fundo.
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          minHeight: 650,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/background.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          // Cartão do formulário.
                          child: Container(
                            width: 350,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 40,
                            ),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: colors.surface,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const LoginForm(),
                          ),
                        ),
                      ),
                    ),

                    // Rodapé da página.
                    const AppFooter(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
