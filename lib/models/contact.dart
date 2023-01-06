class Contact{
  final int id;
  final String name;
  final int account;

  Contact(this.id, this.name, this.account);

  Contact.fromJson(Map<String, dynamic> json):
      id = json['id'] ?? 0,
      name = json['name'],
      account = json['accountNumber'];

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, account: $account}';
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'accountNumber': account
  };
}
