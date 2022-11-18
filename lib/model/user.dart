// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
    User({
        this.recNo,
        this.userId,
        this.fName,
        this.mName,
        this.lname,
        this.address,
        this.birthDate,
        this.email,
        this.username,
        this.password,
        this.photoUrl,
    });

    int? recNo;
    String? userId;
    String? fName;
    String? mName;
    String? lname;
    String? address;
    dynamic birthDate;
    String? email;
    String? username;
    String? password;
    String? photoUrl;

    User copyWith({
        int? recNo,
        String? userId,
        String? fName,
        String? mName,
        String? lname,
        String? address,
        dynamic birthDate,
        String? email,
        String? username,
        String? password,
        String? photoUrl,
    }) => 
        User(
            recNo: recNo ?? this.recNo,
            userId: userId ?? this.userId,
            fName: fName ?? this.fName,
            mName: mName ?? this.mName,
            lname: lname ?? this.lname,
            address: address ?? this.address,
            birthDate: birthDate ?? this.birthDate,
            email: email ?? this.email,
            username: username ?? this.username,
            password: password ?? this.password,
            photoUrl: photoUrl ?? this.photoUrl,
        );

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        recNo: json["recNo"] == null ? null : json["recNo"],
        userId: json["userId"] == null ? null : json["userId"],
        fName: json["fName"] == null ? null : json["fName"],
        mName: json["mName"] == null ? null : json["mName"],
        lname: json["lname"] == null ? null : json["lname"],
        address: json["address"] == null ? null : json["address"],
        birthDate: json["birthDate"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "recNo": recNo == null ? null : recNo,
        "userId": userId == null ? null : userId,
        "fName": fName == null ? null : fName,
        "mName": mName == null ? null : mName,
        "lname": lname == null ? null : lname,
        "address": address == null ? null : address,
        "birthDate": birthDate,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "photoUrl": photoUrl == null ? null : photoUrl,
    };
}
