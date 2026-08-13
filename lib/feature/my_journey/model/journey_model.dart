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
        "At the end of 2021 I started learning HTML and CSS and built small static sites. It was my first real look at how websites work, and it helped me understand that I enjoy creating things on the web.",
  ),
  JourneyModel(
    year: "2023",
    title: "Moving Toward the MERN Stack",
    description:
        "In mid-2023, I started learning JavaScript, React.js, Next.js and Tailwind CSS through Programming Hero. I also worked with Firebase Authentication and then moved into Node.js, Express, MongoDB, and JWT to understand the full web workflow.",
  ),
  JourneyModel(
    year: "2024",
    title: "Going Deeper in Programming",
    description:
        "In 2024, I continued learning through Programming Hero Level 2. I explored TypeScript, Express, Mongoose, Next.js, and Redux and started building more structured and real projects.",
  ),
  JourneyModel(
    year: "2025",
    title: "Starting my career",
    description:
        "In December 2024, I joined Spark Tech as a Junior Full Stack Developer. Even though the role is full-stack, most of my work focuses on backend development—API design, server logic, and working closely with the frontend.\n\nIn the middle of 2025, I started taking PostgreSQL and Prisma more seriously. I've been learning how to write better SQL, model data properly, and use Prisma to speed up development. I've also begun working with Docker and AWS to understand hosting, deployments, and real-world backend environments better. I'm currently applying these new technologies in my projects to put what I learn into practice.",
  ),
];
