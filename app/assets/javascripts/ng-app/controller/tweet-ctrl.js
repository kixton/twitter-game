app.controller('TweetCtrl', ['$scope', 'UserFactory', 'TweetFactory', '$timeout', '$location', 'GameFactory',
  function($scope, UserFactory, TweetFactory, $timeout, $location, GameFactory) {
    $scope.showCorrectAnswer = false
    $scope.score = true

    $scope.startGame = function() {
      GameFactory.startGame;
      $scope.score = true;
    };
    TweetFactory.getResults.$promise.then(function(data){
      $scope.displayedTweet = data[TweetFactory.number];
      $scope.tweets = data;
    });
    $scope.correctAnswers = 0
    $scope.checkAnswer = function(answer) {
      if (answer === $scope.displayedTweet) {
        $scope.correctAnswers += 1;
        $scope.showCorrectAnswer = true;
        $scope.response = "Correct"
      } else {
        $scope.showCorrectAnswer = true;
        $scope.response = "Incorrect"
      }
      $scope.nextQuestion();
    };
    $scope.nextQuestion = function() {
      $timeout(function(){
        $scope.showCorrectAnswer = false;
        ($scope.tweets).splice(0,4);
        console.log($scope.tweets.length)
        if ($scope.tweets.length === 0) {
          $scope.score = false
        }
        $scope.displayedTweet = $scope.tweets[Math.floor(Math.random() * 4)];
      }, 2000);
    };
}]);