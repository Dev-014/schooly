class NewTeacher {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int roles;
  final String employeeId;

  NewTeacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.roles,
    required this.employeeId,
  });

  factory NewTeacher.fromJson(Map<String, dynamic> json) {
    return NewTeacher(
      id: json['details']['id'],
      firstName: json['details']['first_name'],
      lastName: json['details']['last_name'],
      phoneNumber: json['details']['phone_number'],
      roles: json['details']['roles'],
      employeeId: json['employee_id'],
    );
  }
}

//Roles:
///Student : 0;
///Teacher : 1;