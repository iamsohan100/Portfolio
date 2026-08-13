class JourneyModel {
  final String year;
  final String title;
  final String description;

  const JourneyModel({
    required this.year,
    required this.title,
    required this.description,
  });
}

const List<JourneyModel> journeyList = [
  JourneyModel(
    year: "2021",
    title: "First Steps",
    description:
        "At the end of 2021, I started solving problems with Java because I wanted to become an Android developer. After learning Java for a while, I started building Android apps and discovered how mobile apps actually work. That experience made me realize how much I enjoy creating things through apps.",
  ),
  JourneyModel(
    year: "2023",
    title: "Moving Into Flutter Development",
    description:
        "In mid-2023, I started learning Dart and Flutter through Ostad’s App Development with Flutter course. I also learned REST API integration, state management, Firebase Authentication, push notifications, and Google Maps, which helped me build a strong foundation in Flutter development.",
  ),
  JourneyModel(
    year: "2024",
    title: "Starting my career",
    description:
        "In mid-2024, I started working on mobile apps for a few Bangladeshi freelance clients. This experience boosted my confidence and helped me understand how real-world business products work. Later, from December 2024 to October 2025, I worked remotely as a Junior Flutter Developer at a software company called Code Studio.",
  ),
  JourneyModel(
    year: "2025",
    title: "2025-Present",
    description:
        "In October 2025, I joined SparkTech Agency as a Junior Flutter Developer. Here, I started working on larger business projects for international clients, which helped me improve my communication skills and understand how to work with global clients. I also had the opportunity to work with and learn many new technologies, which greatly expanded my technical knowledge.",
  ),
];
