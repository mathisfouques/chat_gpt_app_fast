// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_stored.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChatStoredCollection on Isar {
  IsarCollection<ChatStored> get chatStoreds => this.collection();
}

const ChatStoredSchema = CollectionSchema(
  name: r'ChatStored',
  id: -4046251866382462899,
  properties: {
    r'messages': PropertySchema(
      id: 0,
      name: r'messages',
      type: IsarType.objectList,
      target: r'MessageStored',
    )
  },
  estimateSize: _chatStoredEstimateSize,
  serialize: _chatStoredSerialize,
  deserialize: _chatStoredDeserialize,
  deserializeProp: _chatStoredDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'MessageStored': MessageStoredSchema},
  getId: _chatStoredGetId,
  getLinks: _chatStoredGetLinks,
  attach: _chatStoredAttach,
  version: '3.1.0+1',
);

int _chatStoredEstimateSize(
  ChatStored object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.messages.length * 3;
  {
    final offsets = allOffsets[MessageStored]!;
    for (var i = 0; i < object.messages.length; i++) {
      final value = object.messages[i];
      bytesCount +=
          MessageStoredSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _chatStoredSerialize(
  ChatStored object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<MessageStored>(
    offsets[0],
    allOffsets,
    MessageStoredSchema.serialize,
    object.messages,
  );
}

ChatStored _chatStoredDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChatStored();
  object.id = id;
  object.messages = reader.readObjectList<MessageStored>(
        offsets[0],
        MessageStoredSchema.deserialize,
        allOffsets,
        MessageStored(),
      ) ??
      [];
  return object;
}

P _chatStoredDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<MessageStored>(
            offset,
            MessageStoredSchema.deserialize,
            allOffsets,
            MessageStored(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chatStoredGetId(ChatStored object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chatStoredGetLinks(ChatStored object) {
  return [];
}

void _chatStoredAttach(IsarCollection<dynamic> col, Id id, ChatStored object) {
  object.id = id;
}

extension ChatStoredQueryWhereSort
    on QueryBuilder<ChatStored, ChatStored, QWhere> {
  QueryBuilder<ChatStored, ChatStored, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChatStoredQueryWhere
    on QueryBuilder<ChatStored, ChatStored, QWhereClause> {
  QueryBuilder<ChatStored, ChatStored, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ChatStored, ChatStored, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterWhereClause> idBetween(
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

extension ChatStoredQueryFilter
    on QueryBuilder<ChatStored, ChatStored, QFilterCondition> {
  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition>
      messagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition>
      messagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition>
      messagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition>
      messagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition>
      messagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition>
      messagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ChatStoredQueryObject
    on QueryBuilder<ChatStored, ChatStored, QFilterCondition> {
  QueryBuilder<ChatStored, ChatStored, QAfterFilterCondition> messagesElement(
      FilterQuery<MessageStored> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'messages');
    });
  }
}

extension ChatStoredQueryLinks
    on QueryBuilder<ChatStored, ChatStored, QFilterCondition> {}

extension ChatStoredQuerySortBy
    on QueryBuilder<ChatStored, ChatStored, QSortBy> {}

extension ChatStoredQuerySortThenBy
    on QueryBuilder<ChatStored, ChatStored, QSortThenBy> {
  QueryBuilder<ChatStored, ChatStored, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChatStored, ChatStored, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ChatStoredQueryWhereDistinct
    on QueryBuilder<ChatStored, ChatStored, QDistinct> {}

extension ChatStoredQueryProperty
    on QueryBuilder<ChatStored, ChatStored, QQueryProperty> {
  QueryBuilder<ChatStored, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChatStored, List<MessageStored>, QQueryOperations>
      messagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'messages');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MessageStoredSchema = Schema(
  name: r'MessageStored',
  id: -2985786793178595098,
  properties: {
    r'author': PropertySchema(
      id: 0,
      name: r'author',
      type: IsarType.byte,
      enumMap: _MessageStoredauthorEnumValueMap,
    ),
    r'text': PropertySchema(
      id: 1,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _messageStoredEstimateSize,
  serialize: _messageStoredSerialize,
  deserialize: _messageStoredDeserialize,
  deserializeProp: _messageStoredDeserializeProp,
);

int _messageStoredEstimateSize(
  MessageStored object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _messageStoredSerialize(
  MessageStored object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.author.index);
  writer.writeString(offsets[1], object.text);
}

MessageStored _messageStoredDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MessageStored();
  object.author =
      _MessageStoredauthorValueEnumMap[reader.readByteOrNull(offsets[0])] ??
          Participant.user;
  object.text = reader.readString(offsets[1]);
  return object;
}

P _messageStoredDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_MessageStoredauthorValueEnumMap[reader.readByteOrNull(offset)] ??
          Participant.user) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MessageStoredauthorEnumValueMap = {
  'user': 0,
  'assistant': 1,
};
const _MessageStoredauthorValueEnumMap = {
  0: Participant.user,
  1: Participant.assistant,
};

extension MessageStoredQueryFilter
    on QueryBuilder<MessageStored, MessageStored, QFilterCondition> {
  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      authorEqualTo(Participant value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      authorGreaterThan(
    Participant value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      authorLessThan(
    Participant value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      authorBetween(
    Participant lower,
    Participant upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageStored, MessageStored, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension MessageStoredQueryObject
    on QueryBuilder<MessageStored, MessageStored, QFilterCondition> {}
