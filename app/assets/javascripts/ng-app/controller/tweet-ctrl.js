app.controller('TweetCtrl', ['$scope', '$timeout', '$location', '$sce', 'UserFactory', 'TweetFactory', 'GameFactory',
  function($scope, $timeout, $location, $sce, UserFactory, TweetFactory, GameFactory) {
    $scope.showCorrectAnswer = false;
    $scope.showScore = true;
    var handleResults = function(data){
      $scope.displayedTweet = data[TweetFactory.number];
      $scope.tweets = data;
      $scope.tweetToEmbed = $sce.trustAsHtml($scope.displayedTweet.embeddable_tweet);
    }
    TweetFactory.getResults.$promise.then(handleResults);
    $scope.correctAnswers = 0;
    $scope.checkAnswer = function(answer) {
      if (answer === $scope.displayedTweet) {
        $scope.correctAnswers += 1;
        $scope.showCorrectAnswer = true;
        $scope.response = "Correct";
      } else {
        $scope.showCorrectAnswer = true;
        $scope.response = "Incorrect";
      }
      $scope.nextQuestion();
    };
    $scope.nextQuestion = function() {
      $timeout(function(){
        $scope.showCorrectAnswer = false;
        ($scope.tweets).splice(0,4);
        if ($scope.tweets.length === 0) {
          $scope.showScore = false;
        }
        $scope.displayedTweet = $scope.tweets[Math.floor(Math.random() * 4)];
        $scope.tweetToEmbed = $sce.trustAsHtml($scope.displayedTweet.embeddable_tweet);
      }, 5000);
    };
    $scope.startGame = function() {
      $scope.correctAnswers = 0;
      GameFactory.getTheTweets.query().$promise.then(function(data){
        $scope.displayedTweet = data[Math.floor(Math.random() * 4)];
        $scope.tweets = data;
        $scope.tweetToEmbed = $sce.trustAsHtml($scope.displayedTweet.embeddable_tweet);
      });
      GameFactory.startGame;
      $scope.showScore = true;
    };
}]);