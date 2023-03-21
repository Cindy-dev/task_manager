// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAddTaskDBCollection on Isar {
  IsarCollection<AddTaskDB> get addTaskDBs => this.collection();
}

const AddTaskDBSchema = CollectionSchema(
  name: r'AddTaskDB',
  id: 1461898737715079698,
  properties: {
    r'taskDate': PropertySchema(
      id: 0,
      name: r'taskDate',
      type: IsarType.string,
    ),
    r'taskDetails': PropertySchema(
      id: 1,
      name: r'taskDetails',
      type: IsarType.string,
    ),
    r'taskName': PropertySchema(
      id: 2,
      name: r'taskName',
      type: IsarType.string,
    ),
    r'taskNotification': PropertySchema(
      id: 3,
      name: r'taskNotification',
      type: IsarType.string,
    ),
    r'taskRepeat': PropertySchema(
      id: 4,
      name: r'taskRepeat',
      type: IsarType.string,
    ),
    r'taskTime': PropertySchema(
      id: 5,
      name: r'taskTime',
      type: IsarType.string,
    )
  },
  estimateSize: _addTaskDBEstimateSize,
  serialize: _addTaskDBSerialize,
  deserialize: _addTaskDBDeserialize,
  deserializeProp: _addTaskDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _addTaskDBGetId,
  getLinks: _addTaskDBGetLinks,
  attach: _addTaskDBAttach,
  version: '3.0.5',
);

int _addTaskDBEstimateSize(
  AddTaskDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.taskDate.length * 3;
  {
    final value = object.taskDetails;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.taskName.length * 3;
  bytesCount += 3 + object.taskNotification.length * 3;
  bytesCount += 3 + object.taskRepeat.length * 3;
  bytesCount += 3 + object.taskTime.length * 3;
  return bytesCount;
}

void _addTaskDBSerialize(
  AddTaskDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.taskDate);
  writer.writeString(offsets[1], object.taskDetails);
  writer.writeString(offsets[2], object.taskName);
  writer.writeString(offsets[3], object.taskNotification);
  writer.writeString(offsets[4], object.taskRepeat);
  writer.writeString(offsets[5], object.taskTime);
}

AddTaskDB _addTaskDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AddTaskDB();
  object.id = id;
  object.taskDate = reader.readString(offsets[0]);
  object.taskDetails = reader.readStringOrNull(offsets[1]);
  object.taskName = reader.readString(offsets[2]);
  object.taskNotification = reader.readString(offsets[3]);
  object.taskRepeat = reader.readString(offsets[4]);
  object.taskTime = reader.readString(offsets[5]);
  return object;
}

P _addTaskDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _addTaskDBGetId(AddTaskDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _addTaskDBGetLinks(AddTaskDB object) {
  return [];
}

void _addTaskDBAttach(IsarCollection<dynamic> col, Id id, AddTaskDB object) {
  object.id = id;
}

extension AddTaskDBQueryWhereSort
    on QueryBuilder<AddTaskDB, AddTaskDB, QWhere> {
  QueryBuilder<AddTaskDB, AddTaskDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AddTaskDBQueryWhere
    on QueryBuilder<AddTaskDB, AddTaskDB, QWhereClause> {
  QueryBuilder<AddTaskDB, AddTaskDB, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AddTaskDBQueryFilter
    on QueryBuilder<AddTaskDB, AddTaskDB, QFilterCondition> {
  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskDate',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskDate',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskDetails',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskDetails',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDetailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskDetailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDetailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDetailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskDetails',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskDetailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDetailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDetailsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskDetailsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskDetails',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskNotification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskNotification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskNotification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskNotification',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskNotification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskNotification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskNotification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskNotification',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskNotification',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskNotificationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskNotification',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskRepeatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskRepeatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskRepeatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskRepeatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskRepeat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskRepeatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskRepeatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskRepeatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskRepeatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskRepeat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskRepeatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskRepeat',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskRepeatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskRepeat',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition> taskTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskTime',
        value: '',
      ));
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterFilterCondition>
      taskTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskTime',
        value: '',
      ));
    });
  }
}

extension AddTaskDBQueryObject
    on QueryBuilder<AddTaskDB, AddTaskDB, QFilterCondition> {}

extension AddTaskDBQueryLinks
    on QueryBuilder<AddTaskDB, AddTaskDB, QFilterCondition> {}

extension AddTaskDBQuerySortBy on QueryBuilder<AddTaskDB, AddTaskDB, QSortBy> {
  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDate', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDate', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDetails', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDetails', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskNotification', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy>
      sortByTaskNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskNotification', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskRepeat', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskRepeat', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTime', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> sortByTaskTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTime', Sort.desc);
    });
  }
}

extension AddTaskDBQuerySortThenBy
    on QueryBuilder<AddTaskDB, AddTaskDB, QSortThenBy> {
  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDate', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDate', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDetails', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDetails', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskNotification', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy>
      thenByTaskNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskNotification', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskRepeat', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskRepeat', Sort.desc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTime', Sort.asc);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QAfterSortBy> thenByTaskTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTime', Sort.desc);
    });
  }
}

extension AddTaskDBQueryWhereDistinct
    on QueryBuilder<AddTaskDB, AddTaskDB, QDistinct> {
  QueryBuilder<AddTaskDB, AddTaskDB, QDistinct> distinctByTaskDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QDistinct> distinctByTaskDetails(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskDetails', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QDistinct> distinctByTaskName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QDistinct> distinctByTaskNotification(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskNotification',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QDistinct> distinctByTaskRepeat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskRepeat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddTaskDB, AddTaskDB, QDistinct> distinctByTaskTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskTime', caseSensitive: caseSensitive);
    });
  }
}

extension AddTaskDBQueryProperty
    on QueryBuilder<AddTaskDB, AddTaskDB, QQueryProperty> {
  QueryBuilder<AddTaskDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AddTaskDB, String, QQueryOperations> taskDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskDate');
    });
  }

  QueryBuilder<AddTaskDB, String?, QQueryOperations> taskDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskDetails');
    });
  }

  QueryBuilder<AddTaskDB, String, QQueryOperations> taskNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskName');
    });
  }

  QueryBuilder<AddTaskDB, String, QQueryOperations> taskNotificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskNotification');
    });
  }

  QueryBuilder<AddTaskDB, String, QQueryOperations> taskRepeatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskRepeat');
    });
  }

  QueryBuilder<AddTaskDB, String, QQueryOperations> taskTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskTime');
    });
  }
}
