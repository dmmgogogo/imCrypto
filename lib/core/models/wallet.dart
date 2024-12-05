class Wallet {
  final String address;
  final String publicKey;
  final String? name;
  
  const Wallet({
    required this.address,
    required this.publicKey,
    this.name,
  });
  
  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      address: json['address'] as String,
      publicKey: json['publicKey'] as String,
      name: json['name'] as String?,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'publicKey': publicKey,
      'name': name,
    };
  }
} 