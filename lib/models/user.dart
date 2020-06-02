class UserData {
  String userId;
  String firstName;
  String lastName;
  String birthDate;
  String email;
  String token;
  Map<String, dynamic> personality;
  String diaryId;

  void insert(Map<String, dynamic> data) {
    userId = data['data']['user_id'];
    firstName = data['data']['first_name'];
    lastName = data['data']['last_name'];
    birthDate = data['data']['birth_date'];
    email = data['data']['email'];
    diaryId = data['data']['diary_id']['name'];
    personality = data['data']['personality'];
    token = data['token'];
  }
}
