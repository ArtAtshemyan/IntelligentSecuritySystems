import '../../../../generated/l10n.dart';

class VisitorIdentityEntity {
  final int id;
  final String title;
  VisitorIdentityEntity({required this.id, required this.title});
}

List<VisitorIdentityEntity> visitorIdentity = [
  VisitorIdentityEntity(id: 0, title: S.current.friendsFamily),
  VisitorIdentityEntity(id: 1, title: S.current.delivery),
];