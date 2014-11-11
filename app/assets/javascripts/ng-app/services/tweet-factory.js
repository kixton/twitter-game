app.factory('TweetFactory', ['$resource', function($resource) {
  var searchRsc = $resource("/tweets");

  return {
    getResults: searchRsc.query()
    getQuestionTweet: function() {
      //shuffle the results array
      //pop the last element from array
      //display the text of the tweet and store the author in var correctAuthor
      
      this.getResults.
    }
  };
}]);