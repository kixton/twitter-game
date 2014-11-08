app.factory('SearchFactory', ['$resource', function($resource){
  var searchRsc = $resource("https://api.twitter.com/1.1/search/tweets.json?q=%23makersquare&count=5");
  var searchResults = {};

  return {
    search: function(keyword){
      searchRsc.get({q: keyword}, function(obj){
        searchResults.tweets = obj;
      });
    },
    getResults: searchRsc.query()
  }
}]);