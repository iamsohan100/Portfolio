class CertificateModel {
  final String title;
  final String issuer;
  final String issueDate;
  final String description;
  final String imagePath;
  final String driveUrl;

  CertificateModel({
    required this.title,
    required this.issuer,
    required this.issueDate,
    required this.description,
    required this.imagePath,
    required this.driveUrl,
  });
}
