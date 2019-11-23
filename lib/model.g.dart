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
  SubjectData(
      {@required this.id, @required this.name, @required this.enrolled});
  factory SubjectData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return SubjectData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      enrolled:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}enrolled']),
    );
  }
  factory SubjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return SubjectData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      enrolled: serializer.fromJson<bool>(json['enrolled']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'enrolled': serializer.toJson<bool>(enrolled),
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
    );
  }

  SubjectData copyWith({int id, String name, bool enrolled}) => SubjectData(
        id: id ?? this.id,
        name: name ?? this.name,
        enrolled: enrolled ?? this.enrolled,
      );
  @override
  String toString() {
    return (StringBuffer('SubjectData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('enrolled: $enrolled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, enrolled.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is SubjectData &&
          other.id == this.id &&
          other.name == this.name &&
          other.enrolled == this.enrolled);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> enrolled;
  const SubjectCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.enrolled = const Value.absent(),
  });
  SubjectCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required bool enrolled,
  })  : name = Value(name),
        enrolled = Value(enrolled);
  SubjectCompanion copyWith(
      {Value<int> id, Value<String> name, Value<bool> enrolled}) {
    return SubjectCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      enrolled: enrolled ?? this.enrolled,
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

  @override
  List<GeneratedColumn> get $columns => [id, name, enrolled];
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
  final int subject;
  TaskData(
      {@required this.id,
      @required this.name,
      this.description,
      @required this.importance,
      @required this.duedate,
      @required this.subject});
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
      subject:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}subject']),
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
      subject: serializer.fromJson<int>(json['subject']),
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
      'subject': serializer.toJson<int>(subject),
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
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
    );
  }

  TaskData copyWith(
          {int id,
          String name,
          String description,
          double importance,
          DateTime duedate,
          int subject}) =>
      TaskData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        importance: importance ?? this.importance,
        duedate: duedate ?? this.duedate,
        subject: subject ?? this.subject,
      );
  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('importance: $importance, ')
          ..write('duedate: $duedate, ')
          ..write('subject: $subject')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(importance.hashCode,
                  $mrjc(duedate.hashCode, subject.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.importance == this.importance &&
          other.duedate == this.duedate &&
          other.subject == this.subject);
}

class TaskCompanion extends UpdateCompanion<TaskData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<double> importance;
  final Value<DateTime> duedate;
  final Value<int> subject;
  const TaskCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.importance = const Value.absent(),
    this.duedate = const Value.absent(),
    this.subject = const Value.absent(),
  });
  TaskCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.description = const Value.absent(),
    @required double importance,
    this.duedate = const Value.absent(),
    @required int subject,
  })  : name = Value(name),
        importance = Value(importance),
        subject = Value(subject);
  TaskCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<double> importance,
      Value<DateTime> duedate,
      Value<int> subject}) {
    return TaskCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      importance: importance ?? this.importance,
      duedate: duedate ?? this.duedate,
      subject: subject ?? this.subject,
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

  final VerificationMeta _subjectMeta = const VerificationMeta('subject');
  GeneratedIntColumn _subject;
  @override
  GeneratedIntColumn get subject => _subject ??= _constructSubject();
  GeneratedIntColumn _constructSubject() {
    return GeneratedIntColumn('subject', $tableName, false,
        $customConstraints: 'REFERENCES subject(id)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, importance, duedate, subject];
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
    if (d.subject.present) {
      context.handle(_subjectMeta,
          subject.isAcceptableValue(d.subject.value, _subjectMeta));
    } else if (subject.isRequired && isInserting) {
      context.missing(_subjectMeta);
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
    if (d.subject.present) {
      map['subject'] = Variable<int, IntType>(d.subject.value);
    }
    return map;
  }

  @override
  $TaskTable createAlias(String alias) {
    return $TaskTable(_db, alias);
  }
}

abstract class _$DataBase extends GeneratedDatabase {
  _$DataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $SubjectTable _subject;
  $SubjectTable get subject => _subject ??= $SubjectTable(this);
  $TaskTable _task;
  $TaskTable get task => _task ??= $TaskTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as DataBase);
  SubjectDao _subjectDao;
  SubjectDao get subjectDao => _subjectDao ??= SubjectDao(this as DataBase);
  @override
  List<TableInfo> get allTables => [subject, task];
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
