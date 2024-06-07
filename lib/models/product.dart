class product {
  final int id, price;
  final String title, subtitle, description, image;

  product({
    required this.id,
    required this.price,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });
}

Set<product> products = {
  product(
    id: 1,
    price: 50,
    title: 'كفاحي',
    subtitle: 'منصه تعليميه اون لاين',
    image: 'assets/images/logo.jpeg',
    description: 'احلي منصه في العالم',
  ),
  product(
    id: 1,
    price: 50,
    title: 'كفاحي',
    subtitle: 'منصه تعليميه اون لاين',
    image: 'images/WhatsApp Image 2023-11-16 at 11.11.03 AM.jpeg',
    description: 'احلي منصه في العالم',
  ),
};
