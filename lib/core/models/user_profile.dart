class Profile {
  int? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? middleName;
  String? address;
  String? mobileNumber;
  String? email;
  int? corpId;
  String? userType;
  String? jobTitle;
  String? createdIpAddress;
  String? approvedIpAddress;
  List<dynamic>? userRoles;
  String? lastLogonDate;
  String? lastPasswordChangeDate;
  bool? currentlyLoggedOn;
  bool? currentlyLockedOut;
  bool? enableToken;
  bool? viewAccountBalance;
  bool? active;
  bool? signatory;
  bool? changedPassword;
  String? profilePicture;
  bool? globalAccess;
  String? approvedBy;
  String? createdBy;
  String? approvalStatus;
  String? subsidiaryId;
  bool? defaultPassword;

  Profile({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.middleName,
    this.address,
    this.mobileNumber,
    this.email,
    this.corpId,
    this.userType,
    this.jobTitle,
    this.createdIpAddress,
    this.approvedIpAddress,
    this.userRoles,
    this.lastLogonDate,
    this.lastPasswordChangeDate,
    this.currentlyLoggedOn,
    this.currentlyLockedOut,
    this.enableToken,
    this.viewAccountBalance,
    this.active,
    this.signatory,
    this.changedPassword,
    this.profilePicture,
    this.globalAccess,
    this.approvedBy,
    this.createdBy,
    this.approvalStatus,
    this.subsidiaryId,
    this.defaultPassword,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userId: json["userId"] as int?,
      username: json["username"] as String?,
      firstName: json["firstName"] as String?,
      lastName: json["lastName"] as String?,
      middleName: json["middleName"] as String?,
      address: json["address"] as String?,
      mobileNumber: json["mobileNumber"] as String?,
      email: json["email"] as String?,
      corpId: json["corpId"] as int?,
      userType: json["userType"] as String?,
      jobTitle: json["jobTitle"] as String?,
      createdIpAddress: json["createdIpAddress"] as String?,
      approvedIpAddress: json["approvedIpAddress"] as String?,
      userRoles: json["userRoles"] as List<dynamic>?,
      lastLogonDate: json["lastLogonDate"] as String?,
      lastPasswordChangeDate: json["lastPasswordChangeDate"] as String?,
      currentlyLoggedOn: json["currentlyLoggedOn"] as bool?,
      currentlyLockedOut: json["currentlyLockedOut"] as bool?,
      enableToken: json["enableToken"] as bool?,
      viewAccountBalance: json["viewAccountBalance"] as bool?,
      active: json["active"] as bool?,
      signatory: json["signatory"] as bool?,
      changedPassword: json["changedPassword"] as bool?,
      profilePicture: json["profilePicture"] as String?,
      globalAccess: json["globalAccess"] as bool?,
      approvedBy: json["approvedBy"] as String?,
      createdBy: json["createdBy"] as String?,
      approvalStatus: json["approvalStatus"] as String?,
      subsidiaryId: json["subsidiaryId"] as String?,
      defaultPassword: json["defaultPassword"] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "address": address,
    "mobileNumber": mobileNumber,
    "email": email,
    "corpId": corpId,
    "userType": userType,
    "jobTitle": jobTitle,
    "createdIpAddress": createdIpAddress,
    "approvedIpAddress": approvedIpAddress,
    "userRoles": userRoles,
    "lastLogonDate": lastLogonDate,
    "lastPasswordChangeDate": lastPasswordChangeDate,
    "currentlyLoggedOn": currentlyLoggedOn,
    "currentlyLockedOut": currentlyLockedOut,
    "enableToken": enableToken,
    "viewAccountBalance": viewAccountBalance,
    "active": active,
    "signatory": signatory,
    "changedPassword": changedPassword,
    "profilePicture": profilePicture,
    "globalAccess": globalAccess,
    "approvedBy": approvedBy,
    "createdBy": createdBy,
    "approvalStatus": approvalStatus,
    "subsidiaryId": subsidiaryId,
    "defaultPassword": defaultPassword,
  };

  @override
  String toString() {
    return 'Profile(userId: $userId, username: $username,'
        ' firstName: $firstName, lastName: $lastName, '
        'middleName: $middleName, address: $address, '
        'mobileNumber: $mobileNumber, email: $email,'
        ' corpId: $corpId, userType: $userType, jobTitle: $jobTitle, '
        'createdIpAddress: $createdIpAddress, approvedIpAddress: $approvedIpAddress, '
        'userRoles: $userRoles, lastLogonDate: $lastLogonDate,'
        ' lastPasswordChangeDate: $lastPasswordChangeDate,'
        ' currentlyLoggedOn: $currentlyLoggedOn, currentlyLockedOut: $currentlyLockedOut,'
        ' enableToken: $enableToken, viewAccountBalance: $viewAccountBalance, '
        'active: $active, signatory: $signatory, changedPassword: $changedPassword,'
        ' profilePicture: $profilePicture, globalAccess: $globalAccess, approvedBy: $approvedBy, '
        'createdBy: $createdBy, approvalStatus: $approvalStatus, subsidiaryId: $subsidiaryId,'
        ' defaultPassword: $defaultPassword)';
  }
}

extension ProfileCopyWith on Profile {
  Profile copyWith(Map<String, dynamic> fields) {
    return Profile(
      userId: fields["userId"] ?? userId,
      username: fields["username"] ?? username,
      firstName: fields["firstName"] ?? firstName,
      lastName: fields["lastName"] ?? lastName,
      middleName: fields["middleName"] ?? middleName,
      address: fields["address"] ?? address,
      mobileNumber: fields["mobileNumber"] ?? mobileNumber,
      email: fields["email"] ?? email,
      corpId: fields["corpId"] ?? corpId,
      userType: fields["userType"] ?? userType,
      jobTitle: fields["jobTitle"] ?? jobTitle,
      createdIpAddress: fields["createdIpAddress"] ?? createdIpAddress,
      approvedIpAddress: fields["approvedIpAddress"] ?? approvedIpAddress,
      userRoles: fields["userRoles"] ?? userRoles,
      lastLogonDate: fields["lastLogonDate"] ?? lastLogonDate,
      lastPasswordChangeDate: fields["lastPasswordChangeDate"] ?? lastPasswordChangeDate,
      currentlyLoggedOn: fields["currentlyLoggedOn"] ?? currentlyLoggedOn,
      currentlyLockedOut: fields["currentlyLockedOut"] ?? currentlyLockedOut,
      enableToken: fields["enableToken"] ?? enableToken,
      viewAccountBalance: fields["viewAccountBalance"] ?? viewAccountBalance,
      active: fields["active"] ?? active,
      signatory: fields["signatory"] ?? signatory,
      changedPassword: fields["changedPassword"] ?? changedPassword,
      profilePicture: fields["profilePicture"] ?? profilePicture,
      globalAccess: fields["globalAccess"] ?? globalAccess,
      approvedBy: fields["approvedBy"] ?? approvedBy,
      createdBy: fields["createdBy"] ?? createdBy,
      approvalStatus: fields["approvalStatus"] ?? approvalStatus,
      subsidiaryId: fields["subsidiaryId"] ?? subsidiaryId,
      defaultPassword: fields["defaultPassword"] ?? defaultPassword,
    );
  }
}