
import '../objectbox.g.dart';
import 'model.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  late final Box<Recipe> recipeBox;
  late final Box<Ingredient> ingredientBox;

  late final Stream<Query<Recipe>> tasksStream;

  ObjectBox._create(this.store) {
    recipeBox = Box<Recipe>(store);
    ingredientBox = Box<Ingredient>(store);

    final qBuilder = recipeBox.query();
    tasksStream = qBuilder.watch(triggerImmediately: true);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }
}