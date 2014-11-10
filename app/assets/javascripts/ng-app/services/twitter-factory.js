app.factory('TwitterFactory', ['$resource', '$location', function($resource, $location) {
  var twitterRsc = $resource('/tweets');
  twitterResults = {};
  return {
    getTweets: function () {
      twitterRsc.get(function(obj){
        twitterResults.tweets = obj;
        $location.path('/quizz');
      });
    },
    getResults: twitterResults.tweets
  };
}]);