app.factory('TweetFactory', ['$resource', function($resource) {
  var searchRsc = $resource("/tweets");
  var rand = Math.floor(Math.random() * 4);
  return {
    getResults: searchRsc.query(),
    number: rand,
  };
}]);