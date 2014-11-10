app.factory('TwitterFactory', ['$resource', function($resource) {
  var twitterRsc = $resource('/tweets');

  return {
    tweets: twitterRsc.get()
  };
}]);