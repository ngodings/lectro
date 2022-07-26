class Meta {
  late int currentpage = 1;
  late int lastpage = 1;
  late int perpage = 10;
  late int total = 1;

  Meta();

  Meta.fromJson(Map<String, dynamic> json) {
    currentpage = json['current_page'];
    lastpage = json['last_page'];
    perpage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['current_page'] = currentpage;
    data['last_page'] = lastpage;
    data['per_page'] = perpage;
    data['total'] = total;
    return data;
  }
}
