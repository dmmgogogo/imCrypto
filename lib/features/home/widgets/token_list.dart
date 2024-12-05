import 'package:flutter/material.dart';
import '../../../core/models/token.dart';

class TokenList extends StatelessWidget {
  final List<Token> tokens;
  
  const TokenList({Key? key, required this.tokens}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tokens.length,
      itemBuilder: (context, index) {
        final token = tokens[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(token.imageUrl),
          ),
          title: Text(token.name),
          subtitle: Text(token.symbol),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${token.balance.toStringAsFixed(4)} ${token.symbol}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '\$${token.balanceInUsd.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
} 