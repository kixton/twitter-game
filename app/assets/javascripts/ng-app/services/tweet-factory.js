app.factory('TweetFactory', ['$resource', function($resource) {
  var searchRsc = $resource("/tweets");

  return {
    getResults: searchRsc.get(),
    userNames: Object.getOwnPropertyNames(searchRsc.get())
  };
}]);