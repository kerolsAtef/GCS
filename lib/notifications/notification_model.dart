

class Notification {
  String title;
  dynamic date;
  String link;

  Notification({
    required this.title,
    required this.date,
    required this.link,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["Title"],
    date: json["Date"],
    link: json["Link"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Date": date,
    "Link": link,
  };
}