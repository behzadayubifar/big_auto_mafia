class RolesList {
  RolesList({required this.roles});

  final List<String> roles;

  // length is important in equality and also the elements
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RolesList) return false;
    return other.roles.length == roles.length &&
        other.roles.every((element) => roles.contains(element));
  }
}
