app.factory('GameFactory', ['$resource', '$location', function($resource, $location) {
  return {
    startGame: function() {
      $location.path('/tweets')
    },
    getTheTweets: $resource("/tweets")
  };
}]);
