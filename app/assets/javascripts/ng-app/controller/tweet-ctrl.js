app.controller('TweetCtrl', ['$scope', '$timeout', '$location', 'UserFactory', 'TweetFactory', 'GameFactory',
  function($scope, $timeout, $location, UserFactory, TweetFactory, GameFactory) {
    $scope.showCorrectAnswer = false;
    $scope.showScore = true;
    TweetFactory.getResults.$promise.then(function(data){
      $scope.displayedTweet = data[TweetFactory.number];
      $scope.tweets = data;
    });
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
      }, 2000);
    };
    $scope.startGame = function() {
      $scope.correctAnswers = 0;
      GameFactory.getTheTweets.query().$promise.then(function(data){
        $scope.displayedTweet = data[Math.floor(Math.random() * 4)];
        $scope.tweets = data;
      });
      GameFactory.startGame;
      $scope.showScore = true;
    };
}]);