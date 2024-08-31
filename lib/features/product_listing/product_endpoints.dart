const String organisationEndpoint = 'organisations';

String productsForOrganisationEndpoint({required String orgId}) =>
    '$organisationEndpoint/$orgId/products';

const String userProductsEndpoint = 'products';
String productsByIdEndpoint({required String id}) =>
    '$userProductsEndpoint/$id';
const String userCategoriesEndpoint = '$userProductsEndpoint/categories';
