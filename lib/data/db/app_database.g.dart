// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodGroupMeta = const VerificationMeta(
    'bloodGroup',
  );
  @override
  late final GeneratedColumn<String> bloodGroup = GeneratedColumn<String>(
    'blood_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genotypeMeta = const VerificationMeta(
    'genotype',
  );
  @override
  late final GeneratedColumn<String> genotype = GeneratedColumn<String>(
    'genotype',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allergiesMeta = const VerificationMeta(
    'allergies',
  );
  @override
  late final GeneratedColumn<String> allergies = GeneratedColumn<String>(
    'allergies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarPathMeta = const VerificationMeta(
    'avatarPath',
  );
  @override
  late final GeneratedColumn<String> avatarPath = GeneratedColumn<String>(
    'avatar_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caregiverNameMeta = const VerificationMeta(
    'caregiverName',
  );
  @override
  late final GeneratedColumn<String> caregiverName = GeneratedColumn<String>(
    'caregiver_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caregiverRelationMeta = const VerificationMeta(
    'caregiverRelation',
  );
  @override
  late final GeneratedColumn<String> caregiverRelation =
      GeneratedColumn<String>(
        'caregiver_relation',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _caregiverPhoneMeta = const VerificationMeta(
    'caregiverPhone',
  );
  @override
  late final GeneratedColumn<String> caregiverPhone = GeneratedColumn<String>(
    'caregiver_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caregiverAlertsEnabledMeta =
      const VerificationMeta('caregiverAlertsEnabled');
  @override
  late final GeneratedColumn<bool> caregiverAlertsEnabled =
      GeneratedColumn<bool>(
        'caregiver_alerts_enabled',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("caregiver_alerts_enabled" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _caregiverDelayMinutesMeta =
      const VerificationMeta('caregiverDelayMinutes');
  @override
  late final GeneratedColumn<int> caregiverDelayMinutes = GeneratedColumn<int>(
    'caregiver_delay_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(20),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    fullName,
    title,
    dateOfBirth,
    sex,
    bloodGroup,
    genotype,
    allergies,
    avatarPath,
    caregiverName,
    caregiverRelation,
    caregiverPhone,
    caregiverAlertsEnabled,
    caregiverDelayMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('blood_group')) {
      context.handle(
        _bloodGroupMeta,
        bloodGroup.isAcceptableOrUnknown(data['blood_group']!, _bloodGroupMeta),
      );
    }
    if (data.containsKey('genotype')) {
      context.handle(
        _genotypeMeta,
        genotype.isAcceptableOrUnknown(data['genotype']!, _genotypeMeta),
      );
    }
    if (data.containsKey('allergies')) {
      context.handle(
        _allergiesMeta,
        allergies.isAcceptableOrUnknown(data['allergies']!, _allergiesMeta),
      );
    }
    if (data.containsKey('avatar_path')) {
      context.handle(
        _avatarPathMeta,
        avatarPath.isAcceptableOrUnknown(data['avatar_path']!, _avatarPathMeta),
      );
    }
    if (data.containsKey('caregiver_name')) {
      context.handle(
        _caregiverNameMeta,
        caregiverName.isAcceptableOrUnknown(
          data['caregiver_name']!,
          _caregiverNameMeta,
        ),
      );
    }
    if (data.containsKey('caregiver_relation')) {
      context.handle(
        _caregiverRelationMeta,
        caregiverRelation.isAcceptableOrUnknown(
          data['caregiver_relation']!,
          _caregiverRelationMeta,
        ),
      );
    }
    if (data.containsKey('caregiver_phone')) {
      context.handle(
        _caregiverPhoneMeta,
        caregiverPhone.isAcceptableOrUnknown(
          data['caregiver_phone']!,
          _caregiverPhoneMeta,
        ),
      );
    }
    if (data.containsKey('caregiver_alerts_enabled')) {
      context.handle(
        _caregiverAlertsEnabledMeta,
        caregiverAlertsEnabled.isAcceptableOrUnknown(
          data['caregiver_alerts_enabled']!,
          _caregiverAlertsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('caregiver_delay_minutes')) {
      context.handle(
        _caregiverDelayMinutesMeta,
        caregiverDelayMinutes.isAcceptableOrUnknown(
          data['caregiver_delay_minutes']!,
          _caregiverDelayMinutesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      ),
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      bloodGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blood_group'],
      ),
      genotype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genotype'],
      ),
      allergies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allergies'],
      ),
      avatarPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_path'],
      ),
      caregiverName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caregiver_name'],
      ),
      caregiverRelation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caregiver_relation'],
      ),
      caregiverPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caregiver_phone'],
      ),
      caregiverAlertsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}caregiver_alerts_enabled'],
      )!,
      caregiverDelayMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}caregiver_delay_minutes'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final String fullName;
  final String? title;
  final DateTime? dateOfBirth;
  final String? sex;
  final String? bloodGroup;
  final String? genotype;
  final String? allergies;
  final String? avatarPath;
  final String? caregiverName;
  final String? caregiverRelation;
  final String? caregiverPhone;
  final bool caregiverAlertsEnabled;
  final int caregiverDelayMinutes;
  const Profile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.fullName,
    this.title,
    this.dateOfBirth,
    this.sex,
    this.bloodGroup,
    this.genotype,
    this.allergies,
    this.avatarPath,
    this.caregiverName,
    this.caregiverRelation,
    this.caregiverPhone,
    required this.caregiverAlertsEnabled,
    required this.caregiverDelayMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || bloodGroup != null) {
      map['blood_group'] = Variable<String>(bloodGroup);
    }
    if (!nullToAbsent || genotype != null) {
      map['genotype'] = Variable<String>(genotype);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || avatarPath != null) {
      map['avatar_path'] = Variable<String>(avatarPath);
    }
    if (!nullToAbsent || caregiverName != null) {
      map['caregiver_name'] = Variable<String>(caregiverName);
    }
    if (!nullToAbsent || caregiverRelation != null) {
      map['caregiver_relation'] = Variable<String>(caregiverRelation);
    }
    if (!nullToAbsent || caregiverPhone != null) {
      map['caregiver_phone'] = Variable<String>(caregiverPhone);
    }
    map['caregiver_alerts_enabled'] = Variable<bool>(caregiverAlertsEnabled);
    map['caregiver_delay_minutes'] = Variable<int>(caregiverDelayMinutes);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      fullName: Value(fullName),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      bloodGroup: bloodGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGroup),
      genotype: genotype == null && nullToAbsent
          ? const Value.absent()
          : Value(genotype),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      avatarPath: avatarPath == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarPath),
      caregiverName: caregiverName == null && nullToAbsent
          ? const Value.absent()
          : Value(caregiverName),
      caregiverRelation: caregiverRelation == null && nullToAbsent
          ? const Value.absent()
          : Value(caregiverRelation),
      caregiverPhone: caregiverPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(caregiverPhone),
      caregiverAlertsEnabled: Value(caregiverAlertsEnabled),
      caregiverDelayMinutes: Value(caregiverDelayMinutes),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      fullName: serializer.fromJson<String>(json['fullName']),
      title: serializer.fromJson<String?>(json['title']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      sex: serializer.fromJson<String?>(json['sex']),
      bloodGroup: serializer.fromJson<String?>(json['bloodGroup']),
      genotype: serializer.fromJson<String?>(json['genotype']),
      allergies: serializer.fromJson<String?>(json['allergies']),
      avatarPath: serializer.fromJson<String?>(json['avatarPath']),
      caregiverName: serializer.fromJson<String?>(json['caregiverName']),
      caregiverRelation: serializer.fromJson<String?>(
        json['caregiverRelation'],
      ),
      caregiverPhone: serializer.fromJson<String?>(json['caregiverPhone']),
      caregiverAlertsEnabled: serializer.fromJson<bool>(
        json['caregiverAlertsEnabled'],
      ),
      caregiverDelayMinutes: serializer.fromJson<int>(
        json['caregiverDelayMinutes'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'fullName': serializer.toJson<String>(fullName),
      'title': serializer.toJson<String?>(title),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'sex': serializer.toJson<String?>(sex),
      'bloodGroup': serializer.toJson<String?>(bloodGroup),
      'genotype': serializer.toJson<String?>(genotype),
      'allergies': serializer.toJson<String?>(allergies),
      'avatarPath': serializer.toJson<String?>(avatarPath),
      'caregiverName': serializer.toJson<String?>(caregiverName),
      'caregiverRelation': serializer.toJson<String?>(caregiverRelation),
      'caregiverPhone': serializer.toJson<String?>(caregiverPhone),
      'caregiverAlertsEnabled': serializer.toJson<bool>(caregiverAlertsEnabled),
      'caregiverDelayMinutes': serializer.toJson<int>(caregiverDelayMinutes),
    };
  }

  Profile copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? fullName,
    Value<String?> title = const Value.absent(),
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> sex = const Value.absent(),
    Value<String?> bloodGroup = const Value.absent(),
    Value<String?> genotype = const Value.absent(),
    Value<String?> allergies = const Value.absent(),
    Value<String?> avatarPath = const Value.absent(),
    Value<String?> caregiverName = const Value.absent(),
    Value<String?> caregiverRelation = const Value.absent(),
    Value<String?> caregiverPhone = const Value.absent(),
    bool? caregiverAlertsEnabled,
    int? caregiverDelayMinutes,
  }) => Profile(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    fullName: fullName ?? this.fullName,
    title: title.present ? title.value : this.title,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    sex: sex.present ? sex.value : this.sex,
    bloodGroup: bloodGroup.present ? bloodGroup.value : this.bloodGroup,
    genotype: genotype.present ? genotype.value : this.genotype,
    allergies: allergies.present ? allergies.value : this.allergies,
    avatarPath: avatarPath.present ? avatarPath.value : this.avatarPath,
    caregiverName: caregiverName.present
        ? caregiverName.value
        : this.caregiverName,
    caregiverRelation: caregiverRelation.present
        ? caregiverRelation.value
        : this.caregiverRelation,
    caregiverPhone: caregiverPhone.present
        ? caregiverPhone.value
        : this.caregiverPhone,
    caregiverAlertsEnabled:
        caregiverAlertsEnabled ?? this.caregiverAlertsEnabled,
    caregiverDelayMinutes: caregiverDelayMinutes ?? this.caregiverDelayMinutes,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      title: data.title.present ? data.title.value : this.title,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      sex: data.sex.present ? data.sex.value : this.sex,
      bloodGroup: data.bloodGroup.present
          ? data.bloodGroup.value
          : this.bloodGroup,
      genotype: data.genotype.present ? data.genotype.value : this.genotype,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      avatarPath: data.avatarPath.present
          ? data.avatarPath.value
          : this.avatarPath,
      caregiverName: data.caregiverName.present
          ? data.caregiverName.value
          : this.caregiverName,
      caregiverRelation: data.caregiverRelation.present
          ? data.caregiverRelation.value
          : this.caregiverRelation,
      caregiverPhone: data.caregiverPhone.present
          ? data.caregiverPhone.value
          : this.caregiverPhone,
      caregiverAlertsEnabled: data.caregiverAlertsEnabled.present
          ? data.caregiverAlertsEnabled.value
          : this.caregiverAlertsEnabled,
      caregiverDelayMinutes: data.caregiverDelayMinutes.present
          ? data.caregiverDelayMinutes.value
          : this.caregiverDelayMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('fullName: $fullName, ')
          ..write('title: $title, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('sex: $sex, ')
          ..write('bloodGroup: $bloodGroup, ')
          ..write('genotype: $genotype, ')
          ..write('allergies: $allergies, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('caregiverName: $caregiverName, ')
          ..write('caregiverRelation: $caregiverRelation, ')
          ..write('caregiverPhone: $caregiverPhone, ')
          ..write('caregiverAlertsEnabled: $caregiverAlertsEnabled, ')
          ..write('caregiverDelayMinutes: $caregiverDelayMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    fullName,
    title,
    dateOfBirth,
    sex,
    bloodGroup,
    genotype,
    allergies,
    avatarPath,
    caregiverName,
    caregiverRelation,
    caregiverPhone,
    caregiverAlertsEnabled,
    caregiverDelayMinutes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.fullName == this.fullName &&
          other.title == this.title &&
          other.dateOfBirth == this.dateOfBirth &&
          other.sex == this.sex &&
          other.bloodGroup == this.bloodGroup &&
          other.genotype == this.genotype &&
          other.allergies == this.allergies &&
          other.avatarPath == this.avatarPath &&
          other.caregiverName == this.caregiverName &&
          other.caregiverRelation == this.caregiverRelation &&
          other.caregiverPhone == this.caregiverPhone &&
          other.caregiverAlertsEnabled == this.caregiverAlertsEnabled &&
          other.caregiverDelayMinutes == this.caregiverDelayMinutes);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> fullName;
  final Value<String?> title;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> sex;
  final Value<String?> bloodGroup;
  final Value<String?> genotype;
  final Value<String?> allergies;
  final Value<String?> avatarPath;
  final Value<String?> caregiverName;
  final Value<String?> caregiverRelation;
  final Value<String?> caregiverPhone;
  final Value<bool> caregiverAlertsEnabled;
  final Value<int> caregiverDelayMinutes;
  final Value<int> rowid;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.fullName = const Value.absent(),
    this.title = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.sex = const Value.absent(),
    this.bloodGroup = const Value.absent(),
    this.genotype = const Value.absent(),
    this.allergies = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.caregiverName = const Value.absent(),
    this.caregiverRelation = const Value.absent(),
    this.caregiverPhone = const Value.absent(),
    this.caregiverAlertsEnabled = const Value.absent(),
    this.caregiverDelayMinutes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfilesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String fullName,
    this.title = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.sex = const Value.absent(),
    this.bloodGroup = const Value.absent(),
    this.genotype = const Value.absent(),
    this.allergies = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.caregiverName = const Value.absent(),
    this.caregiverRelation = const Value.absent(),
    this.caregiverPhone = const Value.absent(),
    this.caregiverAlertsEnabled = const Value.absent(),
    this.caregiverDelayMinutes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fullName = Value(fullName);
  static Insertable<Profile> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? fullName,
    Expression<String>? title,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? sex,
    Expression<String>? bloodGroup,
    Expression<String>? genotype,
    Expression<String>? allergies,
    Expression<String>? avatarPath,
    Expression<String>? caregiverName,
    Expression<String>? caregiverRelation,
    Expression<String>? caregiverPhone,
    Expression<bool>? caregiverAlertsEnabled,
    Expression<int>? caregiverDelayMinutes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (fullName != null) 'full_name': fullName,
      if (title != null) 'title': title,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (sex != null) 'sex': sex,
      if (bloodGroup != null) 'blood_group': bloodGroup,
      if (genotype != null) 'genotype': genotype,
      if (allergies != null) 'allergies': allergies,
      if (avatarPath != null) 'avatar_path': avatarPath,
      if (caregiverName != null) 'caregiver_name': caregiverName,
      if (caregiverRelation != null) 'caregiver_relation': caregiverRelation,
      if (caregiverPhone != null) 'caregiver_phone': caregiverPhone,
      if (caregiverAlertsEnabled != null)
        'caregiver_alerts_enabled': caregiverAlertsEnabled,
      if (caregiverDelayMinutes != null)
        'caregiver_delay_minutes': caregiverDelayMinutes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfilesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? fullName,
    Value<String?>? title,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? sex,
    Value<String?>? bloodGroup,
    Value<String?>? genotype,
    Value<String?>? allergies,
    Value<String?>? avatarPath,
    Value<String?>? caregiverName,
    Value<String?>? caregiverRelation,
    Value<String?>? caregiverPhone,
    Value<bool>? caregiverAlertsEnabled,
    Value<int>? caregiverDelayMinutes,
    Value<int>? rowid,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      fullName: fullName ?? this.fullName,
      title: title ?? this.title,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      sex: sex ?? this.sex,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      genotype: genotype ?? this.genotype,
      allergies: allergies ?? this.allergies,
      avatarPath: avatarPath ?? this.avatarPath,
      caregiverName: caregiverName ?? this.caregiverName,
      caregiverRelation: caregiverRelation ?? this.caregiverRelation,
      caregiverPhone: caregiverPhone ?? this.caregiverPhone,
      caregiverAlertsEnabled:
          caregiverAlertsEnabled ?? this.caregiverAlertsEnabled,
      caregiverDelayMinutes:
          caregiverDelayMinutes ?? this.caregiverDelayMinutes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (bloodGroup.present) {
      map['blood_group'] = Variable<String>(bloodGroup.value);
    }
    if (genotype.present) {
      map['genotype'] = Variable<String>(genotype.value);
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (avatarPath.present) {
      map['avatar_path'] = Variable<String>(avatarPath.value);
    }
    if (caregiverName.present) {
      map['caregiver_name'] = Variable<String>(caregiverName.value);
    }
    if (caregiverRelation.present) {
      map['caregiver_relation'] = Variable<String>(caregiverRelation.value);
    }
    if (caregiverPhone.present) {
      map['caregiver_phone'] = Variable<String>(caregiverPhone.value);
    }
    if (caregiverAlertsEnabled.present) {
      map['caregiver_alerts_enabled'] = Variable<bool>(
        caregiverAlertsEnabled.value,
      );
    }
    if (caregiverDelayMinutes.present) {
      map['caregiver_delay_minutes'] = Variable<int>(
        caregiverDelayMinutes.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('fullName: $fullName, ')
          ..write('title: $title, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('sex: $sex, ')
          ..write('bloodGroup: $bloodGroup, ')
          ..write('genotype: $genotype, ')
          ..write('allergies: $allergies, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('caregiverName: $caregiverName, ')
          ..write('caregiverRelation: $caregiverRelation, ')
          ..write('caregiverPhone: $caregiverPhone, ')
          ..write('caregiverAlertsEnabled: $caregiverAlertsEnabled, ')
          ..write('caregiverDelayMinutes: $caregiverDelayMinutes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConditionsTable extends Conditions
    with TableInfo<$ConditionsTable, Condition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConditionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diagnosedAtMeta = const VerificationMeta(
    'diagnosedAt',
  );
  @override
  late final GeneratedColumn<DateTime> diagnosedAt = GeneratedColumn<DateTime>(
    'diagnosed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _doctorNameMeta = const VerificationMeta(
    'doctorName',
  );
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
    'doctor_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _facilityMeta = const VerificationMeta(
    'facility',
  );
  @override
  late final GeneratedColumn<String> facility = GeneratedColumn<String>(
    'facility',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    name,
    diagnosedAt,
    doctorName,
    facility,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conditions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Condition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('diagnosed_at')) {
      context.handle(
        _diagnosedAtMeta,
        diagnosedAt.isAcceptableOrUnknown(
          data['diagnosed_at']!,
          _diagnosedAtMeta,
        ),
      );
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
        _doctorNameMeta,
        doctorName.isAcceptableOrUnknown(data['doctor_name']!, _doctorNameMeta),
      );
    }
    if (data.containsKey('facility')) {
      context.handle(
        _facilityMeta,
        facility.isAcceptableOrUnknown(data['facility']!, _facilityMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Condition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Condition(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      diagnosedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}diagnosed_at'],
      ),
      doctorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doctor_name'],
      ),
      facility: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}facility'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ConditionsTable createAlias(String alias) {
    return $ConditionsTable(attachedDatabase, alias);
  }
}

class Condition extends DataClass implements Insertable<Condition> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final String name;
  final DateTime? diagnosedAt;
  final String? doctorName;
  final String? facility;
  final String? notes;
  const Condition({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    this.diagnosedAt,
    this.doctorName,
    this.facility,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || diagnosedAt != null) {
      map['diagnosed_at'] = Variable<DateTime>(diagnosedAt);
    }
    if (!nullToAbsent || doctorName != null) {
      map['doctor_name'] = Variable<String>(doctorName);
    }
    if (!nullToAbsent || facility != null) {
      map['facility'] = Variable<String>(facility);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ConditionsCompanion toCompanion(bool nullToAbsent) {
    return ConditionsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      name: Value(name),
      diagnosedAt: diagnosedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(diagnosedAt),
      doctorName: doctorName == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorName),
      facility: facility == null && nullToAbsent
          ? const Value.absent()
          : Value(facility),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Condition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Condition(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      name: serializer.fromJson<String>(json['name']),
      diagnosedAt: serializer.fromJson<DateTime?>(json['diagnosedAt']),
      doctorName: serializer.fromJson<String?>(json['doctorName']),
      facility: serializer.fromJson<String?>(json['facility']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'name': serializer.toJson<String>(name),
      'diagnosedAt': serializer.toJson<DateTime?>(diagnosedAt),
      'doctorName': serializer.toJson<String?>(doctorName),
      'facility': serializer.toJson<String?>(facility),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Condition copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? name,
    Value<DateTime?> diagnosedAt = const Value.absent(),
    Value<String?> doctorName = const Value.absent(),
    Value<String?> facility = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Condition(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    name: name ?? this.name,
    diagnosedAt: diagnosedAt.present ? diagnosedAt.value : this.diagnosedAt,
    doctorName: doctorName.present ? doctorName.value : this.doctorName,
    facility: facility.present ? facility.value : this.facility,
    notes: notes.present ? notes.value : this.notes,
  );
  Condition copyWithCompanion(ConditionsCompanion data) {
    return Condition(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      name: data.name.present ? data.name.value : this.name,
      diagnosedAt: data.diagnosedAt.present
          ? data.diagnosedAt.value
          : this.diagnosedAt,
      doctorName: data.doctorName.present
          ? data.doctorName.value
          : this.doctorName,
      facility: data.facility.present ? data.facility.value : this.facility,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Condition(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('diagnosedAt: $diagnosedAt, ')
          ..write('doctorName: $doctorName, ')
          ..write('facility: $facility, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    name,
    diagnosedAt,
    doctorName,
    facility,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Condition &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.name == this.name &&
          other.diagnosedAt == this.diagnosedAt &&
          other.doctorName == this.doctorName &&
          other.facility == this.facility &&
          other.notes == this.notes);
}

class ConditionsCompanion extends UpdateCompanion<Condition> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> name;
  final Value<DateTime?> diagnosedAt;
  final Value<String?> doctorName;
  final Value<String?> facility;
  final Value<String?> notes;
  final Value<int> rowid;
  const ConditionsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.diagnosedAt = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.facility = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConditionsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String name,
    this.diagnosedAt = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.facility = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Condition> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? name,
    Expression<DateTime>? diagnosedAt,
    Expression<String>? doctorName,
    Expression<String>? facility,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (name != null) 'name': name,
      if (diagnosedAt != null) 'diagnosed_at': diagnosedAt,
      if (doctorName != null) 'doctor_name': doctorName,
      if (facility != null) 'facility': facility,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConditionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? name,
    Value<DateTime?>? diagnosedAt,
    Value<String?>? doctorName,
    Value<String?>? facility,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ConditionsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      name: name ?? this.name,
      diagnosedAt: diagnosedAt ?? this.diagnosedAt,
      doctorName: doctorName ?? this.doctorName,
      facility: facility ?? this.facility,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (diagnosedAt.present) {
      map['diagnosed_at'] = Variable<DateTime>(diagnosedAt.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (facility.present) {
      map['facility'] = Variable<String>(facility.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConditionsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('diagnosedAt: $diagnosedAt, ')
          ..write('doctorName: $doctorName, ')
          ..write('facility: $facility, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<String> strength = GeneratedColumn<String>(
    'strength',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DoseForm, String> form =
      GeneratedColumn<String>(
        'form',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DoseForm>($MedicationsTable.$converterform);
  static const VerificationMeta _drugClassMeta = const VerificationMeta(
    'drugClass',
  );
  @override
  late final GeneratedColumn<String> drugClass = GeneratedColumn<String>(
    'drug_class',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
    'route',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('oral'),
  );
  static const VerificationMeta _doseAmountMeta = const VerificationMeta(
    'doseAmount',
  );
  @override
  late final GeneratedColumn<double> doseAmount = GeneratedColumn<double>(
    'dose_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Frequency, String> frequency =
      GeneratedColumn<String>(
        'frequency',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Frequency>($MedicationsTable.$converterfrequency);
  @override
  late final GeneratedColumnWithTypeConverter<MealRelation, String>
  mealRelation = GeneratedColumn<String>(
    'meal_relation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MealRelation>($MedicationsTable.$convertermealRelation);
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pillDescriptionMeta = const VerificationMeta(
    'pillDescription',
  );
  @override
  late final GeneratedColumn<String> pillDescription = GeneratedColumn<String>(
    'pill_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conditionIdMeta = const VerificationMeta(
    'conditionId',
  );
  @override
  late final GeneratedColumn<String> conditionId = GeneratedColumn<String>(
    'condition_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES conditions (id)',
    ),
  );
  static const VerificationMeta _prescriberNameMeta = const VerificationMeta(
    'prescriberName',
  );
  @override
  late final GeneratedColumn<String> prescriberName = GeneratedColumn<String>(
    'prescriber_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescriberSpecialtyMeta =
      const VerificationMeta('prescriberSpecialty');
  @override
  late final GeneratedColumn<String> prescriberSpecialty =
      GeneratedColumn<String>(
        'prescriber_specialty',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _facilityMeta = const VerificationMeta(
    'facility',
  );
  @override
  late final GeneratedColumn<String> facility = GeneratedColumn<String>(
    'facility',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescriberPhoneMeta = const VerificationMeta(
    'prescriberPhone',
  );
  @override
  late final GeneratedColumn<String> prescriberPhone = GeneratedColumn<String>(
    'prescriber_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rxNumberMeta = const VerificationMeta(
    'rxNumber',
  );
  @override
  late final GeneratedColumn<String> rxNumber = GeneratedColumn<String>(
    'rx_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescriptionImagePathMeta =
      const VerificationMeta('prescriptionImagePath');
  @override
  late final GeneratedColumn<String> prescriptionImagePath =
      GeneratedColumn<String>(
        'prescription_image_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _stockCountMeta = const VerificationMeta(
    'stockCount',
  );
  @override
  late final GeneratedColumn<double> stockCount = GeneratedColumn<double>(
    'stock_count',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _refillThresholdMeta = const VerificationMeta(
    'refillThreshold',
  );
  @override
  late final GeneratedColumn<double> refillThreshold = GeneratedColumn<double>(
    'refill_threshold',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _sideEffectWatchMeta = const VerificationMeta(
    'sideEffectWatch',
  );
  @override
  late final GeneratedColumn<String> sideEffectWatch = GeneratedColumn<String>(
    'side_effect_watch',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    name,
    strength,
    form,
    drugClass,
    route,
    doseAmount,
    frequency,
    mealRelation,
    instructions,
    pillDescription,
    conditionId,
    prescriberName,
    prescriberSpecialty,
    facility,
    prescriberPhone,
    rxNumber,
    prescriptionImagePath,
    stockCount,
    refillThreshold,
    sideEffectWatch,
    startDate,
    endDate,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    } else if (isInserting) {
      context.missing(_strengthMeta);
    }
    if (data.containsKey('drug_class')) {
      context.handle(
        _drugClassMeta,
        drugClass.isAcceptableOrUnknown(data['drug_class']!, _drugClassMeta),
      );
    }
    if (data.containsKey('route')) {
      context.handle(
        _routeMeta,
        route.isAcceptableOrUnknown(data['route']!, _routeMeta),
      );
    }
    if (data.containsKey('dose_amount')) {
      context.handle(
        _doseAmountMeta,
        doseAmount.isAcceptableOrUnknown(data['dose_amount']!, _doseAmountMeta),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('pill_description')) {
      context.handle(
        _pillDescriptionMeta,
        pillDescription.isAcceptableOrUnknown(
          data['pill_description']!,
          _pillDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('condition_id')) {
      context.handle(
        _conditionIdMeta,
        conditionId.isAcceptableOrUnknown(
          data['condition_id']!,
          _conditionIdMeta,
        ),
      );
    }
    if (data.containsKey('prescriber_name')) {
      context.handle(
        _prescriberNameMeta,
        prescriberName.isAcceptableOrUnknown(
          data['prescriber_name']!,
          _prescriberNameMeta,
        ),
      );
    }
    if (data.containsKey('prescriber_specialty')) {
      context.handle(
        _prescriberSpecialtyMeta,
        prescriberSpecialty.isAcceptableOrUnknown(
          data['prescriber_specialty']!,
          _prescriberSpecialtyMeta,
        ),
      );
    }
    if (data.containsKey('facility')) {
      context.handle(
        _facilityMeta,
        facility.isAcceptableOrUnknown(data['facility']!, _facilityMeta),
      );
    }
    if (data.containsKey('prescriber_phone')) {
      context.handle(
        _prescriberPhoneMeta,
        prescriberPhone.isAcceptableOrUnknown(
          data['prescriber_phone']!,
          _prescriberPhoneMeta,
        ),
      );
    }
    if (data.containsKey('rx_number')) {
      context.handle(
        _rxNumberMeta,
        rxNumber.isAcceptableOrUnknown(data['rx_number']!, _rxNumberMeta),
      );
    }
    if (data.containsKey('prescription_image_path')) {
      context.handle(
        _prescriptionImagePathMeta,
        prescriptionImagePath.isAcceptableOrUnknown(
          data['prescription_image_path']!,
          _prescriptionImagePathMeta,
        ),
      );
    }
    if (data.containsKey('stock_count')) {
      context.handle(
        _stockCountMeta,
        stockCount.isAcceptableOrUnknown(data['stock_count']!, _stockCountMeta),
      );
    }
    if (data.containsKey('refill_threshold')) {
      context.handle(
        _refillThresholdMeta,
        refillThreshold.isAcceptableOrUnknown(
          data['refill_threshold']!,
          _refillThresholdMeta,
        ),
      );
    }
    if (data.containsKey('side_effect_watch')) {
      context.handle(
        _sideEffectWatchMeta,
        sideEffectWatch.isAcceptableOrUnknown(
          data['side_effect_watch']!,
          _sideEffectWatchMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strength'],
      )!,
      form: $MedicationsTable.$converterform.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}form'],
        )!,
      ),
      drugClass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drug_class'],
      ),
      route: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route'],
      )!,
      doseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dose_amount'],
      )!,
      frequency: $MedicationsTable.$converterfrequency.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}frequency'],
        )!,
      ),
      mealRelation: $MedicationsTable.$convertermealRelation.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}meal_relation'],
        )!,
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      ),
      pillDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pill_description'],
      ),
      conditionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition_id'],
      ),
      prescriberName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescriber_name'],
      ),
      prescriberSpecialty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescriber_specialty'],
      ),
      facility: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}facility'],
      ),
      prescriberPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescriber_phone'],
      ),
      rxNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rx_number'],
      ),
      prescriptionImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescription_image_path'],
      ),
      stockCount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}stock_count'],
      ),
      refillThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}refill_threshold'],
      )!,
      sideEffectWatch: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side_effect_watch'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DoseForm, String, String> $converterform =
      const EnumNameConverter<DoseForm>(DoseForm.values);
  static JsonTypeConverter2<Frequency, String, String> $converterfrequency =
      const EnumNameConverter<Frequency>(Frequency.values);
  static JsonTypeConverter2<MealRelation, String, String>
  $convertermealRelation = const EnumNameConverter<MealRelation>(
    MealRelation.values,
  );
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final String name;
  final String strength;
  final DoseForm form;
  final String? drugClass;
  final String route;
  final double doseAmount;
  final Frequency frequency;
  final MealRelation mealRelation;
  final String? instructions;
  final String? pillDescription;
  final String? conditionId;
  final String? prescriberName;
  final String? prescriberSpecialty;
  final String? facility;
  final String? prescriberPhone;
  final String? rxNumber;
  final String? prescriptionImagePath;
  final double? stockCount;
  final double refillThreshold;

  /// JSON array of symptom keys the prescriber asked the patient to watch.
  final String sideEffectWatch;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isActive;
  const Medication({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.strength,
    required this.form,
    this.drugClass,
    required this.route,
    required this.doseAmount,
    required this.frequency,
    required this.mealRelation,
    this.instructions,
    this.pillDescription,
    this.conditionId,
    this.prescriberName,
    this.prescriberSpecialty,
    this.facility,
    this.prescriberPhone,
    this.rxNumber,
    this.prescriptionImagePath,
    this.stockCount,
    required this.refillThreshold,
    required this.sideEffectWatch,
    required this.startDate,
    this.endDate,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['name'] = Variable<String>(name);
    map['strength'] = Variable<String>(strength);
    {
      map['form'] = Variable<String>(
        $MedicationsTable.$converterform.toSql(form),
      );
    }
    if (!nullToAbsent || drugClass != null) {
      map['drug_class'] = Variable<String>(drugClass);
    }
    map['route'] = Variable<String>(route);
    map['dose_amount'] = Variable<double>(doseAmount);
    {
      map['frequency'] = Variable<String>(
        $MedicationsTable.$converterfrequency.toSql(frequency),
      );
    }
    {
      map['meal_relation'] = Variable<String>(
        $MedicationsTable.$convertermealRelation.toSql(mealRelation),
      );
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || pillDescription != null) {
      map['pill_description'] = Variable<String>(pillDescription);
    }
    if (!nullToAbsent || conditionId != null) {
      map['condition_id'] = Variable<String>(conditionId);
    }
    if (!nullToAbsent || prescriberName != null) {
      map['prescriber_name'] = Variable<String>(prescriberName);
    }
    if (!nullToAbsent || prescriberSpecialty != null) {
      map['prescriber_specialty'] = Variable<String>(prescriberSpecialty);
    }
    if (!nullToAbsent || facility != null) {
      map['facility'] = Variable<String>(facility);
    }
    if (!nullToAbsent || prescriberPhone != null) {
      map['prescriber_phone'] = Variable<String>(prescriberPhone);
    }
    if (!nullToAbsent || rxNumber != null) {
      map['rx_number'] = Variable<String>(rxNumber);
    }
    if (!nullToAbsent || prescriptionImagePath != null) {
      map['prescription_image_path'] = Variable<String>(prescriptionImagePath);
    }
    if (!nullToAbsent || stockCount != null) {
      map['stock_count'] = Variable<double>(stockCount);
    }
    map['refill_threshold'] = Variable<double>(refillThreshold);
    map['side_effect_watch'] = Variable<String>(sideEffectWatch);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      name: Value(name),
      strength: Value(strength),
      form: Value(form),
      drugClass: drugClass == null && nullToAbsent
          ? const Value.absent()
          : Value(drugClass),
      route: Value(route),
      doseAmount: Value(doseAmount),
      frequency: Value(frequency),
      mealRelation: Value(mealRelation),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      pillDescription: pillDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(pillDescription),
      conditionId: conditionId == null && nullToAbsent
          ? const Value.absent()
          : Value(conditionId),
      prescriberName: prescriberName == null && nullToAbsent
          ? const Value.absent()
          : Value(prescriberName),
      prescriberSpecialty: prescriberSpecialty == null && nullToAbsent
          ? const Value.absent()
          : Value(prescriberSpecialty),
      facility: facility == null && nullToAbsent
          ? const Value.absent()
          : Value(facility),
      prescriberPhone: prescriberPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(prescriberPhone),
      rxNumber: rxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(rxNumber),
      prescriptionImagePath: prescriptionImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(prescriptionImagePath),
      stockCount: stockCount == null && nullToAbsent
          ? const Value.absent()
          : Value(stockCount),
      refillThreshold: Value(refillThreshold),
      sideEffectWatch: Value(sideEffectWatch),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isActive: Value(isActive),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      name: serializer.fromJson<String>(json['name']),
      strength: serializer.fromJson<String>(json['strength']),
      form: $MedicationsTable.$converterform.fromJson(
        serializer.fromJson<String>(json['form']),
      ),
      drugClass: serializer.fromJson<String?>(json['drugClass']),
      route: serializer.fromJson<String>(json['route']),
      doseAmount: serializer.fromJson<double>(json['doseAmount']),
      frequency: $MedicationsTable.$converterfrequency.fromJson(
        serializer.fromJson<String>(json['frequency']),
      ),
      mealRelation: $MedicationsTable.$convertermealRelation.fromJson(
        serializer.fromJson<String>(json['mealRelation']),
      ),
      instructions: serializer.fromJson<String?>(json['instructions']),
      pillDescription: serializer.fromJson<String?>(json['pillDescription']),
      conditionId: serializer.fromJson<String?>(json['conditionId']),
      prescriberName: serializer.fromJson<String?>(json['prescriberName']),
      prescriberSpecialty: serializer.fromJson<String?>(
        json['prescriberSpecialty'],
      ),
      facility: serializer.fromJson<String?>(json['facility']),
      prescriberPhone: serializer.fromJson<String?>(json['prescriberPhone']),
      rxNumber: serializer.fromJson<String?>(json['rxNumber']),
      prescriptionImagePath: serializer.fromJson<String?>(
        json['prescriptionImagePath'],
      ),
      stockCount: serializer.fromJson<double?>(json['stockCount']),
      refillThreshold: serializer.fromJson<double>(json['refillThreshold']),
      sideEffectWatch: serializer.fromJson<String>(json['sideEffectWatch']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'name': serializer.toJson<String>(name),
      'strength': serializer.toJson<String>(strength),
      'form': serializer.toJson<String>(
        $MedicationsTable.$converterform.toJson(form),
      ),
      'drugClass': serializer.toJson<String?>(drugClass),
      'route': serializer.toJson<String>(route),
      'doseAmount': serializer.toJson<double>(doseAmount),
      'frequency': serializer.toJson<String>(
        $MedicationsTable.$converterfrequency.toJson(frequency),
      ),
      'mealRelation': serializer.toJson<String>(
        $MedicationsTable.$convertermealRelation.toJson(mealRelation),
      ),
      'instructions': serializer.toJson<String?>(instructions),
      'pillDescription': serializer.toJson<String?>(pillDescription),
      'conditionId': serializer.toJson<String?>(conditionId),
      'prescriberName': serializer.toJson<String?>(prescriberName),
      'prescriberSpecialty': serializer.toJson<String?>(prescriberSpecialty),
      'facility': serializer.toJson<String?>(facility),
      'prescriberPhone': serializer.toJson<String?>(prescriberPhone),
      'rxNumber': serializer.toJson<String?>(rxNumber),
      'prescriptionImagePath': serializer.toJson<String?>(
        prescriptionImagePath,
      ),
      'stockCount': serializer.toJson<double?>(stockCount),
      'refillThreshold': serializer.toJson<double>(refillThreshold),
      'sideEffectWatch': serializer.toJson<String>(sideEffectWatch),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Medication copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? name,
    String? strength,
    DoseForm? form,
    Value<String?> drugClass = const Value.absent(),
    String? route,
    double? doseAmount,
    Frequency? frequency,
    MealRelation? mealRelation,
    Value<String?> instructions = const Value.absent(),
    Value<String?> pillDescription = const Value.absent(),
    Value<String?> conditionId = const Value.absent(),
    Value<String?> prescriberName = const Value.absent(),
    Value<String?> prescriberSpecialty = const Value.absent(),
    Value<String?> facility = const Value.absent(),
    Value<String?> prescriberPhone = const Value.absent(),
    Value<String?> rxNumber = const Value.absent(),
    Value<String?> prescriptionImagePath = const Value.absent(),
    Value<double?> stockCount = const Value.absent(),
    double? refillThreshold,
    String? sideEffectWatch,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    bool? isActive,
  }) => Medication(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    name: name ?? this.name,
    strength: strength ?? this.strength,
    form: form ?? this.form,
    drugClass: drugClass.present ? drugClass.value : this.drugClass,
    route: route ?? this.route,
    doseAmount: doseAmount ?? this.doseAmount,
    frequency: frequency ?? this.frequency,
    mealRelation: mealRelation ?? this.mealRelation,
    instructions: instructions.present ? instructions.value : this.instructions,
    pillDescription: pillDescription.present
        ? pillDescription.value
        : this.pillDescription,
    conditionId: conditionId.present ? conditionId.value : this.conditionId,
    prescriberName: prescriberName.present
        ? prescriberName.value
        : this.prescriberName,
    prescriberSpecialty: prescriberSpecialty.present
        ? prescriberSpecialty.value
        : this.prescriberSpecialty,
    facility: facility.present ? facility.value : this.facility,
    prescriberPhone: prescriberPhone.present
        ? prescriberPhone.value
        : this.prescriberPhone,
    rxNumber: rxNumber.present ? rxNumber.value : this.rxNumber,
    prescriptionImagePath: prescriptionImagePath.present
        ? prescriptionImagePath.value
        : this.prescriptionImagePath,
    stockCount: stockCount.present ? stockCount.value : this.stockCount,
    refillThreshold: refillThreshold ?? this.refillThreshold,
    sideEffectWatch: sideEffectWatch ?? this.sideEffectWatch,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    isActive: isActive ?? this.isActive,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      name: data.name.present ? data.name.value : this.name,
      strength: data.strength.present ? data.strength.value : this.strength,
      form: data.form.present ? data.form.value : this.form,
      drugClass: data.drugClass.present ? data.drugClass.value : this.drugClass,
      route: data.route.present ? data.route.value : this.route,
      doseAmount: data.doseAmount.present
          ? data.doseAmount.value
          : this.doseAmount,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      mealRelation: data.mealRelation.present
          ? data.mealRelation.value
          : this.mealRelation,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      pillDescription: data.pillDescription.present
          ? data.pillDescription.value
          : this.pillDescription,
      conditionId: data.conditionId.present
          ? data.conditionId.value
          : this.conditionId,
      prescriberName: data.prescriberName.present
          ? data.prescriberName.value
          : this.prescriberName,
      prescriberSpecialty: data.prescriberSpecialty.present
          ? data.prescriberSpecialty.value
          : this.prescriberSpecialty,
      facility: data.facility.present ? data.facility.value : this.facility,
      prescriberPhone: data.prescriberPhone.present
          ? data.prescriberPhone.value
          : this.prescriberPhone,
      rxNumber: data.rxNumber.present ? data.rxNumber.value : this.rxNumber,
      prescriptionImagePath: data.prescriptionImagePath.present
          ? data.prescriptionImagePath.value
          : this.prescriptionImagePath,
      stockCount: data.stockCount.present
          ? data.stockCount.value
          : this.stockCount,
      refillThreshold: data.refillThreshold.present
          ? data.refillThreshold.value
          : this.refillThreshold,
      sideEffectWatch: data.sideEffectWatch.present
          ? data.sideEffectWatch.value
          : this.sideEffectWatch,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('strength: $strength, ')
          ..write('form: $form, ')
          ..write('drugClass: $drugClass, ')
          ..write('route: $route, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('frequency: $frequency, ')
          ..write('mealRelation: $mealRelation, ')
          ..write('instructions: $instructions, ')
          ..write('pillDescription: $pillDescription, ')
          ..write('conditionId: $conditionId, ')
          ..write('prescriberName: $prescriberName, ')
          ..write('prescriberSpecialty: $prescriberSpecialty, ')
          ..write('facility: $facility, ')
          ..write('prescriberPhone: $prescriberPhone, ')
          ..write('rxNumber: $rxNumber, ')
          ..write('prescriptionImagePath: $prescriptionImagePath, ')
          ..write('stockCount: $stockCount, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('sideEffectWatch: $sideEffectWatch, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    deletedAt,
    name,
    strength,
    form,
    drugClass,
    route,
    doseAmount,
    frequency,
    mealRelation,
    instructions,
    pillDescription,
    conditionId,
    prescriberName,
    prescriberSpecialty,
    facility,
    prescriberPhone,
    rxNumber,
    prescriptionImagePath,
    stockCount,
    refillThreshold,
    sideEffectWatch,
    startDate,
    endDate,
    isActive,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.name == this.name &&
          other.strength == this.strength &&
          other.form == this.form &&
          other.drugClass == this.drugClass &&
          other.route == this.route &&
          other.doseAmount == this.doseAmount &&
          other.frequency == this.frequency &&
          other.mealRelation == this.mealRelation &&
          other.instructions == this.instructions &&
          other.pillDescription == this.pillDescription &&
          other.conditionId == this.conditionId &&
          other.prescriberName == this.prescriberName &&
          other.prescriberSpecialty == this.prescriberSpecialty &&
          other.facility == this.facility &&
          other.prescriberPhone == this.prescriberPhone &&
          other.rxNumber == this.rxNumber &&
          other.prescriptionImagePath == this.prescriptionImagePath &&
          other.stockCount == this.stockCount &&
          other.refillThreshold == this.refillThreshold &&
          other.sideEffectWatch == this.sideEffectWatch &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isActive == this.isActive);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> name;
  final Value<String> strength;
  final Value<DoseForm> form;
  final Value<String?> drugClass;
  final Value<String> route;
  final Value<double> doseAmount;
  final Value<Frequency> frequency;
  final Value<MealRelation> mealRelation;
  final Value<String?> instructions;
  final Value<String?> pillDescription;
  final Value<String?> conditionId;
  final Value<String?> prescriberName;
  final Value<String?> prescriberSpecialty;
  final Value<String?> facility;
  final Value<String?> prescriberPhone;
  final Value<String?> rxNumber;
  final Value<String?> prescriptionImagePath;
  final Value<double?> stockCount;
  final Value<double> refillThreshold;
  final Value<String> sideEffectWatch;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<bool> isActive;
  final Value<int> rowid;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.strength = const Value.absent(),
    this.form = const Value.absent(),
    this.drugClass = const Value.absent(),
    this.route = const Value.absent(),
    this.doseAmount = const Value.absent(),
    this.frequency = const Value.absent(),
    this.mealRelation = const Value.absent(),
    this.instructions = const Value.absent(),
    this.pillDescription = const Value.absent(),
    this.conditionId = const Value.absent(),
    this.prescriberName = const Value.absent(),
    this.prescriberSpecialty = const Value.absent(),
    this.facility = const Value.absent(),
    this.prescriberPhone = const Value.absent(),
    this.rxNumber = const Value.absent(),
    this.prescriptionImagePath = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.refillThreshold = const Value.absent(),
    this.sideEffectWatch = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String name,
    required String strength,
    required DoseForm form,
    this.drugClass = const Value.absent(),
    this.route = const Value.absent(),
    this.doseAmount = const Value.absent(),
    required Frequency frequency,
    required MealRelation mealRelation,
    this.instructions = const Value.absent(),
    this.pillDescription = const Value.absent(),
    this.conditionId = const Value.absent(),
    this.prescriberName = const Value.absent(),
    this.prescriberSpecialty = const Value.absent(),
    this.facility = const Value.absent(),
    this.prescriberPhone = const Value.absent(),
    this.rxNumber = const Value.absent(),
    this.prescriptionImagePath = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.refillThreshold = const Value.absent(),
    this.sideEffectWatch = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       strength = Value(strength),
       form = Value(form),
       frequency = Value(frequency),
       mealRelation = Value(mealRelation);
  static Insertable<Medication> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? name,
    Expression<String>? strength,
    Expression<String>? form,
    Expression<String>? drugClass,
    Expression<String>? route,
    Expression<double>? doseAmount,
    Expression<String>? frequency,
    Expression<String>? mealRelation,
    Expression<String>? instructions,
    Expression<String>? pillDescription,
    Expression<String>? conditionId,
    Expression<String>? prescriberName,
    Expression<String>? prescriberSpecialty,
    Expression<String>? facility,
    Expression<String>? prescriberPhone,
    Expression<String>? rxNumber,
    Expression<String>? prescriptionImagePath,
    Expression<double>? stockCount,
    Expression<double>? refillThreshold,
    Expression<String>? sideEffectWatch,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (name != null) 'name': name,
      if (strength != null) 'strength': strength,
      if (form != null) 'form': form,
      if (drugClass != null) 'drug_class': drugClass,
      if (route != null) 'route': route,
      if (doseAmount != null) 'dose_amount': doseAmount,
      if (frequency != null) 'frequency': frequency,
      if (mealRelation != null) 'meal_relation': mealRelation,
      if (instructions != null) 'instructions': instructions,
      if (pillDescription != null) 'pill_description': pillDescription,
      if (conditionId != null) 'condition_id': conditionId,
      if (prescriberName != null) 'prescriber_name': prescriberName,
      if (prescriberSpecialty != null)
        'prescriber_specialty': prescriberSpecialty,
      if (facility != null) 'facility': facility,
      if (prescriberPhone != null) 'prescriber_phone': prescriberPhone,
      if (rxNumber != null) 'rx_number': rxNumber,
      if (prescriptionImagePath != null)
        'prescription_image_path': prescriptionImagePath,
      if (stockCount != null) 'stock_count': stockCount,
      if (refillThreshold != null) 'refill_threshold': refillThreshold,
      if (sideEffectWatch != null) 'side_effect_watch': sideEffectWatch,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? name,
    Value<String>? strength,
    Value<DoseForm>? form,
    Value<String?>? drugClass,
    Value<String>? route,
    Value<double>? doseAmount,
    Value<Frequency>? frequency,
    Value<MealRelation>? mealRelation,
    Value<String?>? instructions,
    Value<String?>? pillDescription,
    Value<String?>? conditionId,
    Value<String?>? prescriberName,
    Value<String?>? prescriberSpecialty,
    Value<String?>? facility,
    Value<String?>? prescriberPhone,
    Value<String?>? rxNumber,
    Value<String?>? prescriptionImagePath,
    Value<double?>? stockCount,
    Value<double>? refillThreshold,
    Value<String>? sideEffectWatch,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      name: name ?? this.name,
      strength: strength ?? this.strength,
      form: form ?? this.form,
      drugClass: drugClass ?? this.drugClass,
      route: route ?? this.route,
      doseAmount: doseAmount ?? this.doseAmount,
      frequency: frequency ?? this.frequency,
      mealRelation: mealRelation ?? this.mealRelation,
      instructions: instructions ?? this.instructions,
      pillDescription: pillDescription ?? this.pillDescription,
      conditionId: conditionId ?? this.conditionId,
      prescriberName: prescriberName ?? this.prescriberName,
      prescriberSpecialty: prescriberSpecialty ?? this.prescriberSpecialty,
      facility: facility ?? this.facility,
      prescriberPhone: prescriberPhone ?? this.prescriberPhone,
      rxNumber: rxNumber ?? this.rxNumber,
      prescriptionImagePath:
          prescriptionImagePath ?? this.prescriptionImagePath,
      stockCount: stockCount ?? this.stockCount,
      refillThreshold: refillThreshold ?? this.refillThreshold,
      sideEffectWatch: sideEffectWatch ?? this.sideEffectWatch,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (strength.present) {
      map['strength'] = Variable<String>(strength.value);
    }
    if (form.present) {
      map['form'] = Variable<String>(
        $MedicationsTable.$converterform.toSql(form.value),
      );
    }
    if (drugClass.present) {
      map['drug_class'] = Variable<String>(drugClass.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (doseAmount.present) {
      map['dose_amount'] = Variable<double>(doseAmount.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(
        $MedicationsTable.$converterfrequency.toSql(frequency.value),
      );
    }
    if (mealRelation.present) {
      map['meal_relation'] = Variable<String>(
        $MedicationsTable.$convertermealRelation.toSql(mealRelation.value),
      );
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (pillDescription.present) {
      map['pill_description'] = Variable<String>(pillDescription.value);
    }
    if (conditionId.present) {
      map['condition_id'] = Variable<String>(conditionId.value);
    }
    if (prescriberName.present) {
      map['prescriber_name'] = Variable<String>(prescriberName.value);
    }
    if (prescriberSpecialty.present) {
      map['prescriber_specialty'] = Variable<String>(prescriberSpecialty.value);
    }
    if (facility.present) {
      map['facility'] = Variable<String>(facility.value);
    }
    if (prescriberPhone.present) {
      map['prescriber_phone'] = Variable<String>(prescriberPhone.value);
    }
    if (rxNumber.present) {
      map['rx_number'] = Variable<String>(rxNumber.value);
    }
    if (prescriptionImagePath.present) {
      map['prescription_image_path'] = Variable<String>(
        prescriptionImagePath.value,
      );
    }
    if (stockCount.present) {
      map['stock_count'] = Variable<double>(stockCount.value);
    }
    if (refillThreshold.present) {
      map['refill_threshold'] = Variable<double>(refillThreshold.value);
    }
    if (sideEffectWatch.present) {
      map['side_effect_watch'] = Variable<String>(sideEffectWatch.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('strength: $strength, ')
          ..write('form: $form, ')
          ..write('drugClass: $drugClass, ')
          ..write('route: $route, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('frequency: $frequency, ')
          ..write('mealRelation: $mealRelation, ')
          ..write('instructions: $instructions, ')
          ..write('pillDescription: $pillDescription, ')
          ..write('conditionId: $conditionId, ')
          ..write('prescriberName: $prescriberName, ')
          ..write('prescriberSpecialty: $prescriberSpecialty, ')
          ..write('facility: $facility, ')
          ..write('prescriberPhone: $prescriberPhone, ')
          ..write('rxNumber: $rxNumber, ')
          ..write('prescriptionImagePath: $prescriptionImagePath, ')
          ..write('stockCount: $stockCount, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('sideEffectWatch: $sideEffectWatch, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseSchedulesTable extends DoseSchedules
    with TableInfo<$DoseSchedulesTable, DoseSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id)',
    ),
  );
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int> hour = GeneratedColumn<int>(
    'hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute = GeneratedColumn<int>(
    'minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseAmountMeta = const VerificationMeta(
    'doseAmount',
  );
  @override
  late final GeneratedColumn<double> doseAmount = GeneratedColumn<double>(
    'dose_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('custom'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    medicationId,
    hour,
    minute,
    doseAmount,
    slot,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_schedules';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoseSchedule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('hour')) {
      context.handle(
        _hourMeta,
        hour.isAcceptableOrUnknown(data['hour']!, _hourMeta),
      );
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(
        _minuteMeta,
        minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta),
      );
    } else if (isInserting) {
      context.missing(_minuteMeta);
    }
    if (data.containsKey('dose_amount')) {
      context.handle(
        _doseAmountMeta,
        doseAmount.isAcceptableOrUnknown(data['dose_amount']!, _doseAmountMeta),
      );
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseSchedule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      )!,
      hour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hour'],
      )!,
      minute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minute'],
      )!,
      doseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dose_amount'],
      )!,
      slot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slot'],
      )!,
    );
  }

  @override
  $DoseSchedulesTable createAlias(String alias) {
    return $DoseSchedulesTable(attachedDatabase, alias);
  }
}

class DoseSchedule extends DataClass implements Insertable<DoseSchedule> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final String medicationId;
  final int hour;
  final int minute;
  final double doseAmount;

  /// breakfast | lunch | dinner | bedtime | custom
  final String slot;
  const DoseSchedule({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.medicationId,
    required this.hour,
    required this.minute,
    required this.doseAmount,
    required this.slot,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['medication_id'] = Variable<String>(medicationId);
    map['hour'] = Variable<int>(hour);
    map['minute'] = Variable<int>(minute);
    map['dose_amount'] = Variable<double>(doseAmount);
    map['slot'] = Variable<String>(slot);
    return map;
  }

  DoseSchedulesCompanion toCompanion(bool nullToAbsent) {
    return DoseSchedulesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      medicationId: Value(medicationId),
      hour: Value(hour),
      minute: Value(minute),
      doseAmount: Value(doseAmount),
      slot: Value(slot),
    );
  }

  factory DoseSchedule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseSchedule(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      medicationId: serializer.fromJson<String>(json['medicationId']),
      hour: serializer.fromJson<int>(json['hour']),
      minute: serializer.fromJson<int>(json['minute']),
      doseAmount: serializer.fromJson<double>(json['doseAmount']),
      slot: serializer.fromJson<String>(json['slot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'medicationId': serializer.toJson<String>(medicationId),
      'hour': serializer.toJson<int>(hour),
      'minute': serializer.toJson<int>(minute),
      'doseAmount': serializer.toJson<double>(doseAmount),
      'slot': serializer.toJson<String>(slot),
    };
  }

  DoseSchedule copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? medicationId,
    int? hour,
    int? minute,
    double? doseAmount,
    String? slot,
  }) => DoseSchedule(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    medicationId: medicationId ?? this.medicationId,
    hour: hour ?? this.hour,
    minute: minute ?? this.minute,
    doseAmount: doseAmount ?? this.doseAmount,
    slot: slot ?? this.slot,
  );
  DoseSchedule copyWithCompanion(DoseSchedulesCompanion data) {
    return DoseSchedule(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      hour: data.hour.present ? data.hour.value : this.hour,
      minute: data.minute.present ? data.minute.value : this.minute,
      doseAmount: data.doseAmount.present
          ? data.doseAmount.value
          : this.doseAmount,
      slot: data.slot.present ? data.slot.value : this.slot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseSchedule(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('medicationId: $medicationId, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('slot: $slot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    medicationId,
    hour,
    minute,
    doseAmount,
    slot,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseSchedule &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.medicationId == this.medicationId &&
          other.hour == this.hour &&
          other.minute == this.minute &&
          other.doseAmount == this.doseAmount &&
          other.slot == this.slot);
}

class DoseSchedulesCompanion extends UpdateCompanion<DoseSchedule> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> medicationId;
  final Value<int> hour;
  final Value<int> minute;
  final Value<double> doseAmount;
  final Value<String> slot;
  final Value<int> rowid;
  const DoseSchedulesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
    this.doseAmount = const Value.absent(),
    this.slot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseSchedulesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String medicationId,
    required int hour,
    required int minute,
    this.doseAmount = const Value.absent(),
    this.slot = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicationId = Value(medicationId),
       hour = Value(hour),
       minute = Value(minute);
  static Insertable<DoseSchedule> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? medicationId,
    Expression<int>? hour,
    Expression<int>? minute,
    Expression<double>? doseAmount,
    Expression<String>? slot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (medicationId != null) 'medication_id': medicationId,
      if (hour != null) 'hour': hour,
      if (minute != null) 'minute': minute,
      if (doseAmount != null) 'dose_amount': doseAmount,
      if (slot != null) 'slot': slot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseSchedulesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? medicationId,
    Value<int>? hour,
    Value<int>? minute,
    Value<double>? doseAmount,
    Value<String>? slot,
    Value<int>? rowid,
  }) {
    return DoseSchedulesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      medicationId: medicationId ?? this.medicationId,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      doseAmount: doseAmount ?? this.doseAmount,
      slot: slot ?? this.slot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (hour.present) {
      map['hour'] = Variable<int>(hour.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    if (doseAmount.present) {
      map['dose_amount'] = Variable<double>(doseAmount.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('medicationId: $medicationId, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('slot: $slot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseLogsTable extends DoseLogs with TableInfo<$DoseLogsTable, DoseLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id)',
    ),
  );
  static const VerificationMeta _scheduleIdMeta = const VerificationMeta(
    'scheduleId',
  );
  @override
  late final GeneratedColumn<String> scheduleId = GeneratedColumn<String>(
    'schedule_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dose_schedules (id)',
    ),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionAtMeta = const VerificationMeta(
    'actionAt',
  );
  @override
  late final GeneratedColumn<DateTime> actionAt = GeneratedColumn<DateTime>(
    'action_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DoseStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DoseStatus>($DoseLogsTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<SkipReason?, String> skipReason =
      GeneratedColumn<String>(
        'skip_reason',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<SkipReason?>($DoseLogsTable.$converterskipReasonn);
  static const VerificationMeta _doseAmountMeta = const VerificationMeta(
    'doseAmount',
  );
  @override
  late final GeneratedColumn<double> doseAmount = GeneratedColumn<double>(
    'dose_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    medicationId,
    scheduleId,
    scheduledAt,
    actionAt,
    status,
    skipReason,
    doseAmount,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoseLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('schedule_id')) {
      context.handle(
        _scheduleIdMeta,
        scheduleId.isAcceptableOrUnknown(data['schedule_id']!, _scheduleIdMeta),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('action_at')) {
      context.handle(
        _actionAtMeta,
        actionAt.isAcceptableOrUnknown(data['action_at']!, _actionAtMeta),
      );
    } else if (isInserting) {
      context.missing(_actionAtMeta);
    }
    if (data.containsKey('dose_amount')) {
      context.handle(
        _doseAmountMeta,
        doseAmount.isAcceptableOrUnknown(data['dose_amount']!, _doseAmountMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      )!,
      scheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}schedule_id'],
      ),
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      actionAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}action_at'],
      )!,
      status: $DoseLogsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      skipReason: $DoseLogsTable.$converterskipReasonn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}skip_reason'],
        ),
      ),
      doseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dose_amount'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $DoseLogsTable createAlias(String alias) {
    return $DoseLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DoseStatus, String, String> $converterstatus =
      const EnumNameConverter<DoseStatus>(DoseStatus.values);
  static JsonTypeConverter2<SkipReason, String, String> $converterskipReason =
      const EnumNameConverter<SkipReason>(SkipReason.values);
  static JsonTypeConverter2<SkipReason?, String?, String?>
  $converterskipReasonn = JsonTypeConverter2.asNullable($converterskipReason);
}

class DoseLog extends DataClass implements Insertable<DoseLog> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final String medicationId;
  final String? scheduleId;

  /// The planned time. For PRN doses this equals [actionAt].
  final DateTime scheduledAt;
  final DateTime actionAt;
  final DoseStatus status;
  final SkipReason? skipReason;
  final double doseAmount;
  final String? note;
  const DoseLog({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.medicationId,
    this.scheduleId,
    required this.scheduledAt,
    required this.actionAt,
    required this.status,
    this.skipReason,
    required this.doseAmount,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['medication_id'] = Variable<String>(medicationId);
    if (!nullToAbsent || scheduleId != null) {
      map['schedule_id'] = Variable<String>(scheduleId);
    }
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['action_at'] = Variable<DateTime>(actionAt);
    {
      map['status'] = Variable<String>(
        $DoseLogsTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || skipReason != null) {
      map['skip_reason'] = Variable<String>(
        $DoseLogsTable.$converterskipReasonn.toSql(skipReason),
      );
    }
    map['dose_amount'] = Variable<double>(doseAmount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  DoseLogsCompanion toCompanion(bool nullToAbsent) {
    return DoseLogsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      medicationId: Value(medicationId),
      scheduleId: scheduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduleId),
      scheduledAt: Value(scheduledAt),
      actionAt: Value(actionAt),
      status: Value(status),
      skipReason: skipReason == null && nullToAbsent
          ? const Value.absent()
          : Value(skipReason),
      doseAmount: Value(doseAmount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory DoseLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseLog(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      medicationId: serializer.fromJson<String>(json['medicationId']),
      scheduleId: serializer.fromJson<String?>(json['scheduleId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      actionAt: serializer.fromJson<DateTime>(json['actionAt']),
      status: $DoseLogsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      skipReason: $DoseLogsTable.$converterskipReasonn.fromJson(
        serializer.fromJson<String?>(json['skipReason']),
      ),
      doseAmount: serializer.fromJson<double>(json['doseAmount']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'medicationId': serializer.toJson<String>(medicationId),
      'scheduleId': serializer.toJson<String?>(scheduleId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'actionAt': serializer.toJson<DateTime>(actionAt),
      'status': serializer.toJson<String>(
        $DoseLogsTable.$converterstatus.toJson(status),
      ),
      'skipReason': serializer.toJson<String?>(
        $DoseLogsTable.$converterskipReasonn.toJson(skipReason),
      ),
      'doseAmount': serializer.toJson<double>(doseAmount),
      'note': serializer.toJson<String?>(note),
    };
  }

  DoseLog copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? medicationId,
    Value<String?> scheduleId = const Value.absent(),
    DateTime? scheduledAt,
    DateTime? actionAt,
    DoseStatus? status,
    Value<SkipReason?> skipReason = const Value.absent(),
    double? doseAmount,
    Value<String?> note = const Value.absent(),
  }) => DoseLog(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    medicationId: medicationId ?? this.medicationId,
    scheduleId: scheduleId.present ? scheduleId.value : this.scheduleId,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    actionAt: actionAt ?? this.actionAt,
    status: status ?? this.status,
    skipReason: skipReason.present ? skipReason.value : this.skipReason,
    doseAmount: doseAmount ?? this.doseAmount,
    note: note.present ? note.value : this.note,
  );
  DoseLog copyWithCompanion(DoseLogsCompanion data) {
    return DoseLog(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      scheduleId: data.scheduleId.present
          ? data.scheduleId.value
          : this.scheduleId,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      actionAt: data.actionAt.present ? data.actionAt.value : this.actionAt,
      status: data.status.present ? data.status.value : this.status,
      skipReason: data.skipReason.present
          ? data.skipReason.value
          : this.skipReason,
      doseAmount: data.doseAmount.present
          ? data.doseAmount.value
          : this.doseAmount,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseLog(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('medicationId: $medicationId, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('actionAt: $actionAt, ')
          ..write('status: $status, ')
          ..write('skipReason: $skipReason, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    medicationId,
    scheduleId,
    scheduledAt,
    actionAt,
    status,
    skipReason,
    doseAmount,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseLog &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.medicationId == this.medicationId &&
          other.scheduleId == this.scheduleId &&
          other.scheduledAt == this.scheduledAt &&
          other.actionAt == this.actionAt &&
          other.status == this.status &&
          other.skipReason == this.skipReason &&
          other.doseAmount == this.doseAmount &&
          other.note == this.note);
}

class DoseLogsCompanion extends UpdateCompanion<DoseLog> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> medicationId;
  final Value<String?> scheduleId;
  final Value<DateTime> scheduledAt;
  final Value<DateTime> actionAt;
  final Value<DoseStatus> status;
  final Value<SkipReason?> skipReason;
  final Value<double> doseAmount;
  final Value<String?> note;
  final Value<int> rowid;
  const DoseLogsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.scheduleId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.actionAt = const Value.absent(),
    this.status = const Value.absent(),
    this.skipReason = const Value.absent(),
    this.doseAmount = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseLogsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String medicationId,
    this.scheduleId = const Value.absent(),
    required DateTime scheduledAt,
    required DateTime actionAt,
    required DoseStatus status,
    this.skipReason = const Value.absent(),
    this.doseAmount = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicationId = Value(medicationId),
       scheduledAt = Value(scheduledAt),
       actionAt = Value(actionAt),
       status = Value(status);
  static Insertable<DoseLog> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? medicationId,
    Expression<String>? scheduleId,
    Expression<DateTime>? scheduledAt,
    Expression<DateTime>? actionAt,
    Expression<String>? status,
    Expression<String>? skipReason,
    Expression<double>? doseAmount,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (medicationId != null) 'medication_id': medicationId,
      if (scheduleId != null) 'schedule_id': scheduleId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (actionAt != null) 'action_at': actionAt,
      if (status != null) 'status': status,
      if (skipReason != null) 'skip_reason': skipReason,
      if (doseAmount != null) 'dose_amount': doseAmount,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? medicationId,
    Value<String?>? scheduleId,
    Value<DateTime>? scheduledAt,
    Value<DateTime>? actionAt,
    Value<DoseStatus>? status,
    Value<SkipReason?>? skipReason,
    Value<double>? doseAmount,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return DoseLogsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      medicationId: medicationId ?? this.medicationId,
      scheduleId: scheduleId ?? this.scheduleId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      actionAt: actionAt ?? this.actionAt,
      status: status ?? this.status,
      skipReason: skipReason ?? this.skipReason,
      doseAmount: doseAmount ?? this.doseAmount,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (scheduleId.present) {
      map['schedule_id'] = Variable<String>(scheduleId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (actionAt.present) {
      map['action_at'] = Variable<DateTime>(actionAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $DoseLogsTable.$converterstatus.toSql(status.value),
      );
    }
    if (skipReason.present) {
      map['skip_reason'] = Variable<String>(
        $DoseLogsTable.$converterskipReasonn.toSql(skipReason.value),
      );
    }
    if (doseAmount.present) {
      map['dose_amount'] = Variable<double>(doseAmount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseLogsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('medicationId: $medicationId, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('actionAt: $actionAt, ')
          ..write('status: $status, ')
          ..write('skipReason: $skipReason, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SnoozesTable extends Snoozes with TableInfo<$SnoozesTable, Snooze> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SnoozesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scheduleIdMeta = const VerificationMeta(
    'scheduleId',
  );
  @override
  late final GeneratedColumn<String> scheduleId = GeneratedColumn<String>(
    'schedule_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dose_schedules (id)',
    ),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _snoozedUntilMeta = const VerificationMeta(
    'snoozedUntil',
  );
  @override
  late final GeneratedColumn<DateTime> snoozedUntil = GeneratedColumn<DateTime>(
    'snoozed_until',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    scheduleId,
    scheduledAt,
    count,
    snoozedUntil,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'snoozes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Snooze> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('schedule_id')) {
      context.handle(
        _scheduleIdMeta,
        scheduleId.isAcceptableOrUnknown(data['schedule_id']!, _scheduleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_scheduleIdMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    if (data.containsKey('snoozed_until')) {
      context.handle(
        _snoozedUntilMeta,
        snoozedUntil.isAcceptableOrUnknown(
          data['snoozed_until']!,
          _snoozedUntilMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snoozedUntilMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Snooze map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Snooze(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      scheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}schedule_id'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
      snoozedUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snoozed_until'],
      )!,
    );
  }

  @override
  $SnoozesTable createAlias(String alias) {
    return $SnoozesTable(attachedDatabase, alias);
  }
}

class Snooze extends DataClass implements Insertable<Snooze> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final String scheduleId;
  final DateTime scheduledAt;
  final int count;
  final DateTime snoozedUntil;
  const Snooze({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.scheduleId,
    required this.scheduledAt,
    required this.count,
    required this.snoozedUntil,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['schedule_id'] = Variable<String>(scheduleId);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['count'] = Variable<int>(count);
    map['snoozed_until'] = Variable<DateTime>(snoozedUntil);
    return map;
  }

  SnoozesCompanion toCompanion(bool nullToAbsent) {
    return SnoozesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      scheduleId: Value(scheduleId),
      scheduledAt: Value(scheduledAt),
      count: Value(count),
      snoozedUntil: Value(snoozedUntil),
    );
  }

  factory Snooze.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Snooze(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      scheduleId: serializer.fromJson<String>(json['scheduleId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      count: serializer.fromJson<int>(json['count']),
      snoozedUntil: serializer.fromJson<DateTime>(json['snoozedUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'scheduleId': serializer.toJson<String>(scheduleId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'count': serializer.toJson<int>(count),
      'snoozedUntil': serializer.toJson<DateTime>(snoozedUntil),
    };
  }

  Snooze copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? scheduleId,
    DateTime? scheduledAt,
    int? count,
    DateTime? snoozedUntil,
  }) => Snooze(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    scheduleId: scheduleId ?? this.scheduleId,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    count: count ?? this.count,
    snoozedUntil: snoozedUntil ?? this.snoozedUntil,
  );
  Snooze copyWithCompanion(SnoozesCompanion data) {
    return Snooze(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      scheduleId: data.scheduleId.present
          ? data.scheduleId.value
          : this.scheduleId,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      count: data.count.present ? data.count.value : this.count,
      snoozedUntil: data.snoozedUntil.present
          ? data.snoozedUntil.value
          : this.snoozedUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Snooze(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('count: $count, ')
          ..write('snoozedUntil: $snoozedUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    scheduleId,
    scheduledAt,
    count,
    snoozedUntil,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Snooze &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.scheduleId == this.scheduleId &&
          other.scheduledAt == this.scheduledAt &&
          other.count == this.count &&
          other.snoozedUntil == this.snoozedUntil);
}

class SnoozesCompanion extends UpdateCompanion<Snooze> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> scheduleId;
  final Value<DateTime> scheduledAt;
  final Value<int> count;
  final Value<DateTime> snoozedUntil;
  final Value<int> rowid;
  const SnoozesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.scheduleId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.count = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SnoozesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String scheduleId,
    required DateTime scheduledAt,
    this.count = const Value.absent(),
    required DateTime snoozedUntil,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       scheduleId = Value(scheduleId),
       scheduledAt = Value(scheduledAt),
       snoozedUntil = Value(snoozedUntil);
  static Insertable<Snooze> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? scheduleId,
    Expression<DateTime>? scheduledAt,
    Expression<int>? count,
    Expression<DateTime>? snoozedUntil,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (scheduleId != null) 'schedule_id': scheduleId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (count != null) 'count': count,
      if (snoozedUntil != null) 'snoozed_until': snoozedUntil,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SnoozesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? scheduleId,
    Value<DateTime>? scheduledAt,
    Value<int>? count,
    Value<DateTime>? snoozedUntil,
    Value<int>? rowid,
  }) {
    return SnoozesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      scheduleId: scheduleId ?? this.scheduleId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      count: count ?? this.count,
      snoozedUntil: snoozedUntil ?? this.snoozedUntil,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (scheduleId.present) {
      map['schedule_id'] = Variable<String>(scheduleId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (snoozedUntil.present) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SnoozesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('count: $count, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VitalsTable extends Vitals with TableInfo<$VitalsTable, Vital> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VitalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<VitalType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<VitalType>($VitalsTable.$convertertype);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _value2Meta = const VerificationMeta('value2');
  @override
  late final GeneratedColumn<double> value2 = GeneratedColumn<double>(
    'value2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<VitalSource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<VitalSource>($VitalsTable.$convertersource);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    type,
    value,
    value2,
    unit,
    recordedAt,
    source,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vitals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vital> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('value2')) {
      context.handle(
        _value2Meta,
        value2.isAcceptableOrUnknown(data['value2']!, _value2Meta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vital map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vital(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      type: $VitalsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      value2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value2'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      source: $VitalsTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $VitalsTable createAlias(String alias) {
    return $VitalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<VitalType, String, String> $convertertype =
      const EnumNameConverter<VitalType>(VitalType.values);
  static JsonTypeConverter2<VitalSource, String, String> $convertersource =
      const EnumNameConverter<VitalSource>(VitalSource.values);
}

class Vital extends DataClass implements Insertable<Vital> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final VitalType type;
  final double value;

  /// Diastolic for blood pressure.
  final double? value2;
  final String unit;
  final DateTime recordedAt;
  final VitalSource source;
  final String? note;
  const Vital({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.type,
    required this.value,
    this.value2,
    required this.unit,
    required this.recordedAt,
    required this.source,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    {
      map['type'] = Variable<String>($VitalsTable.$convertertype.toSql(type));
    }
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || value2 != null) {
      map['value2'] = Variable<double>(value2);
    }
    map['unit'] = Variable<String>(unit);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    {
      map['source'] = Variable<String>(
        $VitalsTable.$convertersource.toSql(source),
      );
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  VitalsCompanion toCompanion(bool nullToAbsent) {
    return VitalsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      type: Value(type),
      value: Value(value),
      value2: value2 == null && nullToAbsent
          ? const Value.absent()
          : Value(value2),
      unit: Value(unit),
      recordedAt: Value(recordedAt),
      source: Value(source),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Vital.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vital(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      type: $VitalsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      value: serializer.fromJson<double>(json['value']),
      value2: serializer.fromJson<double?>(json['value2']),
      unit: serializer.fromJson<String>(json['unit']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      source: $VitalsTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'type': serializer.toJson<String>(
        $VitalsTable.$convertertype.toJson(type),
      ),
      'value': serializer.toJson<double>(value),
      'value2': serializer.toJson<double?>(value2),
      'unit': serializer.toJson<String>(unit),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'source': serializer.toJson<String>(
        $VitalsTable.$convertersource.toJson(source),
      ),
      'note': serializer.toJson<String?>(note),
    };
  }

  Vital copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    VitalType? type,
    double? value,
    Value<double?> value2 = const Value.absent(),
    String? unit,
    DateTime? recordedAt,
    VitalSource? source,
    Value<String?> note = const Value.absent(),
  }) => Vital(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    type: type ?? this.type,
    value: value ?? this.value,
    value2: value2.present ? value2.value : this.value2,
    unit: unit ?? this.unit,
    recordedAt: recordedAt ?? this.recordedAt,
    source: source ?? this.source,
    note: note.present ? note.value : this.note,
  );
  Vital copyWithCompanion(VitalsCompanion data) {
    return Vital(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      type: data.type.present ? data.type.value : this.type,
      value: data.value.present ? data.value.value : this.value,
      value2: data.value2.present ? data.value2.value : this.value2,
      unit: data.unit.present ? data.unit.value : this.unit,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      source: data.source.present ? data.source.value : this.source,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vital(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('value2: $value2, ')
          ..write('unit: $unit, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('source: $source, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    type,
    value,
    value2,
    unit,
    recordedAt,
    source,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vital &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.type == this.type &&
          other.value == this.value &&
          other.value2 == this.value2 &&
          other.unit == this.unit &&
          other.recordedAt == this.recordedAt &&
          other.source == this.source &&
          other.note == this.note);
}

class VitalsCompanion extends UpdateCompanion<Vital> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<VitalType> type;
  final Value<double> value;
  final Value<double?> value2;
  final Value<String> unit;
  final Value<DateTime> recordedAt;
  final Value<VitalSource> source;
  final Value<String?> note;
  final Value<int> rowid;
  const VitalsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
    this.value2 = const Value.absent(),
    this.unit = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.source = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VitalsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required VitalType type,
    required double value,
    this.value2 = const Value.absent(),
    required String unit,
    required DateTime recordedAt,
    required VitalSource source,
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       value = Value(value),
       unit = Value(unit),
       recordedAt = Value(recordedAt),
       source = Value(source);
  static Insertable<Vital> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? type,
    Expression<double>? value,
    Expression<double>? value2,
    Expression<String>? unit,
    Expression<DateTime>? recordedAt,
    Expression<String>? source,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
      if (value2 != null) 'value2': value2,
      if (unit != null) 'unit': unit,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (source != null) 'source': source,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VitalsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<VitalType>? type,
    Value<double>? value,
    Value<double?>? value2,
    Value<String>? unit,
    Value<DateTime>? recordedAt,
    Value<VitalSource>? source,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return VitalsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      type: type ?? this.type,
      value: value ?? this.value,
      value2: value2 ?? this.value2,
      unit: unit ?? this.unit,
      recordedAt: recordedAt ?? this.recordedAt,
      source: source ?? this.source,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $VitalsTable.$convertertype.toSql(type.value),
      );
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (value2.present) {
      map['value2'] = Variable<double>(value2.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $VitalsTable.$convertersource.toSql(source.value),
      );
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VitalsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('value2: $value2, ')
          ..write('unit: $unit, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('source: $source, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SymptomLogsTable extends SymptomLogs
    with TableInfo<$SymptomLogsTable, SymptomLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymptomLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id)',
    ),
  );
  static const VerificationMeta _symptomMeta = const VerificationMeta(
    'symptom',
  );
  @override
  late final GeneratedColumn<String> symptom = GeneratedColumn<String>(
    'symptom',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<int> severity = GeneratedColumn<int>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resolvedMeta = const VerificationMeta(
    'resolved',
  );
  @override
  late final GeneratedColumn<bool> resolved = GeneratedColumn<bool>(
    'resolved',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("resolved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    medicationId,
    symptom,
    severity,
    recordedAt,
    note,
    resolved,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symptom_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SymptomLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    }
    if (data.containsKey('symptom')) {
      context.handle(
        _symptomMeta,
        symptom.isAcceptableOrUnknown(data['symptom']!, _symptomMeta),
      );
    } else if (isInserting) {
      context.missing(_symptomMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('resolved')) {
      context.handle(
        _resolvedMeta,
        resolved.isAcceptableOrUnknown(data['resolved']!, _resolvedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SymptomLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymptomLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      ),
      symptom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symptom'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}severity'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      resolved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}resolved'],
      )!,
    );
  }

  @override
  $SymptomLogsTable createAlias(String alias) {
    return $SymptomLogsTable(attachedDatabase, alias);
  }
}

class SymptomLog extends DataClass implements Insertable<SymptomLog> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Soft delete so deletions can be pushed to the server.
  final DateTime? deletedAt;
  final String? medicationId;
  final String symptom;

  /// 1 mild – 3 severe.
  final int severity;
  final DateTime recordedAt;
  final String? note;
  final bool resolved;
  const SymptomLog({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.medicationId,
    required this.symptom,
    required this.severity,
    required this.recordedAt,
    this.note,
    required this.resolved,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || medicationId != null) {
      map['medication_id'] = Variable<String>(medicationId);
    }
    map['symptom'] = Variable<String>(symptom);
    map['severity'] = Variable<int>(severity);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['resolved'] = Variable<bool>(resolved);
    return map;
  }

  SymptomLogsCompanion toCompanion(bool nullToAbsent) {
    return SymptomLogsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      medicationId: medicationId == null && nullToAbsent
          ? const Value.absent()
          : Value(medicationId),
      symptom: Value(symptom),
      severity: Value(severity),
      recordedAt: Value(recordedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      resolved: Value(resolved),
    );
  }

  factory SymptomLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymptomLog(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      medicationId: serializer.fromJson<String?>(json['medicationId']),
      symptom: serializer.fromJson<String>(json['symptom']),
      severity: serializer.fromJson<int>(json['severity']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      note: serializer.fromJson<String?>(json['note']),
      resolved: serializer.fromJson<bool>(json['resolved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'medicationId': serializer.toJson<String?>(medicationId),
      'symptom': serializer.toJson<String>(symptom),
      'severity': serializer.toJson<int>(severity),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'note': serializer.toJson<String?>(note),
      'resolved': serializer.toJson<bool>(resolved),
    };
  }

  SymptomLog copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> medicationId = const Value.absent(),
    String? symptom,
    int? severity,
    DateTime? recordedAt,
    Value<String?> note = const Value.absent(),
    bool? resolved,
  }) => SymptomLog(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    medicationId: medicationId.present ? medicationId.value : this.medicationId,
    symptom: symptom ?? this.symptom,
    severity: severity ?? this.severity,
    recordedAt: recordedAt ?? this.recordedAt,
    note: note.present ? note.value : this.note,
    resolved: resolved ?? this.resolved,
  );
  SymptomLog copyWithCompanion(SymptomLogsCompanion data) {
    return SymptomLog(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      symptom: data.symptom.present ? data.symptom.value : this.symptom,
      severity: data.severity.present ? data.severity.value : this.severity,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      note: data.note.present ? data.note.value : this.note,
      resolved: data.resolved.present ? data.resolved.value : this.resolved,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymptomLog(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('medicationId: $medicationId, ')
          ..write('symptom: $symptom, ')
          ..write('severity: $severity, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('note: $note, ')
          ..write('resolved: $resolved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    medicationId,
    symptom,
    severity,
    recordedAt,
    note,
    resolved,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymptomLog &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.medicationId == this.medicationId &&
          other.symptom == this.symptom &&
          other.severity == this.severity &&
          other.recordedAt == this.recordedAt &&
          other.note == this.note &&
          other.resolved == this.resolved);
}

class SymptomLogsCompanion extends UpdateCompanion<SymptomLog> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> medicationId;
  final Value<String> symptom;
  final Value<int> severity;
  final Value<DateTime> recordedAt;
  final Value<String?> note;
  final Value<bool> resolved;
  final Value<int> rowid;
  const SymptomLogsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.symptom = const Value.absent(),
    this.severity = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.note = const Value.absent(),
    this.resolved = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SymptomLogsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.medicationId = const Value.absent(),
    required String symptom,
    this.severity = const Value.absent(),
    required DateTime recordedAt,
    this.note = const Value.absent(),
    this.resolved = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       symptom = Value(symptom),
       recordedAt = Value(recordedAt);
  static Insertable<SymptomLog> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? medicationId,
    Expression<String>? symptom,
    Expression<int>? severity,
    Expression<DateTime>? recordedAt,
    Expression<String>? note,
    Expression<bool>? resolved,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (medicationId != null) 'medication_id': medicationId,
      if (symptom != null) 'symptom': symptom,
      if (severity != null) 'severity': severity,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (note != null) 'note': note,
      if (resolved != null) 'resolved': resolved,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SymptomLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? medicationId,
    Value<String>? symptom,
    Value<int>? severity,
    Value<DateTime>? recordedAt,
    Value<String?>? note,
    Value<bool>? resolved,
    Value<int>? rowid,
  }) {
    return SymptomLogsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      medicationId: medicationId ?? this.medicationId,
      symptom: symptom ?? this.symptom,
      severity: severity ?? this.severity,
      recordedAt: recordedAt ?? this.recordedAt,
      note: note ?? this.note,
      resolved: resolved ?? this.resolved,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (symptom.present) {
      map['symptom'] = Variable<String>(symptom.value);
    }
    if (severity.present) {
      map['severity'] = Variable<int>(severity.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (resolved.present) {
      map['resolved'] = Variable<bool>(resolved.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymptomLogsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('medicationId: $medicationId, ')
          ..write('symptom: $symptom, ')
          ..write('severity: $severity, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('note: $note, ')
          ..write('resolved: $resolved, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOutboxTable extends SyncOutbox
    with TableInfo<$SyncOutboxTable, SyncOutboxData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOutboxTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seqMeta = const VerificationMeta('seq');
  @override
  late final GeneratedColumn<int> seq = GeneratedColumn<int>(
    'seq',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTableMeta = const VerificationMeta(
    'entityTable',
  );
  @override
  late final GeneratedColumn<String> entityTable = GeneratedColumn<String>(
    'entity_table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncOp, String> op =
      GeneratedColumn<String>(
        'op',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SyncOp>($SyncOutboxTable.$converterop);
  static const VerificationMeta _queuedAtMeta = const VerificationMeta(
    'queuedAt',
  );
  @override
  late final GeneratedColumn<DateTime> queuedAt = GeneratedColumn<DateTime>(
    'queued_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    seq,
    entityTable,
    entityId,
    op,
    queuedAt,
    attempts,
    lastError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncOutboxData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('seq')) {
      context.handle(
        _seqMeta,
        seq.isAcceptableOrUnknown(data['seq']!, _seqMeta),
      );
    }
    if (data.containsKey('entity_table')) {
      context.handle(
        _entityTableMeta,
        entityTable.isAcceptableOrUnknown(
          data['entity_table']!,
          _entityTableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_entityTableMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('queued_at')) {
      context.handle(
        _queuedAtMeta,
        queuedAt.isAcceptableOrUnknown(data['queued_at']!, _queuedAtMeta),
      );
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seq};
  @override
  SyncOutboxData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOutboxData(
      seq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seq'],
      )!,
      entityTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_table'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      op: $SyncOutboxTable.$converterop.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}op'],
        )!,
      ),
      queuedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}queued_at'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
    );
  }

  @override
  $SyncOutboxTable createAlias(String alias) {
    return $SyncOutboxTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncOp, String, String> $converterop =
      const EnumNameConverter<SyncOp>(SyncOp.values);
}

class SyncOutboxData extends DataClass implements Insertable<SyncOutboxData> {
  final int seq;
  final String entityTable;
  final String entityId;
  final SyncOp op;
  final DateTime queuedAt;
  final int attempts;
  final String? lastError;
  const SyncOutboxData({
    required this.seq,
    required this.entityTable,
    required this.entityId,
    required this.op,
    required this.queuedAt,
    required this.attempts,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['seq'] = Variable<int>(seq);
    map['entity_table'] = Variable<String>(entityTable);
    map['entity_id'] = Variable<String>(entityId);
    {
      map['op'] = Variable<String>($SyncOutboxTable.$converterop.toSql(op));
    }
    map['queued_at'] = Variable<DateTime>(queuedAt);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  SyncOutboxCompanion toCompanion(bool nullToAbsent) {
    return SyncOutboxCompanion(
      seq: Value(seq),
      entityTable: Value(entityTable),
      entityId: Value(entityId),
      op: Value(op),
      queuedAt: Value(queuedAt),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory SyncOutboxData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOutboxData(
      seq: serializer.fromJson<int>(json['seq']),
      entityTable: serializer.fromJson<String>(json['entityTable']),
      entityId: serializer.fromJson<String>(json['entityId']),
      op: $SyncOutboxTable.$converterop.fromJson(
        serializer.fromJson<String>(json['op']),
      ),
      queuedAt: serializer.fromJson<DateTime>(json['queuedAt']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seq': serializer.toJson<int>(seq),
      'entityTable': serializer.toJson<String>(entityTable),
      'entityId': serializer.toJson<String>(entityId),
      'op': serializer.toJson<String>($SyncOutboxTable.$converterop.toJson(op)),
      'queuedAt': serializer.toJson<DateTime>(queuedAt),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  SyncOutboxData copyWith({
    int? seq,
    String? entityTable,
    String? entityId,
    SyncOp? op,
    DateTime? queuedAt,
    int? attempts,
    Value<String?> lastError = const Value.absent(),
  }) => SyncOutboxData(
    seq: seq ?? this.seq,
    entityTable: entityTable ?? this.entityTable,
    entityId: entityId ?? this.entityId,
    op: op ?? this.op,
    queuedAt: queuedAt ?? this.queuedAt,
    attempts: attempts ?? this.attempts,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  SyncOutboxData copyWithCompanion(SyncOutboxCompanion data) {
    return SyncOutboxData(
      seq: data.seq.present ? data.seq.value : this.seq,
      entityTable: data.entityTable.present
          ? data.entityTable.value
          : this.entityTable,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      op: data.op.present ? data.op.value : this.op,
      queuedAt: data.queuedAt.present ? data.queuedAt.value : this.queuedAt,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxData(')
          ..write('seq: $seq, ')
          ..write('entityTable: $entityTable, ')
          ..write('entityId: $entityId, ')
          ..write('op: $op, ')
          ..write('queuedAt: $queuedAt, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    seq,
    entityTable,
    entityId,
    op,
    queuedAt,
    attempts,
    lastError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOutboxData &&
          other.seq == this.seq &&
          other.entityTable == this.entityTable &&
          other.entityId == this.entityId &&
          other.op == this.op &&
          other.queuedAt == this.queuedAt &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError);
}

class SyncOutboxCompanion extends UpdateCompanion<SyncOutboxData> {
  final Value<int> seq;
  final Value<String> entityTable;
  final Value<String> entityId;
  final Value<SyncOp> op;
  final Value<DateTime> queuedAt;
  final Value<int> attempts;
  final Value<String?> lastError;
  const SyncOutboxCompanion({
    this.seq = const Value.absent(),
    this.entityTable = const Value.absent(),
    this.entityId = const Value.absent(),
    this.op = const Value.absent(),
    this.queuedAt = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  SyncOutboxCompanion.insert({
    this.seq = const Value.absent(),
    required String entityTable,
    required String entityId,
    required SyncOp op,
    this.queuedAt = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
  }) : entityTable = Value(entityTable),
       entityId = Value(entityId),
       op = Value(op);
  static Insertable<SyncOutboxData> custom({
    Expression<int>? seq,
    Expression<String>? entityTable,
    Expression<String>? entityId,
    Expression<String>? op,
    Expression<DateTime>? queuedAt,
    Expression<int>? attempts,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (seq != null) 'seq': seq,
      if (entityTable != null) 'entity_table': entityTable,
      if (entityId != null) 'entity_id': entityId,
      if (op != null) 'op': op,
      if (queuedAt != null) 'queued_at': queuedAt,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
    });
  }

  SyncOutboxCompanion copyWith({
    Value<int>? seq,
    Value<String>? entityTable,
    Value<String>? entityId,
    Value<SyncOp>? op,
    Value<DateTime>? queuedAt,
    Value<int>? attempts,
    Value<String?>? lastError,
  }) {
    return SyncOutboxCompanion(
      seq: seq ?? this.seq,
      entityTable: entityTable ?? this.entityTable,
      entityId: entityId ?? this.entityId,
      op: op ?? this.op,
      queuedAt: queuedAt ?? this.queuedAt,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seq.present) {
      map['seq'] = Variable<int>(seq.value);
    }
    if (entityTable.present) {
      map['entity_table'] = Variable<String>(entityTable.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (op.present) {
      map['op'] = Variable<String>(
        $SyncOutboxTable.$converterop.toSql(op.value),
      );
    }
    if (queuedAt.present) {
      map['queued_at'] = Variable<DateTime>(queuedAt.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxCompanion(')
          ..write('seq: $seq, ')
          ..write('entityTable: $entityTable, ')
          ..write('entityId: $entityId, ')
          ..write('op: $op, ')
          ..write('queuedAt: $queuedAt, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $ConditionsTable conditions = $ConditionsTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $DoseSchedulesTable doseSchedules = $DoseSchedulesTable(this);
  late final $DoseLogsTable doseLogs = $DoseLogsTable(this);
  late final $SnoozesTable snoozes = $SnoozesTable(this);
  late final $VitalsTable vitals = $VitalsTable(this);
  late final $SymptomLogsTable symptomLogs = $SymptomLogsTable(this);
  late final $SyncOutboxTable syncOutbox = $SyncOutboxTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    conditions,
    medications,
    doseSchedules,
    doseLogs,
    snoozes,
    vitals,
    symptomLogs,
    syncOutbox,
  ];
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String fullName,
      Value<String?> title,
      Value<DateTime?> dateOfBirth,
      Value<String?> sex,
      Value<String?> bloodGroup,
      Value<String?> genotype,
      Value<String?> allergies,
      Value<String?> avatarPath,
      Value<String?> caregiverName,
      Value<String?> caregiverRelation,
      Value<String?> caregiverPhone,
      Value<bool> caregiverAlertsEnabled,
      Value<int> caregiverDelayMinutes,
      Value<int> rowid,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> fullName,
      Value<String?> title,
      Value<DateTime?> dateOfBirth,
      Value<String?> sex,
      Value<String?> bloodGroup,
      Value<String?> genotype,
      Value<String?> allergies,
      Value<String?> avatarPath,
      Value<String?> caregiverName,
      Value<String?> caregiverRelation,
      Value<String?> caregiverPhone,
      Value<bool> caregiverAlertsEnabled,
      Value<int> caregiverDelayMinutes,
      Value<int> rowid,
    });

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bloodGroup => $composableBuilder(
    column: $table.bloodGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genotype => $composableBuilder(
    column: $table.genotype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caregiverName => $composableBuilder(
    column: $table.caregiverName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caregiverRelation => $composableBuilder(
    column: $table.caregiverRelation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caregiverPhone => $composableBuilder(
    column: $table.caregiverPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get caregiverAlertsEnabled => $composableBuilder(
    column: $table.caregiverAlertsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caregiverDelayMinutes => $composableBuilder(
    column: $table.caregiverDelayMinutes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bloodGroup => $composableBuilder(
    column: $table.bloodGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genotype => $composableBuilder(
    column: $table.genotype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caregiverName => $composableBuilder(
    column: $table.caregiverName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caregiverRelation => $composableBuilder(
    column: $table.caregiverRelation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caregiverPhone => $composableBuilder(
    column: $table.caregiverPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get caregiverAlertsEnabled => $composableBuilder(
    column: $table.caregiverAlertsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caregiverDelayMinutes => $composableBuilder(
    column: $table.caregiverDelayMinutes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get bloodGroup => $composableBuilder(
    column: $table.bloodGroup,
    builder: (column) => column,
  );

  GeneratedColumn<String> get genotype =>
      $composableBuilder(column: $table.genotype, builder: (column) => column);

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get caregiverName => $composableBuilder(
    column: $table.caregiverName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get caregiverRelation => $composableBuilder(
    column: $table.caregiverRelation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get caregiverPhone => $composableBuilder(
    column: $table.caregiverPhone,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get caregiverAlertsEnabled => $composableBuilder(
    column: $table.caregiverAlertsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get caregiverDelayMinutes => $composableBuilder(
    column: $table.caregiverDelayMinutes,
    builder: (column) => column,
  );
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String?> bloodGroup = const Value.absent(),
                Value<String?> genotype = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<String?> caregiverName = const Value.absent(),
                Value<String?> caregiverRelation = const Value.absent(),
                Value<String?> caregiverPhone = const Value.absent(),
                Value<bool> caregiverAlertsEnabled = const Value.absent(),
                Value<int> caregiverDelayMinutes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                fullName: fullName,
                title: title,
                dateOfBirth: dateOfBirth,
                sex: sex,
                bloodGroup: bloodGroup,
                genotype: genotype,
                allergies: allergies,
                avatarPath: avatarPath,
                caregiverName: caregiverName,
                caregiverRelation: caregiverRelation,
                caregiverPhone: caregiverPhone,
                caregiverAlertsEnabled: caregiverAlertsEnabled,
                caregiverDelayMinutes: caregiverDelayMinutes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String fullName,
                Value<String?> title = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String?> bloodGroup = const Value.absent(),
                Value<String?> genotype = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<String?> caregiverName = const Value.absent(),
                Value<String?> caregiverRelation = const Value.absent(),
                Value<String?> caregiverPhone = const Value.absent(),
                Value<bool> caregiverAlertsEnabled = const Value.absent(),
                Value<int> caregiverDelayMinutes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                fullName: fullName,
                title: title,
                dateOfBirth: dateOfBirth,
                sex: sex,
                bloodGroup: bloodGroup,
                genotype: genotype,
                allergies: allergies,
                avatarPath: avatarPath,
                caregiverName: caregiverName,
                caregiverRelation: caregiverRelation,
                caregiverPhone: caregiverPhone,
                caregiverAlertsEnabled: caregiverAlertsEnabled,
                caregiverDelayMinutes: caregiverDelayMinutes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
      Profile,
      PrefetchHooks Function()
    >;
typedef $$ConditionsTableCreateCompanionBuilder =
    ConditionsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String name,
      Value<DateTime?> diagnosedAt,
      Value<String?> doctorName,
      Value<String?> facility,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ConditionsTableUpdateCompanionBuilder =
    ConditionsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> name,
      Value<DateTime?> diagnosedAt,
      Value<String?> doctorName,
      Value<String?> facility,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$ConditionsTableReferences
    extends BaseReferences<_$AppDatabase, $ConditionsTable, Condition> {
  $$ConditionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MedicationsTable, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: $_aliasNameGenerator(
      db.conditions.id,
      db.medications.conditionId,
    ),
  );

  $$MedicationsTableProcessedTableManager get medicationsRefs {
    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.conditionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConditionsTableFilterComposer
    extends Composer<_$AppDatabase, $ConditionsTable> {
  $$ConditionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get diagnosedAt => $composableBuilder(
    column: $table.diagnosedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get facility => $composableBuilder(
    column: $table.facility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> medicationsRefs(
    Expression<bool> Function($$MedicationsTableFilterComposer f) f,
  ) {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.conditionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConditionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConditionsTable> {
  $$ConditionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get diagnosedAt => $composableBuilder(
    column: $table.diagnosedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get facility => $composableBuilder(
    column: $table.facility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConditionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConditionsTable> {
  $$ConditionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get diagnosedAt => $composableBuilder(
    column: $table.diagnosedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get facility =>
      $composableBuilder(column: $table.facility, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($$MedicationsTableAnnotationComposer a) f,
  ) {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.conditionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConditionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConditionsTable,
          Condition,
          $$ConditionsTableFilterComposer,
          $$ConditionsTableOrderingComposer,
          $$ConditionsTableAnnotationComposer,
          $$ConditionsTableCreateCompanionBuilder,
          $$ConditionsTableUpdateCompanionBuilder,
          (Condition, $$ConditionsTableReferences),
          Condition,
          PrefetchHooks Function({bool medicationsRefs})
        > {
  $$ConditionsTableTableManager(_$AppDatabase db, $ConditionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConditionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConditionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConditionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> diagnosedAt = const Value.absent(),
                Value<String?> doctorName = const Value.absent(),
                Value<String?> facility = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConditionsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                name: name,
                diagnosedAt: diagnosedAt,
                doctorName: doctorName,
                facility: facility,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String name,
                Value<DateTime?> diagnosedAt = const Value.absent(),
                Value<String?> doctorName = const Value.absent(),
                Value<String?> facility = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConditionsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                name: name,
                diagnosedAt: diagnosedAt,
                doctorName: doctorName,
                facility: facility,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConditionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (medicationsRefs) db.medications],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (medicationsRefs)
                    await $_getPrefetchedData<
                      Condition,
                      $ConditionsTable,
                      Medication
                    >(
                      currentTable: table,
                      referencedTable: $$ConditionsTableReferences
                          ._medicationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ConditionsTableReferences(
                            db,
                            table,
                            p0,
                          ).medicationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.conditionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ConditionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConditionsTable,
      Condition,
      $$ConditionsTableFilterComposer,
      $$ConditionsTableOrderingComposer,
      $$ConditionsTableAnnotationComposer,
      $$ConditionsTableCreateCompanionBuilder,
      $$ConditionsTableUpdateCompanionBuilder,
      (Condition, $$ConditionsTableReferences),
      Condition,
      PrefetchHooks Function({bool medicationsRefs})
    >;
typedef $$MedicationsTableCreateCompanionBuilder =
    MedicationsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String name,
      required String strength,
      required DoseForm form,
      Value<String?> drugClass,
      Value<String> route,
      Value<double> doseAmount,
      required Frequency frequency,
      required MealRelation mealRelation,
      Value<String?> instructions,
      Value<String?> pillDescription,
      Value<String?> conditionId,
      Value<String?> prescriberName,
      Value<String?> prescriberSpecialty,
      Value<String?> facility,
      Value<String?> prescriberPhone,
      Value<String?> rxNumber,
      Value<String?> prescriptionImagePath,
      Value<double?> stockCount,
      Value<double> refillThreshold,
      Value<String> sideEffectWatch,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$MedicationsTableUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> name,
      Value<String> strength,
      Value<DoseForm> form,
      Value<String?> drugClass,
      Value<String> route,
      Value<double> doseAmount,
      Value<Frequency> frequency,
      Value<MealRelation> mealRelation,
      Value<String?> instructions,
      Value<String?> pillDescription,
      Value<String?> conditionId,
      Value<String?> prescriberName,
      Value<String?> prescriberSpecialty,
      Value<String?> facility,
      Value<String?> prescriberPhone,
      Value<String?> rxNumber,
      Value<String?> prescriptionImagePath,
      Value<double?> stockCount,
      Value<double> refillThreshold,
      Value<String> sideEffectWatch,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<bool> isActive,
      Value<int> rowid,
    });

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ConditionsTable _conditionIdTable(_$AppDatabase db) =>
      db.conditions.createAlias(
        $_aliasNameGenerator(db.medications.conditionId, db.conditions.id),
      );

  $$ConditionsTableProcessedTableManager? get conditionId {
    final $_column = $_itemColumn<String>('condition_id');
    if ($_column == null) return null;
    final manager = $$ConditionsTableTableManager(
      $_db,
      $_db.conditions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_conditionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DoseSchedulesTable, List<DoseSchedule>>
  _doseSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.doseSchedules,
    aliasName: $_aliasNameGenerator(
      db.medications.id,
      db.doseSchedules.medicationId,
    ),
  );

  $$DoseSchedulesTableProcessedTableManager get doseSchedulesRefs {
    final manager = $$DoseSchedulesTableTableManager(
      $_db,
      $_db.doseSchedules,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_doseSchedulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DoseLogsTable, List<DoseLog>> _doseLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.doseLogs,
    aliasName: $_aliasNameGenerator(
      db.medications.id,
      db.doseLogs.medicationId,
    ),
  );

  $$DoseLogsTableProcessedTableManager get doseLogsRefs {
    final manager = $$DoseLogsTableTableManager(
      $_db,
      $_db.doseLogs,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_doseLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SymptomLogsTable, List<SymptomLog>>
  _symptomLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.symptomLogs,
    aliasName: $_aliasNameGenerator(
      db.medications.id,
      db.symptomLogs.medicationId,
    ),
  );

  $$SymptomLogsTableProcessedTableManager get symptomLogsRefs {
    final manager = $$SymptomLogsTableTableManager(
      $_db,
      $_db.symptomLogs,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_symptomLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DoseForm, DoseForm, String> get form =>
      $composableBuilder(
        column: $table.form,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get drugClass => $composableBuilder(
    column: $table.drugClass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Frequency, Frequency, String> get frequency =>
      $composableBuilder(
        column: $table.frequency,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<MealRelation, MealRelation, String>
  get mealRelation => $composableBuilder(
    column: $table.mealRelation,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pillDescription => $composableBuilder(
    column: $table.pillDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescriberName => $composableBuilder(
    column: $table.prescriberName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescriberSpecialty => $composableBuilder(
    column: $table.prescriberSpecialty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get facility => $composableBuilder(
    column: $table.facility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescriberPhone => $composableBuilder(
    column: $table.prescriberPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rxNumber => $composableBuilder(
    column: $table.rxNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescriptionImagePath => $composableBuilder(
    column: $table.prescriptionImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stockCount => $composableBuilder(
    column: $table.stockCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get refillThreshold => $composableBuilder(
    column: $table.refillThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sideEffectWatch => $composableBuilder(
    column: $table.sideEffectWatch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$ConditionsTableFilterComposer get conditionId {
    final $$ConditionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conditionId,
      referencedTable: $db.conditions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConditionsTableFilterComposer(
            $db: $db,
            $table: $db.conditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> doseSchedulesRefs(
    Expression<bool> Function($$DoseSchedulesTableFilterComposer f) f,
  ) {
    final $$DoseSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> doseLogsRefs(
    Expression<bool> Function($$DoseLogsTableFilterComposer f) f,
  ) {
    final $$DoseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseLogs,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseLogsTableFilterComposer(
            $db: $db,
            $table: $db.doseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> symptomLogsRefs(
    Expression<bool> Function($$SymptomLogsTableFilterComposer f) f,
  ) {
    final $$SymptomLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.symptomLogs,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SymptomLogsTableFilterComposer(
            $db: $db,
            $table: $db.symptomLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get drugClass => $composableBuilder(
    column: $table.drugClass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mealRelation => $composableBuilder(
    column: $table.mealRelation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pillDescription => $composableBuilder(
    column: $table.pillDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescriberName => $composableBuilder(
    column: $table.prescriberName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescriberSpecialty => $composableBuilder(
    column: $table.prescriberSpecialty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get facility => $composableBuilder(
    column: $table.facility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescriberPhone => $composableBuilder(
    column: $table.prescriberPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rxNumber => $composableBuilder(
    column: $table.rxNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescriptionImagePath => $composableBuilder(
    column: $table.prescriptionImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stockCount => $composableBuilder(
    column: $table.stockCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get refillThreshold => $composableBuilder(
    column: $table.refillThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sideEffectWatch => $composableBuilder(
    column: $table.sideEffectWatch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$ConditionsTableOrderingComposer get conditionId {
    final $$ConditionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conditionId,
      referencedTable: $db.conditions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConditionsTableOrderingComposer(
            $db: $db,
            $table: $db.conditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DoseForm, String> get form =>
      $composableBuilder(column: $table.form, builder: (column) => column);

  GeneratedColumn<String> get drugClass =>
      $composableBuilder(column: $table.drugClass, builder: (column) => column);

  GeneratedColumn<String> get route =>
      $composableBuilder(column: $table.route, builder: (column) => column);

  GeneratedColumn<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Frequency, String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MealRelation, String> get mealRelation =>
      $composableBuilder(
        column: $table.mealRelation,
        builder: (column) => column,
      );

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pillDescription => $composableBuilder(
    column: $table.pillDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescriberName => $composableBuilder(
    column: $table.prescriberName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescriberSpecialty => $composableBuilder(
    column: $table.prescriberSpecialty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get facility =>
      $composableBuilder(column: $table.facility, builder: (column) => column);

  GeneratedColumn<String> get prescriberPhone => $composableBuilder(
    column: $table.prescriberPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rxNumber =>
      $composableBuilder(column: $table.rxNumber, builder: (column) => column);

  GeneratedColumn<String> get prescriptionImagePath => $composableBuilder(
    column: $table.prescriptionImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<double> get stockCount => $composableBuilder(
    column: $table.stockCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get refillThreshold => $composableBuilder(
    column: $table.refillThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sideEffectWatch => $composableBuilder(
    column: $table.sideEffectWatch,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$ConditionsTableAnnotationComposer get conditionId {
    final $$ConditionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conditionId,
      referencedTable: $db.conditions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConditionsTableAnnotationComposer(
            $db: $db,
            $table: $db.conditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> doseSchedulesRefs<T extends Object>(
    Expression<T> Function($$DoseSchedulesTableAnnotationComposer a) f,
  ) {
    final $$DoseSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> doseLogsRefs<T extends Object>(
    Expression<T> Function($$DoseLogsTableAnnotationComposer a) f,
  ) {
    final $$DoseLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseLogs,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.doseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> symptomLogsRefs<T extends Object>(
    Expression<T> Function($$SymptomLogsTableAnnotationComposer a) f,
  ) {
    final $$SymptomLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.symptomLogs,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SymptomLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.symptomLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationsTable,
          Medication,
          $$MedicationsTableFilterComposer,
          $$MedicationsTableOrderingComposer,
          $$MedicationsTableAnnotationComposer,
          $$MedicationsTableCreateCompanionBuilder,
          $$MedicationsTableUpdateCompanionBuilder,
          (Medication, $$MedicationsTableReferences),
          Medication,
          PrefetchHooks Function({
            bool conditionId,
            bool doseSchedulesRefs,
            bool doseLogsRefs,
            bool symptomLogsRefs,
          })
        > {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> strength = const Value.absent(),
                Value<DoseForm> form = const Value.absent(),
                Value<String?> drugClass = const Value.absent(),
                Value<String> route = const Value.absent(),
                Value<double> doseAmount = const Value.absent(),
                Value<Frequency> frequency = const Value.absent(),
                Value<MealRelation> mealRelation = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> pillDescription = const Value.absent(),
                Value<String?> conditionId = const Value.absent(),
                Value<String?> prescriberName = const Value.absent(),
                Value<String?> prescriberSpecialty = const Value.absent(),
                Value<String?> facility = const Value.absent(),
                Value<String?> prescriberPhone = const Value.absent(),
                Value<String?> rxNumber = const Value.absent(),
                Value<String?> prescriptionImagePath = const Value.absent(),
                Value<double?> stockCount = const Value.absent(),
                Value<double> refillThreshold = const Value.absent(),
                Value<String> sideEffectWatch = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                name: name,
                strength: strength,
                form: form,
                drugClass: drugClass,
                route: route,
                doseAmount: doseAmount,
                frequency: frequency,
                mealRelation: mealRelation,
                instructions: instructions,
                pillDescription: pillDescription,
                conditionId: conditionId,
                prescriberName: prescriberName,
                prescriberSpecialty: prescriberSpecialty,
                facility: facility,
                prescriberPhone: prescriberPhone,
                rxNumber: rxNumber,
                prescriptionImagePath: prescriptionImagePath,
                stockCount: stockCount,
                refillThreshold: refillThreshold,
                sideEffectWatch: sideEffectWatch,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String name,
                required String strength,
                required DoseForm form,
                Value<String?> drugClass = const Value.absent(),
                Value<String> route = const Value.absent(),
                Value<double> doseAmount = const Value.absent(),
                required Frequency frequency,
                required MealRelation mealRelation,
                Value<String?> instructions = const Value.absent(),
                Value<String?> pillDescription = const Value.absent(),
                Value<String?> conditionId = const Value.absent(),
                Value<String?> prescriberName = const Value.absent(),
                Value<String?> prescriberSpecialty = const Value.absent(),
                Value<String?> facility = const Value.absent(),
                Value<String?> prescriberPhone = const Value.absent(),
                Value<String?> rxNumber = const Value.absent(),
                Value<String?> prescriptionImagePath = const Value.absent(),
                Value<double?> stockCount = const Value.absent(),
                Value<double> refillThreshold = const Value.absent(),
                Value<String> sideEffectWatch = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                name: name,
                strength: strength,
                form: form,
                drugClass: drugClass,
                route: route,
                doseAmount: doseAmount,
                frequency: frequency,
                mealRelation: mealRelation,
                instructions: instructions,
                pillDescription: pillDescription,
                conditionId: conditionId,
                prescriberName: prescriberName,
                prescriberSpecialty: prescriberSpecialty,
                facility: facility,
                prescriberPhone: prescriberPhone,
                rxNumber: rxNumber,
                prescriptionImagePath: prescriptionImagePath,
                stockCount: stockCount,
                refillThreshold: refillThreshold,
                sideEffectWatch: sideEffectWatch,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                conditionId = false,
                doseSchedulesRefs = false,
                doseLogsRefs = false,
                symptomLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (doseSchedulesRefs) db.doseSchedules,
                    if (doseLogsRefs) db.doseLogs,
                    if (symptomLogsRefs) db.symptomLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (conditionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.conditionId,
                                    referencedTable:
                                        $$MedicationsTableReferences
                                            ._conditionIdTable(db),
                                    referencedColumn:
                                        $$MedicationsTableReferences
                                            ._conditionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (doseSchedulesRefs)
                        await $_getPrefetchedData<
                          Medication,
                          $MedicationsTable,
                          DoseSchedule
                        >(
                          currentTable: table,
                          referencedTable: $$MedicationsTableReferences
                              ._doseSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).doseSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (doseLogsRefs)
                        await $_getPrefetchedData<
                          Medication,
                          $MedicationsTable,
                          DoseLog
                        >(
                          currentTable: table,
                          referencedTable: $$MedicationsTableReferences
                              ._doseLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).doseLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (symptomLogsRefs)
                        await $_getPrefetchedData<
                          Medication,
                          $MedicationsTable,
                          SymptomLog
                        >(
                          currentTable: table,
                          referencedTable: $$MedicationsTableReferences
                              ._symptomLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).symptomLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationsTable,
      Medication,
      $$MedicationsTableFilterComposer,
      $$MedicationsTableOrderingComposer,
      $$MedicationsTableAnnotationComposer,
      $$MedicationsTableCreateCompanionBuilder,
      $$MedicationsTableUpdateCompanionBuilder,
      (Medication, $$MedicationsTableReferences),
      Medication,
      PrefetchHooks Function({
        bool conditionId,
        bool doseSchedulesRefs,
        bool doseLogsRefs,
        bool symptomLogsRefs,
      })
    >;
typedef $$DoseSchedulesTableCreateCompanionBuilder =
    DoseSchedulesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String medicationId,
      required int hour,
      required int minute,
      Value<double> doseAmount,
      Value<String> slot,
      Value<int> rowid,
    });
typedef $$DoseSchedulesTableUpdateCompanionBuilder =
    DoseSchedulesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> medicationId,
      Value<int> hour,
      Value<int> minute,
      Value<double> doseAmount,
      Value<String> slot,
      Value<int> rowid,
    });

final class $$DoseSchedulesTableReferences
    extends BaseReferences<_$AppDatabase, $DoseSchedulesTable, DoseSchedule> {
  $$DoseSchedulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
        $_aliasNameGenerator(db.doseSchedules.medicationId, db.medications.id),
      );

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<String>('medication_id')!;

    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DoseLogsTable, List<DoseLog>> _doseLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.doseLogs,
    aliasName: $_aliasNameGenerator(
      db.doseSchedules.id,
      db.doseLogs.scheduleId,
    ),
  );

  $$DoseLogsTableProcessedTableManager get doseLogsRefs {
    final manager = $$DoseLogsTableTableManager(
      $_db,
      $_db.doseLogs,
    ).filter((f) => f.scheduleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_doseLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SnoozesTable, List<Snooze>> _snoozesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.snoozes,
    aliasName: $_aliasNameGenerator(db.doseSchedules.id, db.snoozes.scheduleId),
  );

  $$SnoozesTableProcessedTableManager get snoozesRefs {
    final manager = $$SnoozesTableTableManager(
      $_db,
      $_db.snoozes,
    ).filter((f) => f.scheduleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_snoozesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DoseSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> doseLogsRefs(
    Expression<bool> Function($$DoseLogsTableFilterComposer f) f,
  ) {
    final $$DoseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseLogs,
      getReferencedColumn: (t) => t.scheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseLogsTableFilterComposer(
            $db: $db,
            $table: $db.doseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> snoozesRefs(
    Expression<bool> Function($$SnoozesTableFilterComposer f) f,
  ) {
    final $$SnoozesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snoozes,
      getReferencedColumn: (t) => t.scheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnoozesTableFilterComposer(
            $db: $db,
            $table: $db.snoozes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DoseSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get hour =>
      $composableBuilder(column: $table.hour, builder: (column) => column);

  GeneratedColumn<int> get minute =>
      $composableBuilder(column: $table.minute, builder: (column) => column);

  GeneratedColumn<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> doseLogsRefs<T extends Object>(
    Expression<T> Function($$DoseLogsTableAnnotationComposer a) f,
  ) {
    final $$DoseLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseLogs,
      getReferencedColumn: (t) => t.scheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.doseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> snoozesRefs<T extends Object>(
    Expression<T> Function($$SnoozesTableAnnotationComposer a) f,
  ) {
    final $$SnoozesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snoozes,
      getReferencedColumn: (t) => t.scheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnoozesTableAnnotationComposer(
            $db: $db,
            $table: $db.snoozes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DoseSchedulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoseSchedulesTable,
          DoseSchedule,
          $$DoseSchedulesTableFilterComposer,
          $$DoseSchedulesTableOrderingComposer,
          $$DoseSchedulesTableAnnotationComposer,
          $$DoseSchedulesTableCreateCompanionBuilder,
          $$DoseSchedulesTableUpdateCompanionBuilder,
          (DoseSchedule, $$DoseSchedulesTableReferences),
          DoseSchedule,
          PrefetchHooks Function({
            bool medicationId,
            bool doseLogsRefs,
            bool snoozesRefs,
          })
        > {
  $$DoseSchedulesTableTableManager(_$AppDatabase db, $DoseSchedulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseSchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseSchedulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseSchedulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> medicationId = const Value.absent(),
                Value<int> hour = const Value.absent(),
                Value<int> minute = const Value.absent(),
                Value<double> doseAmount = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseSchedulesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                medicationId: medicationId,
                hour: hour,
                minute: minute,
                doseAmount: doseAmount,
                slot: slot,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String medicationId,
                required int hour,
                required int minute,
                Value<double> doseAmount = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseSchedulesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                medicationId: medicationId,
                hour: hour,
                minute: minute,
                doseAmount: doseAmount,
                slot: slot,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DoseSchedulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                medicationId = false,
                doseLogsRefs = false,
                snoozesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (doseLogsRefs) db.doseLogs,
                    if (snoozesRefs) db.snoozes,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (medicationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.medicationId,
                                    referencedTable:
                                        $$DoseSchedulesTableReferences
                                            ._medicationIdTable(db),
                                    referencedColumn:
                                        $$DoseSchedulesTableReferences
                                            ._medicationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (doseLogsRefs)
                        await $_getPrefetchedData<
                          DoseSchedule,
                          $DoseSchedulesTable,
                          DoseLog
                        >(
                          currentTable: table,
                          referencedTable: $$DoseSchedulesTableReferences
                              ._doseLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DoseSchedulesTableReferences(
                                db,
                                table,
                                p0,
                              ).doseLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.scheduleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (snoozesRefs)
                        await $_getPrefetchedData<
                          DoseSchedule,
                          $DoseSchedulesTable,
                          Snooze
                        >(
                          currentTable: table,
                          referencedTable: $$DoseSchedulesTableReferences
                              ._snoozesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DoseSchedulesTableReferences(
                                db,
                                table,
                                p0,
                              ).snoozesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.scheduleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DoseSchedulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoseSchedulesTable,
      DoseSchedule,
      $$DoseSchedulesTableFilterComposer,
      $$DoseSchedulesTableOrderingComposer,
      $$DoseSchedulesTableAnnotationComposer,
      $$DoseSchedulesTableCreateCompanionBuilder,
      $$DoseSchedulesTableUpdateCompanionBuilder,
      (DoseSchedule, $$DoseSchedulesTableReferences),
      DoseSchedule,
      PrefetchHooks Function({
        bool medicationId,
        bool doseLogsRefs,
        bool snoozesRefs,
      })
    >;
typedef $$DoseLogsTableCreateCompanionBuilder =
    DoseLogsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String medicationId,
      Value<String?> scheduleId,
      required DateTime scheduledAt,
      required DateTime actionAt,
      required DoseStatus status,
      Value<SkipReason?> skipReason,
      Value<double> doseAmount,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$DoseLogsTableUpdateCompanionBuilder =
    DoseLogsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> medicationId,
      Value<String?> scheduleId,
      Value<DateTime> scheduledAt,
      Value<DateTime> actionAt,
      Value<DoseStatus> status,
      Value<SkipReason?> skipReason,
      Value<double> doseAmount,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$DoseLogsTableReferences
    extends BaseReferences<_$AppDatabase, $DoseLogsTable, DoseLog> {
  $$DoseLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
        $_aliasNameGenerator(db.doseLogs.medicationId, db.medications.id),
      );

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<String>('medication_id')!;

    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DoseSchedulesTable _scheduleIdTable(_$AppDatabase db) =>
      db.doseSchedules.createAlias(
        $_aliasNameGenerator(db.doseLogs.scheduleId, db.doseSchedules.id),
      );

  $$DoseSchedulesTableProcessedTableManager? get scheduleId {
    final $_column = $_itemColumn<String>('schedule_id');
    if ($_column == null) return null;
    final manager = $$DoseSchedulesTableTableManager(
      $_db,
      $_db.doseSchedules,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scheduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DoseLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actionAt => $composableBuilder(
    column: $table.actionAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DoseStatus, DoseStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<SkipReason?, SkipReason, String>
  get skipReason => $composableBuilder(
    column: $table.skipReason,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DoseSchedulesTableFilterComposer get scheduleId {
    final $$DoseSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actionAt => $composableBuilder(
    column: $table.actionAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get skipReason => $composableBuilder(
    column: $table.skipReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DoseSchedulesTableOrderingComposer get scheduleId {
    final $$DoseSchedulesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableOrderingComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actionAt =>
      $composableBuilder(column: $table.actionAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DoseStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SkipReason?, String> get skipReason =>
      $composableBuilder(
        column: $table.skipReason,
        builder: (column) => column,
      );

  GeneratedColumn<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DoseSchedulesTableAnnotationComposer get scheduleId {
    final $$DoseSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoseLogsTable,
          DoseLog,
          $$DoseLogsTableFilterComposer,
          $$DoseLogsTableOrderingComposer,
          $$DoseLogsTableAnnotationComposer,
          $$DoseLogsTableCreateCompanionBuilder,
          $$DoseLogsTableUpdateCompanionBuilder,
          (DoseLog, $$DoseLogsTableReferences),
          DoseLog,
          PrefetchHooks Function({bool medicationId, bool scheduleId})
        > {
  $$DoseLogsTableTableManager(_$AppDatabase db, $DoseLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> medicationId = const Value.absent(),
                Value<String?> scheduleId = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<DateTime> actionAt = const Value.absent(),
                Value<DoseStatus> status = const Value.absent(),
                Value<SkipReason?> skipReason = const Value.absent(),
                Value<double> doseAmount = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseLogsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                medicationId: medicationId,
                scheduleId: scheduleId,
                scheduledAt: scheduledAt,
                actionAt: actionAt,
                status: status,
                skipReason: skipReason,
                doseAmount: doseAmount,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String medicationId,
                Value<String?> scheduleId = const Value.absent(),
                required DateTime scheduledAt,
                required DateTime actionAt,
                required DoseStatus status,
                Value<SkipReason?> skipReason = const Value.absent(),
                Value<double> doseAmount = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseLogsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                medicationId: medicationId,
                scheduleId: scheduleId,
                scheduledAt: scheduledAt,
                actionAt: actionAt,
                status: status,
                skipReason: skipReason,
                doseAmount: doseAmount,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DoseLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationId = false, scheduleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $$DoseLogsTableReferences
                                    ._medicationIdTable(db),
                                referencedColumn: $$DoseLogsTableReferences
                                    ._medicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (scheduleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.scheduleId,
                                referencedTable: $$DoseLogsTableReferences
                                    ._scheduleIdTable(db),
                                referencedColumn: $$DoseLogsTableReferences
                                    ._scheduleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DoseLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoseLogsTable,
      DoseLog,
      $$DoseLogsTableFilterComposer,
      $$DoseLogsTableOrderingComposer,
      $$DoseLogsTableAnnotationComposer,
      $$DoseLogsTableCreateCompanionBuilder,
      $$DoseLogsTableUpdateCompanionBuilder,
      (DoseLog, $$DoseLogsTableReferences),
      DoseLog,
      PrefetchHooks Function({bool medicationId, bool scheduleId})
    >;
typedef $$SnoozesTableCreateCompanionBuilder =
    SnoozesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String scheduleId,
      required DateTime scheduledAt,
      Value<int> count,
      required DateTime snoozedUntil,
      Value<int> rowid,
    });
typedef $$SnoozesTableUpdateCompanionBuilder =
    SnoozesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> scheduleId,
      Value<DateTime> scheduledAt,
      Value<int> count,
      Value<DateTime> snoozedUntil,
      Value<int> rowid,
    });

final class $$SnoozesTableReferences
    extends BaseReferences<_$AppDatabase, $SnoozesTable, Snooze> {
  $$SnoozesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DoseSchedulesTable _scheduleIdTable(_$AppDatabase db) =>
      db.doseSchedules.createAlias(
        $_aliasNameGenerator(db.snoozes.scheduleId, db.doseSchedules.id),
      );

  $$DoseSchedulesTableProcessedTableManager get scheduleId {
    final $_column = $_itemColumn<String>('schedule_id')!;

    final manager = $$DoseSchedulesTableTableManager(
      $_db,
      $_db.doseSchedules,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scheduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SnoozesTableFilterComposer
    extends Composer<_$AppDatabase, $SnoozesTable> {
  $$SnoozesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnFilters(column),
  );

  $$DoseSchedulesTableFilterComposer get scheduleId {
    final $$DoseSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnoozesTableOrderingComposer
    extends Composer<_$AppDatabase, $SnoozesTable> {
  $$SnoozesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnOrderings(column),
  );

  $$DoseSchedulesTableOrderingComposer get scheduleId {
    final $$DoseSchedulesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableOrderingComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnoozesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SnoozesTable> {
  $$SnoozesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => column,
  );

  $$DoseSchedulesTableAnnotationComposer get scheduleId {
    final $$DoseSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.doseSchedules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.doseSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnoozesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SnoozesTable,
          Snooze,
          $$SnoozesTableFilterComposer,
          $$SnoozesTableOrderingComposer,
          $$SnoozesTableAnnotationComposer,
          $$SnoozesTableCreateCompanionBuilder,
          $$SnoozesTableUpdateCompanionBuilder,
          (Snooze, $$SnoozesTableReferences),
          Snooze,
          PrefetchHooks Function({bool scheduleId})
        > {
  $$SnoozesTableTableManager(_$AppDatabase db, $SnoozesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SnoozesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SnoozesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SnoozesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> scheduleId = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<DateTime> snoozedUntil = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SnoozesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                scheduleId: scheduleId,
                scheduledAt: scheduledAt,
                count: count,
                snoozedUntil: snoozedUntil,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String scheduleId,
                required DateTime scheduledAt,
                Value<int> count = const Value.absent(),
                required DateTime snoozedUntil,
                Value<int> rowid = const Value.absent(),
              }) => SnoozesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                scheduleId: scheduleId,
                scheduledAt: scheduledAt,
                count: count,
                snoozedUntil: snoozedUntil,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SnoozesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({scheduleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (scheduleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.scheduleId,
                                referencedTable: $$SnoozesTableReferences
                                    ._scheduleIdTable(db),
                                referencedColumn: $$SnoozesTableReferences
                                    ._scheduleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SnoozesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SnoozesTable,
      Snooze,
      $$SnoozesTableFilterComposer,
      $$SnoozesTableOrderingComposer,
      $$SnoozesTableAnnotationComposer,
      $$SnoozesTableCreateCompanionBuilder,
      $$SnoozesTableUpdateCompanionBuilder,
      (Snooze, $$SnoozesTableReferences),
      Snooze,
      PrefetchHooks Function({bool scheduleId})
    >;
typedef $$VitalsTableCreateCompanionBuilder =
    VitalsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required VitalType type,
      required double value,
      Value<double?> value2,
      required String unit,
      required DateTime recordedAt,
      required VitalSource source,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$VitalsTableUpdateCompanionBuilder =
    VitalsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<VitalType> type,
      Value<double> value,
      Value<double?> value2,
      Value<String> unit,
      Value<DateTime> recordedAt,
      Value<VitalSource> source,
      Value<String?> note,
      Value<int> rowid,
    });

class $$VitalsTableFilterComposer
    extends Composer<_$AppDatabase, $VitalsTable> {
  $$VitalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<VitalType, VitalType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value2 => $composableBuilder(
    column: $table.value2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<VitalSource, VitalSource, String> get source =>
      $composableBuilder(
        column: $table.source,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VitalsTableOrderingComposer
    extends Composer<_$AppDatabase, $VitalsTable> {
  $$VitalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value2 => $composableBuilder(
    column: $table.value2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VitalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VitalsTable> {
  $$VitalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<VitalType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<double> get value2 =>
      $composableBuilder(column: $table.value2, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<VitalSource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$VitalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VitalsTable,
          Vital,
          $$VitalsTableFilterComposer,
          $$VitalsTableOrderingComposer,
          $$VitalsTableAnnotationComposer,
          $$VitalsTableCreateCompanionBuilder,
          $$VitalsTableUpdateCompanionBuilder,
          (Vital, BaseReferences<_$AppDatabase, $VitalsTable, Vital>),
          Vital,
          PrefetchHooks Function()
        > {
  $$VitalsTableTableManager(_$AppDatabase db, $VitalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VitalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VitalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VitalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<VitalType> type = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<double?> value2 = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<VitalSource> source = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VitalsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                type: type,
                value: value,
                value2: value2,
                unit: unit,
                recordedAt: recordedAt,
                source: source,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required VitalType type,
                required double value,
                Value<double?> value2 = const Value.absent(),
                required String unit,
                required DateTime recordedAt,
                required VitalSource source,
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VitalsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                type: type,
                value: value,
                value2: value2,
                unit: unit,
                recordedAt: recordedAt,
                source: source,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VitalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VitalsTable,
      Vital,
      $$VitalsTableFilterComposer,
      $$VitalsTableOrderingComposer,
      $$VitalsTableAnnotationComposer,
      $$VitalsTableCreateCompanionBuilder,
      $$VitalsTableUpdateCompanionBuilder,
      (Vital, BaseReferences<_$AppDatabase, $VitalsTable, Vital>),
      Vital,
      PrefetchHooks Function()
    >;
typedef $$SymptomLogsTableCreateCompanionBuilder =
    SymptomLogsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> medicationId,
      required String symptom,
      Value<int> severity,
      required DateTime recordedAt,
      Value<String?> note,
      Value<bool> resolved,
      Value<int> rowid,
    });
typedef $$SymptomLogsTableUpdateCompanionBuilder =
    SymptomLogsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> medicationId,
      Value<String> symptom,
      Value<int> severity,
      Value<DateTime> recordedAt,
      Value<String?> note,
      Value<bool> resolved,
      Value<int> rowid,
    });

final class $$SymptomLogsTableReferences
    extends BaseReferences<_$AppDatabase, $SymptomLogsTable, SymptomLog> {
  $$SymptomLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
        $_aliasNameGenerator(db.symptomLogs.medicationId, db.medications.id),
      );

  $$MedicationsTableProcessedTableManager? get medicationId {
    final $_column = $_itemColumn<String>('medication_id');
    if ($_column == null) return null;
    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SymptomLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SymptomLogsTable> {
  $$SymptomLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symptom => $composableBuilder(
    column: $table.symptom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get resolved => $composableBuilder(
    column: $table.resolved,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SymptomLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SymptomLogsTable> {
  $$SymptomLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symptom => $composableBuilder(
    column: $table.symptom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get resolved => $composableBuilder(
    column: $table.resolved,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SymptomLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SymptomLogsTable> {
  $$SymptomLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get symptom =>
      $composableBuilder(column: $table.symptom, builder: (column) => column);

  GeneratedColumn<int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<bool> get resolved =>
      $composableBuilder(column: $table.resolved, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SymptomLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SymptomLogsTable,
          SymptomLog,
          $$SymptomLogsTableFilterComposer,
          $$SymptomLogsTableOrderingComposer,
          $$SymptomLogsTableAnnotationComposer,
          $$SymptomLogsTableCreateCompanionBuilder,
          $$SymptomLogsTableUpdateCompanionBuilder,
          (SymptomLog, $$SymptomLogsTableReferences),
          SymptomLog,
          PrefetchHooks Function({bool medicationId})
        > {
  $$SymptomLogsTableTableManager(_$AppDatabase db, $SymptomLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SymptomLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SymptomLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SymptomLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> medicationId = const Value.absent(),
                Value<String> symptom = const Value.absent(),
                Value<int> severity = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<bool> resolved = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SymptomLogsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                medicationId: medicationId,
                symptom: symptom,
                severity: severity,
                recordedAt: recordedAt,
                note: note,
                resolved: resolved,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> medicationId = const Value.absent(),
                required String symptom,
                Value<int> severity = const Value.absent(),
                required DateTime recordedAt,
                Value<String?> note = const Value.absent(),
                Value<bool> resolved = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SymptomLogsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                medicationId: medicationId,
                symptom: symptom,
                severity: severity,
                recordedAt: recordedAt,
                note: note,
                resolved: resolved,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SymptomLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $$SymptomLogsTableReferences
                                    ._medicationIdTable(db),
                                referencedColumn: $$SymptomLogsTableReferences
                                    ._medicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SymptomLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SymptomLogsTable,
      SymptomLog,
      $$SymptomLogsTableFilterComposer,
      $$SymptomLogsTableOrderingComposer,
      $$SymptomLogsTableAnnotationComposer,
      $$SymptomLogsTableCreateCompanionBuilder,
      $$SymptomLogsTableUpdateCompanionBuilder,
      (SymptomLog, $$SymptomLogsTableReferences),
      SymptomLog,
      PrefetchHooks Function({bool medicationId})
    >;
typedef $$SyncOutboxTableCreateCompanionBuilder =
    SyncOutboxCompanion Function({
      Value<int> seq,
      required String entityTable,
      required String entityId,
      required SyncOp op,
      Value<DateTime> queuedAt,
      Value<int> attempts,
      Value<String?> lastError,
    });
typedef $$SyncOutboxTableUpdateCompanionBuilder =
    SyncOutboxCompanion Function({
      Value<int> seq,
      Value<String> entityTable,
      Value<String> entityId,
      Value<SyncOp> op,
      Value<DateTime> queuedAt,
      Value<int> attempts,
      Value<String?> lastError,
    });

class $$SyncOutboxTableFilterComposer
    extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get seq => $composableBuilder(
    column: $table.seq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityTable => $composableBuilder(
    column: $table.entityTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncOp, SyncOp, String> get op =>
      $composableBuilder(
        column: $table.op,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get queuedAt => $composableBuilder(
    column: $table.queuedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncOutboxTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get seq => $composableBuilder(
    column: $table.seq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityTable => $composableBuilder(
    column: $table.entityTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get op => $composableBuilder(
    column: $table.op,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get queuedAt => $composableBuilder(
    column: $table.queuedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncOutboxTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get seq =>
      $composableBuilder(column: $table.seq, builder: (column) => column);

  GeneratedColumn<String> get entityTable => $composableBuilder(
    column: $table.entityTable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncOp, String> get op =>
      $composableBuilder(column: $table.op, builder: (column) => column);

  GeneratedColumn<DateTime> get queuedAt =>
      $composableBuilder(column: $table.queuedAt, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$SyncOutboxTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncOutboxTable,
          SyncOutboxData,
          $$SyncOutboxTableFilterComposer,
          $$SyncOutboxTableOrderingComposer,
          $$SyncOutboxTableAnnotationComposer,
          $$SyncOutboxTableCreateCompanionBuilder,
          $$SyncOutboxTableUpdateCompanionBuilder,
          (
            SyncOutboxData,
            BaseReferences<_$AppDatabase, $SyncOutboxTable, SyncOutboxData>,
          ),
          SyncOutboxData,
          PrefetchHooks Function()
        > {
  $$SyncOutboxTableTableManager(_$AppDatabase db, $SyncOutboxTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOutboxTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOutboxTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOutboxTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                Value<String> entityTable = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<SyncOp> op = const Value.absent(),
                Value<DateTime> queuedAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => SyncOutboxCompanion(
                seq: seq,
                entityTable: entityTable,
                entityId: entityId,
                op: op,
                queuedAt: queuedAt,
                attempts: attempts,
                lastError: lastError,
              ),
          createCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                required String entityTable,
                required String entityId,
                required SyncOp op,
                Value<DateTime> queuedAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => SyncOutboxCompanion.insert(
                seq: seq,
                entityTable: entityTable,
                entityId: entityId,
                op: op,
                queuedAt: queuedAt,
                attempts: attempts,
                lastError: lastError,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncOutboxTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncOutboxTable,
      SyncOutboxData,
      $$SyncOutboxTableFilterComposer,
      $$SyncOutboxTableOrderingComposer,
      $$SyncOutboxTableAnnotationComposer,
      $$SyncOutboxTableCreateCompanionBuilder,
      $$SyncOutboxTableUpdateCompanionBuilder,
      (
        SyncOutboxData,
        BaseReferences<_$AppDatabase, $SyncOutboxTable, SyncOutboxData>,
      ),
      SyncOutboxData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$ConditionsTableTableManager get conditions =>
      $$ConditionsTableTableManager(_db, _db.conditions);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$DoseSchedulesTableTableManager get doseSchedules =>
      $$DoseSchedulesTableTableManager(_db, _db.doseSchedules);
  $$DoseLogsTableTableManager get doseLogs =>
      $$DoseLogsTableTableManager(_db, _db.doseLogs);
  $$SnoozesTableTableManager get snoozes =>
      $$SnoozesTableTableManager(_db, _db.snoozes);
  $$VitalsTableTableManager get vitals =>
      $$VitalsTableTableManager(_db, _db.vitals);
  $$SymptomLogsTableTableManager get symptomLogs =>
      $$SymptomLogsTableTableManager(_db, _db.symptomLogs);
  $$SyncOutboxTableTableManager get syncOutbox =>
      $$SyncOutboxTableTableManager(_db, _db.syncOutbox);
}
