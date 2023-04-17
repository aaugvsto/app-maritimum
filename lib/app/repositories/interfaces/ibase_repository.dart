abstract class IBaseInferface<T> {
  Future<List<T>> getAll();
  Future<List<T>> findById();
  Future<bool> createOrUpdate();
}
