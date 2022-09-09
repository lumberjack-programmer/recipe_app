// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'objectbox/model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3668093201178692833),
      name: 'Ingredient',
      lastPropertyId: const IdUid(2, 1393557100198708364),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2838937672579544706),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1393557100198708364),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 8464525591410364978),
      name: 'Recipe',
      lastPropertyId: const IdUid(4, 1707238230530180398),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 913443306354061583),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6433337149819213234),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6592309523446658760),
            name: 'cookingTime',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1707238230530180398),
            name: 'difficulty',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 3564755637715952785),
            name: 'ingredients',
            targetId: const IdUid(1, 3668093201178692833))
      ],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 8464525591410364978),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(1, 3564755637715952785),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Ingredient: EntityDefinition<Ingredient>(
        model: _entities[0],
        toOneRelations: (Ingredient object) => [],
        toManyRelations: (Ingredient object) => {},
        getId: (Ingredient object) => object.id,
        setId: (Ingredient object, int id) {
          object.id = id;
        },
        objectToFB: (Ingredient object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Ingredient(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''));

          return object;
        }),
    Recipe: EntityDefinition<Recipe>(
        model: _entities[1],
        toOneRelations: (Recipe object) => [],
        toManyRelations: (Recipe object) =>
            {RelInfo<Recipe>.toMany(1, object.id): object.ingredients},
        getId: (Recipe object) => object.id,
        setId: (Recipe object, int id) {
          object.id = id;
        },
        objectToFB: (Recipe object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.cookingTime);
          fbb.addInt64(3, object.difficulty);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Recipe(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              cookingTime:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              difficulty:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          InternalToManyAccess.setRelInfo(object.ingredients, store,
              RelInfo<Recipe>.toMany(1, object.id), store.box<Recipe>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Ingredient] entity fields to define ObjectBox queries.
class Ingredient_ {
  /// see [Ingredient.id]
  static final id =
      QueryIntegerProperty<Ingredient>(_entities[0].properties[0]);

  /// see [Ingredient.name]
  static final name =
      QueryStringProperty<Ingredient>(_entities[0].properties[1]);
}

/// [Recipe] entity fields to define ObjectBox queries.
class Recipe_ {
  /// see [Recipe.id]
  static final id = QueryIntegerProperty<Recipe>(_entities[1].properties[0]);

  /// see [Recipe.name]
  static final name = QueryStringProperty<Recipe>(_entities[1].properties[1]);

  /// see [Recipe.cookingTime]
  static final cookingTime =
      QueryIntegerProperty<Recipe>(_entities[1].properties[2]);

  /// see [Recipe.difficulty]
  static final difficulty =
      QueryIntegerProperty<Recipe>(_entities[1].properties[3]);

  /// see [Recipe.ingredients]
  static final ingredients =
      QueryRelationToMany<Recipe, Ingredient>(_entities[1].relations[0]);
}
