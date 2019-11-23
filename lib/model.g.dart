// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class SubjectData extends DataClass implements Insertable<SubjectData> {
  final int id;
  final String name;
  final bool enrolled;
  final double ects;

  SubjectData(
      {@required this.id,
      @required this.name,
      @required this.enrolled,
      @required this.ects});

  factory SubjectData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final doubleType = db.typeSystem.forDartType<double>();
    return SubjectData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      enrolled:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}enrolled']),
      ects: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}ects']),
    );
  }

  factory SubjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return SubjectData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      enrolled: serializer.fromJson<bool>(json['enrolled']),
      ects: serializer.fromJson<double>(json['ects']),
    );
  }

  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'enrolled': serializer.toJson<bool>(enrolled),
      'ects': serializer.toJson<double>(ects),
    };
  }

  @override
  SubjectCompanion createCompanion(bool nullToAbsent) {
    return SubjectCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      enrolled: enrolled == null && nullToAbsent
          ? const Value.absent()
          : Value(enrolled),
      ects: ects == null && nullToAbsent ? const Value.absent() : Value(ects),
    );
  }

  SubjectData copyWith({int id, String name, bool enrolled, double ects}) =>
      SubjectData(
        id: id ?? this.id,
        name: name ?? this.name,
        enrolled: enrolled ?? this.enrolled,
        ects: ects ?? this.ects,
      );

  @override
  String toString() {
    return (StringBuffer('SubjectData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('enrolled: $enrolled, ')
          ..write('ects: $ects')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(enrolled.hashCode, ects.hashCode))));

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is SubjectData &&
          other.id == this.id &&
          other.name == this.name &&
          other.enrolled == this.enrolled &&
          other.ects == this.ects);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> enrolled;
  final Value<double> ects;

  const SubjectCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.enrolled = const Value.absent(),
    this.ects = const Value.absent(),
  });

  SubjectCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required bool enrolled,
    @required double ects,
  })  : name = Value(name),
        enrolled = Value(enrolled),
        ects = Value(ects);

  SubjectCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<bool> enrolled,
      Value<double> ects}) {
    return SubjectCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      enrolled: enrolled ?? this.enrolled,
      ects: ects ?? this.ects,
    );
  }
}

class $SubjectTable extends Subject with TableInfo<$SubjectTable, SubjectData> {
  final GeneratedDatabase _db;
  final String _alias;

  $SubjectTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;

  @override
  GeneratedTextColumn get name => _name ??= _constructName();

  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _enrolledMeta = const VerificationMeta('enrolled');
  GeneratedBoolColumn _enrolled;

  @override
  GeneratedBoolColumn get enrolled => _enrolled ??= _constructEnrolled();

