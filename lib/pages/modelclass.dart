class model {
  List<Vdetails>? vdetails;

  model({this.vdetails});

  model.fromJson(Map<String, dynamic> json) {
    if (json['vdetails'] != null) {
      vdetails = <Vdetails>[];
      json['vdetails'].forEach((v) {
        vdetails!.add(new Vdetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vdetails != null) {
      data['vdetails'] = this.vdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vdetails {
  int? id;
  String? name;
  String? last;
  String? email;
  String? date;
  String? vno;
  String? vmake;
  String? tel;
  String? kms;
  String? e;
  Null? item;
  String? regular;
  Null? front;
  Null? right;
  Null? left;
  Null? rear;
  Null? dashbord;
  Null? dickey;
  String? createdAt;
  String? updatedAt;

  Vdetails(
      {this.id,
      this.name,
      this.last,
      this.email,
      this.date,
      this.vno,
      this.vmake,
      this.tel,
      this.kms,
      this.e,
      this.item,
      this.regular,
      this.front,
      this.right,
      this.left,
      this.rear,
      this.dashbord,
      this.dickey,
      this.createdAt,
      this.updatedAt});

  Vdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    last = json['last'];
    email = json['email'];
    date = json['date'];
    vno = json['Vno'];
    vmake = json['Vmake'];
    tel = json['tel'];
    kms = json['kms'];
    e = json['E'];
    item = json['item'];
    regular = json['regular'];
    front = json['front'];
    right = json['right'];
    left = json['left'];
    rear = json['rear'];
    dashbord = json['dashbord'];
    dickey = json['dickey'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last'] = this.last;
    data['email'] = this.email;
    data['date'] = this.date;
    data['Vno'] = this.vno;
    data['Vmake'] = this.vmake;
    data['tel'] = this.tel;
    data['kms'] = this.kms;
    data['E'] = this.e;
    data['item'] = this.item;
    data['regular'] = this.regular;
    data['front'] = this.front;
    data['right'] = this.right;
    data['left'] = this.left;
    data['rear'] = this.rear;
    data['dashbord'] = this.dashbord;
    data['dickey'] = this.dickey;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
