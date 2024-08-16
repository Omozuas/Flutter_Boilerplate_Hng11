const String organisationEndpoint = '/api/v1/organisations';

String productsForOrganisationEndpoint({required String orgId}) =>
    '$organisationEndpoint/$orgId/products';

const String userProductsEndpoint = '/api/v1/products';
String productsByIdEndpoint({required String id}) =>
    '$userProductsEndpoint/$id';
const String userCategoriesEndpoint = '$userProductsEndpoint/categories';
