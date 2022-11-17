class DtoCredentials {
  String? fname;
  String? mname;
  String? lname;
  String? email;
  String? address;
  String? username;
  String? password;

  DtoCredentials(
      {this.fname,
      this.mname,
      this.lname,
      this.email,
      this.address,
      this.username,
      this.password});

      Map<String, dynamic> toJson() => {
        "fname": fname,
        "mname": mname,
        "lname": lname,
        "address": address,
        "email": email,
        "username": username,
        "password": password
      };
}
