// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MyTableTable extends MyTable with TableInfo<$MyTableTable, MyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, age];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MyTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
    );
  }

  @override
  $MyTableTable createAlias(String alias) {
    return $MyTableTable(attachedDatabase, alias);
  }
}

class MyTableData extends DataClass implements Insertable<MyTableData> {
  final int id;
  final String name;
  final int age;
  const MyTableData({required this.id, required this.name, required this.age});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    return map;
  }

  MyTableCompanion toCompanion(bool nullToAbsent) {
    return MyTableCompanion(id: Value(id), name: Value(name), age: Value(age));
  }

  factory MyTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
    };
  }

  MyTableData copyWith({int? id, String? name, int? age}) => MyTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    age: age ?? this.age,
  );
  MyTableData copyWithCompanion(MyTableCompanion data) {
    return MyTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age);
}

class MyTableCompanion extends UpdateCompanion<MyTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  const MyTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
  });
  MyTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int age,
  }) : name = Value(name),
       age = Value(age);
  static Insertable<MyTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
    });
  }

  MyTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? age,
  }) {
    return MyTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MyTableTable myTable = $MyTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myTable];
}

typedef $$MyTableTableCreateCompanionBuilder =
    MyTableCompanion Function({
      Value<int> id,
      required String name,
      required int age,
    });
typedef $$MyTableTableUpdateCompanionBuilder =
    MyTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> age,
    });

class $$MyTableTableFilterComposer
    extends Composer<_$AppDatabase, $MyTableTable> {
  $$MyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MyTableTable> {
  $$MyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MyTableTable> {
  $$MyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);
}

class $$MyTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MyTableTable,
          MyTableData,
          $$MyTableTableFilterComposer,
          $$MyTableTableOrderingComposer,
          $$MyTableTableAnnotationComposer,
          $$MyTableTableCreateCompanionBuilder,
          $$MyTableTableUpdateCompanionBuilder,
          (
            MyTableData,
            BaseReferences<_$AppDatabase, $MyTableTable, MyTableData>,
          ),
          MyTableData,
          PrefetchHooks Function()
        > {
  $$MyTableTableTableManager(_$AppDatabase db, $MyTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> age = const Value.absent(),
              }) => MyTableCompanion(id: id, name: name, age: age),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int age,
              }) => MyTableCompanion.insert(id: id, name: name, age: age),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MyTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MyTableTable,
      MyTableData,
      $$MyTableTableFilterComposer,
      $$MyTableTableOrderingComposer,
      $$MyTableTableAnnotationComposer,
      $$MyTableTableCreateCompanionBuilder,
      $$MyTableTableUpdateCompanionBuilder,
      (MyTableData, BaseReferences<_$AppDatabase, $MyTableTable, MyTableData>),
      MyTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MyTableTableTableManager get myTable =>
      $$MyTableTableTableManager(_db, _db.myTable);
}
