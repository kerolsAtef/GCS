class TenderKind {
  bool disabled;
  dynamic group;
  bool selected;
  String text;
  String value;

  TenderKind({
    required this.disabled,
    required this.group,
    required this.selected,
    required this.text,
    required this.value,
  });

  factory TenderKind.fromJson(Map<String, dynamic> json) => TenderKind(
    disabled: json["Disabled"],
    group: json["Group"],
    selected: json["Selected"],
    text: json["Text"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Disabled": disabled,
    "Group": group,
    "Selected": selected,
    "Text": text,
    "Value": value,
  };
}
