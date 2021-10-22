import 'package:e_commerce_app/constants/database.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  //Singleton : can only be initialized once
  CartDatabaseHelper._();

  //this is how i'm gonna access this singleton class via this instance
  static final CartDatabaseHelper cDB = CartDatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    return _database ?? await initDB();
  }

  //Database Initialization Method
  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), kDatabaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $kTableCartProduct (
        $kColumnName TEXT NOT NULL,
        $kColumnImage TEXT NOT NULL,
        $kColumnPrice TEXT NOT NULL,
        $kColumnQuantity INTEGER NOT NULL,
        $kColumnproductId TEXT NOT NULL)
        ''');
      },
    );
  }

  ///////////////////////////////////// CRUD //////////////////////////

  //Database Inserting Method (CREATE)
  Future<void> insert(CartProductModel cartProductModel) async {
    Database dbClient = await database;

    await dbClient.insert(
      kTableCartProduct,
      cartProductModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Read -- All Tables
  Future<List<CartProductModel>> getAllProducts() async {
    Database dbClient = await database;
    List<Map<String, Object?>> maps = await dbClient.query(kTableCartProduct);
    List<CartProductModel> cartProductsList = (maps.isNotEmpty)
        ? maps
            .map((cartProduct) => CartProductModel.fromJson(cartProduct))
            .toList()
        : [];
    return cartProductsList;
  }

  //Update Cart Quantity
  Future<void> updateCartQuantity(CartProductModel cartModel) async {
    Database dbClient = await database;
    await dbClient.update(
      kTableCartProduct,
      cartModel.toJson(),
      where: '$kColumnproductId = ?',
      whereArgs: [cartModel.productId],
    );
  }

  //Delete Cart Item
  Future<void> delete(CartProductModel cartProductModel) async {
    Database dbClient = await database;

    await dbClient.delete(
      kTableCartProduct,
      where: '$kColumnproductId = ?',
      whereArgs: [cartProductModel.productId],
    );
  }

  //Delete all Cart Items
  Future<void> deleteAll() async {
    Database dbClient = await database;

    await dbClient.delete(kTableCartProduct);
  }
}
