import 'package:hive/hive.dart';
part 'login_table.g.dart';
@HiveType(typeId: 0)
class LoginTable {
  @HiveField(0)
  final String accountID;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String mobileNumber;
  @HiveField(3)
  final String accountType;
  @HiveField(4)
  final String fistName;
  @HiveField(5)
  final String lastName;
  @HiveField(6)
  final String token;
  @HiveField(7)
  final String userID;
  @HiveField(8)
  final String verificationStatus;
  @HiveField(9)
  final int verificationStatusID;
  @HiveField(10)
  final bool isverifiedContacts;
  @HiveField(11)
  final int profileId;

  const LoginTable(
    this.accountID,
    this.email,
    this.mobileNumber,
    this.accountType,
    this.fistName,
    this.lastName,
    this.token,
    this.userID,
    this.verificationStatus,
    this.verificationStatusID,
    this.isverifiedContacts,
    this.profileId,
  );
}
