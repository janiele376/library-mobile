
import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.outline,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.book,
              color: colors.onSurface,
              size: 30,
            ),
          ),
          Text(
            l10n.welcome,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
          ),
          Text(
            l10n.loginDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors.onSurface,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Icon(
                Icons.email,
                color: colors.onSurface,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: l10n.email,
                    filled: true,
                    fillColor: colors.onPrimary,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1,
                        color: colors.outline,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.lock,
                color: colors.onSurface,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: l10n.password,
                    suffixIcon: const Icon(
                      Icons.visibility,
                    ),
                    filled: true,
                    fillColor: colors.onPrimary,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1,
                        color: colors.outline,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                l10n.forgotPassword,
                style: TextStyle(
                  color: colors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: colors.outline,
                    width: 2,
                  ),
                ),
              ),
              child: Text(l10n.login),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: colors.outline,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  l10n.or,
                  style: TextStyle(
                    color: colors.onSurface,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: colors.outline,
                  thickness: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.surface,
                foregroundColor: colors.onSurface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: colors.outline,
                    width: 2,
                  ),
                ),
              ),
              child: Text(l10n.register),
            ),
          ),
        ],
      ),
    );
  }
}
