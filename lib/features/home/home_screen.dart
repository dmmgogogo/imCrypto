import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/wallet_provider.dart';
import 'widgets/token_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('imCrypto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.security),
            onPressed: () {
              // TODO: 实现安全设置
            },
          ),
        ],
      ),
      body: Consumer<WalletProvider>(
        builder: (context, walletProvider, child) {
          if (walletProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          return walletProvider.currentWallet == null
              ? _buildCreateWalletPrompt(context)
              : _buildWalletDashboard(context);
        },
      ),
    );
  }

  Widget _buildCreateWalletPrompt(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          try {
            await context.read<WalletProvider>().createWallet();
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to create wallet: $e')),
            );
          }
        },
        child: const Text('Create Wallet'),
      ),
    );
  }

  Widget _buildWalletDashboard(BuildContext context) {
    final wallet = context.read<WalletProvider>().currentWallet!;
    // TODO: 从provider获取代币列表
    final tokens = <Token>[];
    
    return RefreshIndicator(
      onRefresh: () async {
        // TODO: 刷新资产列表
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet Address',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            wallet.address,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            // TODO: 复制地址
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Assets',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            TokenList(tokens: tokens),
          ],
        ),
      ),
    );
  }
} 