  GeneratedBoolColumn _constructEnrolled() {
    return GeneratedBoolColumn(
      'enrolled',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ectsMeta = const VerificationMeta('ects');
  GeneratedRealColumn _ects;

  @override
  GeneratedRealColumn get ects => _ects ??= _constructEcts();

  GeneratedRealColumn _constructEcts() {
    return GeneratedRealColumn(
      'ects',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, enrolled, ects];

  @override
  $SubjectTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'subject';
  @override
  final String actualTableName = 'subject';

  @override
  VerificationContext validateIntegrity(SubjectCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.enrolled.present) {
      context.handle(_enrolledMeta,
          enrolled.isAcceptableValue(d.enrolled.value, _enrolledMeta));
    } else if (enrolled.isRequired && isInserting) {
      context.missing(_enrolledMeta);
    }
    if (d.ects.present) {
      context.handle(
          _ectsMeta, ects.isAcceptableValue(d.ects.value, _ectsMeta));
    } else if (ects.isRequired && isInserting) {
      context.missing(_ectsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  SubjectData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SubjectData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SubjectCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.enrolled.present) {
      map['enrolled'] = Variable<bool, BoolType>(d.enrolled.value);
    }
    if (d.ects.present) {
      map['ects'] = Variable<double, RealType>(d.ects.value);
    }
    return map;
  }

  @override
  $SubjectTable createAlias(String alias) {
    return $SubjectTable(_db, alias);
  }
}

class TaskData extends DataClass implements Insertable<TaskData> {
  final int id;
  final String name;
  final String description;
  final double importance;
  final DateTime duedate;

  TaskData(
      {@required this.id,
      @required this.name,
      this.description,
      @required this.importance,
      @required this.duedate});

  factory TaskData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return TaskData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      importance: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}importance']),
      duedate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}duedate']),
    );
  }

  factory TaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TaskData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      importance: serializer.fromJson<double>(json['importance']),
      duedate: serializer.fromJson<DateTime>(json['duedate']),
    );
  }

  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'importance': serializer.toJson<double>(importance),
      'duedate': serializer.toJson<DateTime>(duedate),
    };
  }

  @override
  TaskCompanion createCompanion(bool nullToAbsent) {
    return TaskCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      importance: importance == null && nullToAbsent
          ? const Value.absent()
          : Value(importance),
      duedate: duedate == null && nullToAbsent
          ? const Value.absent()
          : Value(duedate),
    );
  }

  TaskData copyWith(
          {int id,
          String name,
          String description,
          double importance,
          DateTime duedate}) =>
      TaskData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        importance: importance ?? this.importance,
        duedate: duedate ?? this.duedate,
      );

  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('importance: $importance, ')
          ..write('duedate: $duedate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(description.hashCode,
              $mrjc(importance.hashCode, duedate.hashCode)))));

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.importance == this.importance &&
          other.duedate == this.duedate);
}

class TaskCompanion extends UpdateCompanion<TaskData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<double> importance;
  final Value<DateTime> duedate;

  const TaskCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.importance = const Value.absent(),
    this.duedate = const Value.absent(),
  });

  TaskCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.description = const Value.absent(),
    @required double importance,
    this.duedate = const Value.absent(),
  })  : name = Value(name),
        importance = Value(importance);

  TaskCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<double> importance,
      Value<DateTime> duedate}) {
    return TaskCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      importance: importance ?? this.importance,
      duedate: duedate ?? this.duedate,
    );
  }
}

class $TaskTable extends Task with TableInfo<$TaskTable, TaskData> {
  final GeneratedDatabase _db;
  final String _alias;

  $TaskTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;

  @override
  GeneratedTextColumn get name => _name ??= _constructName();

  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;

  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();

  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _importanceMeta = const VerificationMeta('importance');
  GeneratedRealColumn _importance;

  @override
  GeneratedRealColumn get importance => _importance ??= _constructImportance();

  GeneratedRealColumn _constructImportance() {
    return GeneratedRealColumn(
      'importance',
      $tableName,
      false,
    );
  }

  final VerificationMeta _duedateMeta = const VerificationMeta('duedate');
  GeneratedDateTimeColumn _duedate;

  @override
  GeneratedDateTimeColumn get duedate => _duedate ??= _constructDuedate();

