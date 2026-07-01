class FashionBrand {
  const FashionBrand({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.services,
  });

  final String id;
  final String name;
  final String logoUrl;
  final List<FashionService> services;
}

class FashionService {
  const FashionService({
    required this.id,
    required this.type, // 'fitting', 'tailoring', 'delivery', etc.
    required this.description,
    required this.fee,
  });

  final String id;
  final String type;
  final String description;
  final int fee;
}

class ProductPhoto {
  const ProductPhoto({
    required this.id,
    required this.url,
    required this.description,
  });

  final String id;
  final String url;
  final String description;
}
