class ProductModel {
  final int id;
  final int clientId;
  final int providerId;
  final String? externalId;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final String? raw;
  final String? normalized;

  ProductModel({
    required this.id,
    required this.clientId,
    required this.providerId,
    this.externalId,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    this.raw,
    this.normalized,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      clientId: map['client_id'],
      providerId: map['provider_id'],
      externalId: map['external_id'],
      name: map['name'],
      description: map['description'],
      price: double.tryParse(map['price'].toString()) ?? 0.0,
      imageUrl: map['image_url'],
      raw: map['raw'],
      normalized: map['normalized'],
    );
  }
}
