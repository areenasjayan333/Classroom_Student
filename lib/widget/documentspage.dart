class Document {
  String? doc_title;
  String? doc_url;
  String? doc_date;
  int? page_num;

  Document(this.doc_date, this.doc_title, this.doc_url, this.page_num);

  static List<Document> doc_list = [
    Document(
        "28-1-2022",
        "Introduction to Cloud Computing",
        "https://www.nber.org/system/files/working_papers/w24449/w24449.pdf",
        2),
    Document(
        "7-1-2022",
        "Introduction to Machine Learning",
        "https://ext.vt.edu/content/dam/ext_vt_edu/topics/4h-youth/makers/files/ww1-science-behind-it-telephones.pdf",
        2),
  ];
}
