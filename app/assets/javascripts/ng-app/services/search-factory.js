app.factory('SearchFactory', ['$resource', function($resource){
  var searchRsc = $resource("/tweets");
  var searchResults = {};

  return {
    getResults: searchRsc
  };
}]);