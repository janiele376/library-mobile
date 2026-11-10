
import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.surface,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.book,
              color: colors.onSurface,
              size: 32,
            ),
            Text(
              l10n.appTitle,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: colors.onSurface,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                  child: Form(
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
                                    borderRadius:
                                        BorderRadius.circular(30),
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
                                    borderRadius:
                                        BorderRadius.circular(30),
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
                                borderRadius:
                                    BorderRadius.circular(30),
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
                                borderRadius:
                                    BorderRadius.circular(30),
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
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: colors.surface,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 9,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.aboutUs,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(l10n.aboutDescription),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.contactUs,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: colors.onSurface,
                                size: 11,
                              ),
                              const SizedBox(width: 3),
                              const Expanded(
                                child: Text(
                                  'biblioteca@gmail.com',
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: colors.onSurface,
                                size: 11,
                              ),
                              const SizedBox(width: 3),
                              const Expanded(
                                child: Text('99 9999-99999'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: colors.onSurface,
                                size: 11,
                              ),
                              const SizedBox(width: 3),
                              const Expanded(
                                child: Text('biblioteca23'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.ourLocations,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(l10n.locationOne),
                          Text(l10n.locationTwo),
                          Text(l10n.locationThree),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
