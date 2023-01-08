class Scholar {
  String? title;
  String? url;
  String? date;

  Scholar(this.title, this.url, this.date);

  static List<Scholar> scholar_list = [
    Scholar("PM's National Scholarshop", "https://scholarships.gov.in/",
        "7-12-2022"),
    Scholar("E-Grantz Scholarship", "https://www.egrantz.kerala.gov.in",
        "1-1-2023"),
  ];
}