  GeneratedDateTimeColumn _constructDuedate() {
    return GeneratedDateTimeColumn('duedate', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, importance, duedate];

  @override
  $TaskTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'task';
  @override
  final String actualTableName = 'task';

  @override
  VerificationContext validateIntegrity(TaskCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (description.isRequired && isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.importance.present) {
      context.handle(_importanceMeta,
          importance.isAcceptableValue(d.importance.value, _importanceMeta));
    } else if (importance.isRequired && isInserting) {
      context.missing(_importanceMeta);
    }
    if (d.duedate.present) {
      context.handle(_duedateMeta,
          duedate.isAcceptableValue(d.duedate.value, _duedateMeta));
    } else if (duedate.isRequired && isInserting) {
      context.missing(_duedateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  TaskData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TaskData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TaskCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.importance.present) {
      map['importance'] = Variable<double, RealType>(d.importance.value);
    }
    if (d.duedate.present) {
      map['duedate'] = Variable<DateTime, DateTimeType>(d.duedate.value);
    }
    return map;
  }

  @override
  $TaskTable createAlias(String alias) {
    return $TaskTable(_db, alias);
  }
}

class ColorData extends DataClass implements Insertable<ColorData> {
  final int id;
  final String name;
  final String hexCode;

  ColorData({@required this.id, @required this.name, @required this.hexCode});

  factory ColorData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ColorData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      hexCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}hex_code']),
    );
  }

  factory ColorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ColorData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      hexCode: serializer.fromJson<String>(json['hexCode']),
    );
  }

  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'hexCode': serializer.toJson<String>(hexCode),
    };
  }

  @override
  ColorCompanion createCompanion(bool nullToAbsent) {
    return ColorCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      hexCode: hexCode == null && nullToAbsent
          ? const Value.absent()
          : Value(hexCode),
    );
  }

  ColorData copyWith({int id, String name, String hexCode}) => ColorData(
        id: id ?? this.id,
        name: name ?? this.name,
        hexCode: hexCode ?? this.hexCode,
      );

  @override
  String toString() {
    return (StringBuffer('ColorData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, hexCode.hashCode)));

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is ColorData &&
          other.id == this.id &&
          other.name == this.name &&
          other.hexCode == this.hexCode);
}

class ColorCompanion extends UpdateCompanion<ColorData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> hexCode;

  const ColorCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.hexCode = const Value.absent(),
  });

  ColorCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String hexCode,
  })  : name = Value(name),
        hexCode = Value(hexCode);

  ColorCompanion copyWith(
      {Value<int> id, Value<String> name, Value<String> hexCode}) {
    return ColorCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      hexCode: hexCode ?? this.hexCode,
    );
  }
}

class $ColorTable extends Color with TableInfo<$ColorTable, ColorData> {
  final GeneratedDatabase _db;
  final String _alias;

  $ColorTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;

  @override
  GeneratedTextColumn get name => _name ??= _constructName();

  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hexCodeMeta = const VerificationMeta('hexCode');
  GeneratedTextColumn _hexCode;

  @override
  GeneratedTextColumn get hexCode => _hexCode ??= _constructHexCode();

  GeneratedTextColumn _constructHexCode() {
    return GeneratedTextColumn('hex_code', $tableName, false, maxTextLength: 6);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, hexCode];

  @override
  $ColorTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'color';
  @override
  final String actualTableName = 'color';

  @override
  VerificationContext validateIntegrity(ColorCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.hexCode.present) {
      context.handle(_hexCodeMeta,
          hexCode.isAcceptableValue(d.hexCode.value, _hexCodeMeta));
    } else if (hexCode.isRequired && isInserting) {
      context.missing(_hexCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  ColorData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ColorData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ColorCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.hexCode.present) {
      map['hex_code'] = Variable<String, StringType>(d.hexCode.value);
    }
    return map;
  }

  @override
  $ColorTable createAlias(String alias) {
    return $ColorTable(_db, alias);
  }
}

class TeacherData extends DataClass implements Insertable<TeacherData> {
  final int id;
  final String title;
  final String firstname;
  final String lastname;
  final String email;

  TeacherData(
      {@required this.id,
      @required this.title,
      @required this.firstname,
      @required this.lastname,
      @required this.email});

  factory TeacherData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TeacherData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      firstname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}firstname']),
      lastname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}lastname']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }

  factory TeacherData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TeacherData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      firstname: serializer.fromJson<String>(json['firstname']),
      lastname: serializer.fromJson<String>(json['lastname']),
      email: serializer.fromJson<String>(json['email']),
    );
  }

  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'firstname': serializer.toJson<String>(firstname),
      'lastname': serializer.toJson<String>(lastname),
      'email': serializer.toJson<String>(email),
    };
  }

  @override
  TeacherCompanion createCompanion(bool nullToAbsent) {
    return TeacherCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      firstname: firstname == null && nullToAbsent
          ? const Value.absent()
          : Value(firstname),
      lastname: lastname == null && nullToAbsent
          ? const Value.absent()
          : Value(lastname),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  TeacherData copyWith(
          {int id,
          String title,
          String firstname,
          String lastname,
          String email}) =>
      TeacherData(
        id: id ?? this.id,
        title: title ?? this.title,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
      );

  @override
  String toString() {
    return (StringBuffer('TeacherData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              firstname.hashCode, $mrjc(lastname.hashCode, email.hashCode)))));

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TeacherData &&
          other.id == this.id &&
          other.title == this.title &&
          other.firstname == this.firstname &&
          other.lastname == this.lastname &&
          other.email == this.email);
}

class TeacherCompanion extends UpdateCompanion<TeacherData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> firstname;
  final Value<String> lastname;
  final Value<String> email;

  const TeacherCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastname = const Value.absent(),
    this.email = const Value.absent(),
  });

  TeacherCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String firstname,
    @required String lastname,
    @required String email,
  })  : title = Value(title),
        firstname = Value(firstname),
        lastname = Value(lastname),
        email = Value(email);

  TeacherCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> firstname,
      Value<String> lastname,
      Value<String> email}) {
    return TeacherCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
    );
  }
}

