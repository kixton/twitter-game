app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TweetFactory',
  function($scope, UserFactory, TweetFactory) {
    $scope.user = UserFactory.currentUser;
    $scope.tweets = TweetFactory.getResults;
    $scope.randNum = Math.floor(Math.random() * 3)
    // $scope.userNames = TweetFactory.userNames;
    $scope.checkAnswer = function(this) {
      console.log(this);
      console.log(this.tweet.last_tweet);
      // console.log($scope.tweets)
      if (guessAnswer === correctAnswer) {
        console.log("correct")
      } else {
        console.log("incorrect")
      }
    }
}]);

