class CompanyModel {
  final String id;
  final String name;
  final String description;
  final double rating;
  final String location;
  final String logoUrl;
  final List<String> services;

  CompanyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.location,
    required this.logoUrl,
    required this.services,
  });

  static List<CompanyModel> getDummyCompanies() {
    return List.generate(25, (index) {
      final companyNames = [
        'Global Shipping Solutions',
        'Ocean Freight Express',
        'Air Cargo International',
        'Road Transport Co.',
        'Courier Services Ltd',
        'Warehouse Management Inc',
        'Logistics Pro',
        'Fast Track Shipping',
        'Reliable Transport',
        'Worldwide Logistics',
        'Express Delivery Co',
        'Maritime Shipping',
        'Air Freight Specialists',
        'Ground Transport Ltd',
        'International Courier',
        'Storage Solutions',
        'Supply Chain Experts',
        'Rapid Shipping',
        'Trusted Logistics',
        'Global Transport',
        'Express Logistics',
        'Marine Shipping Co',
        'Aviation Cargo',
        'Road Freight Ltd',
        'Courier Express',
      ];

      final services = [
        'Sea Freight',
        'Air Freight',
        'Road Transport',
        'Courier',
        'Warehouse',
        'Customs Clearance',
      ];

      return CompanyModel(
        id: 'company_${index + 1}',
        name: companyNames[index % companyNames.length],
        description: 'Professional shipping and logistics services with ${20 + index} years of experience in international trade.',
        rating: 3.5 + (index % 3) * 0.5,
        location: 'Location ${index + 1}',
        logoUrl: '',
        services: services.sublist(0, 2 + (index % 4)),
      );
    });
  }
}
