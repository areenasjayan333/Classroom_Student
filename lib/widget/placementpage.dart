class Placement {
  String? title;
  String? url;
  String? date;

  Placement(this.title, this.url, this.date);

  static List<Placement> placement_list = [
    Placement("New job for Machine Learning",
        "https://www.monster.com/jobs/c-amazon", "7-12-2022"),
    Placement("Hiring for Data Analytics",
        "https://www.monster.com/jobs/c-marriott", "1-1-2023"),
  ];
}