class $TeacherTable extends Teacher with TableInfo<$TeacherTable, TeacherData> {
  final GeneratedDatabase _db;
  final String _alias;

  $TeacherTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;

  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();

  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstnameMeta = const VerificationMeta('firstname');
  GeneratedTextColumn _firstname;

  @override
  GeneratedTextColumn get firstname => _firstname ??= _constructFirstname();

  GeneratedTextColumn _constructFirstname() {
    return GeneratedTextColumn(
      'firstname',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastnameMeta = const VerificationMeta('lastname');
  GeneratedTextColumn _lastname;

  @override
  GeneratedTextColumn get lastname => _lastname ??= _constructLastname();

  GeneratedTextColumn _constructLastname() {
    return GeneratedTextColumn(
      'lastname',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;

  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();

  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, firstname, lastname, email];

  @override
  $TeacherTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'teacher';
  @override
  final String actualTableName = 'teacher';

  @override
  VerificationContext validateIntegrity(TeacherCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.firstname.present) {
      context.handle(_firstnameMeta,
          firstname.isAcceptableValue(d.firstname.value, _firstnameMeta));
    } else if (firstname.isRequired && isInserting) {
      context.missing(_firstnameMeta);
    }
    if (d.lastname.present) {
      context.handle(_lastnameMeta,
          lastname.isAcceptableValue(d.lastname.value, _lastnameMeta));
    } else if (lastname.isRequired && isInserting) {
      context.missing(_lastnameMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  TeacherData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TeacherData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TeacherCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.firstname.present) {
      map['firstname'] = Variable<String, StringType>(d.firstname.value);
    }
    if (d.lastname.present) {
      map['lastname'] = Variable<String, StringType>(d.lastname.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    return map;
  }

  @override
  $TeacherTable createAlias(String alias) {
    return $TeacherTable(_db, alias);
  }
}

abstract class _$DataBase extends GeneratedDatabase {
  _$DataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $SubjectTable _subject;

  $SubjectTable get subject => _subject ??= $SubjectTable(this);
  $TaskTable _task;

  $TaskTable get task => _task ??= $TaskTable(this);
  $ColorTable _color;

  $ColorTable get color => _color ??= $ColorTable(this);
  $TeacherTable _teacher;

  $TeacherTable get teacher => _teacher ??= $TeacherTable(this);
  TaskDao _taskDao;

  TaskDao get taskDao => _taskDao ??= TaskDao(this as DataBase);
  SubjectDao _subjectDao;

  SubjectDao get subjectDao => _subjectDao ??= SubjectDao(this as DataBase);
  TeacherDao _teacherDao;

  TeacherDao get teacherDao => _teacherDao ??= TeacherDao(this as DataBase);
  ColorDao _colorDao;

  ColorDao get colorDao => _colorDao ??= ColorDao(this as DataBase);

  @override
  List<TableInfo> get allTables => [subject, task, color, teacher];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TaskDaoMixin on DatabaseAccessor<DataBase> {
  $TaskTable get task => db.task;
}
mixin _$SubjectDaoMixin on DatabaseAccessor<DataBase> {
  $SubjectTable get subject => db.subject;
}
mixin _$TeacherDaoMixin on DatabaseAccessor<DataBase> {
  $TeacherTable get teacher => db.teacher;
}
mixin _$ColorDaoMixin on DatabaseAccessor<DataBase> {
  $ColorTable get color => db.color;
}
