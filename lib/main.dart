import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imcrypto/core/providers/wallet_provider.dart';
import 'package:imcrypto/features/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WalletProvider()),
      ],
      child: const ImCryptoApp(),
    ),
  );
} 