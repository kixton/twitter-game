app.factory('TweetFactory', ['$resource', function($resource) {
  var searchRsc = $resource("/tweets");
  return {
    getResults: searchRsc.query()
  };
}]);