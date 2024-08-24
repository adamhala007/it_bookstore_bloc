import '../network/app_api.dart';
import '../response/responses.dart';

class RemoteBookstoreDatasource {
  AppServiceClient appServiceClient;

  RemoteBookstoreDatasource(this.appServiceClient);

  Future<BookResponse> getBookDetail(String isbn13) async {
    return await appServiceClient.getBookDetail(isbn13);
  }

  Future<BookStoreResponse> paginatedSearch(String query, int page) async {
    return await appServiceClient.paginatedSearch(query, page);
  }

  Future<BookStoreResponse> search(String query) async {
    return await appServiceClient.search(query);
  }

  Future<BookStoreResponse> searchNewReleases() async {
    return await appServiceClient.searchNewReleases();
  }
}
