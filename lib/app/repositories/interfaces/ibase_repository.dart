abstract class IBaseInferface<T> {
  Future<List<T>> getAll();
  Future<T?> findById(int id);
  Future<bool> createOrUpdate(T t);
}
