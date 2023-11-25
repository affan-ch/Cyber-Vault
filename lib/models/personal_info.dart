class PersonalInfo {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String fullName;
  final String gender;
  final String dateOfBirth;
  final String cnic;
  final String maritalStatus;
  final String religion;
  final String nationality;
  final String education;
  final String occupation;
  final String fatherName;
  final String fatherCnic;
  final String motherName;
  final String motherCnic;
  final String spouseName;
  final String spouseCnic;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String recordTitle;

  PersonalInfo(
      this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.gender,
      this.dateOfBirth,
      this.cnic,
      this.maritalStatus,
      this.religion,
      this.nationality,
      this.education,
      this.occupation,
      this.fatherName,
      this.fatherCnic,
      this.motherName,
      this.motherCnic,
      this.spouseName,
      this.spouseCnic,
      this.email,
      this.phoneNumber,
      this.address,
      this.city,
      this.state,
      this.zipCode,
      this.country,
      this.recordTitle);

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      json['id'] ?? "",
      json['firstName'] ?? "",
      json['middleName'] ?? "",
      json['lastName'] ?? "",
      json['fullName'] ?? "",
      json['gender'] ?? "",
      json['dateOfBirth'] ?? "",
      json['cnic'] ?? "",
      json['maritalStatus'] ?? "",
      json['religion'] ?? "",
      json['nationality'] ?? "",
      json['education'] ?? "",
      json['occupation'] ?? "",
      json['fatherName'] ?? "",
      json['fatherCnic'] ?? "",
      json['motherName'] ?? "",
      json['motherCnic'] ?? "",
      json['spouseName'] ?? "",
      json['spouseCnic'] ?? "",
      json['email'] ?? "",
      json['phoneNumber'] ?? "",
      json['address'] ?? "",
      json['city'] ?? "",
      json['state'] ?? "",
      json['zipCode'] ?? "",
      json['country'] ?? "",
      json['recordTitle'] ?? "",
    );
  }
}
