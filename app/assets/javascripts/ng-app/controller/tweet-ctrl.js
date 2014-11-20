app.controller('TweetCtrl', ['$scope', '$location', '$sce', 'UserFactory', 'TweetFactory', 'GameFactory', 'ClassFactory',
  function($scope, $location, $sce, UserFactory, TweetFactory, GameFactory, ClassFactory) {
    $scope.showCorrectAnswer = false;
    $scope.showScore = true;
    $scope.theAnswer;
    $scope.buttonClass;
    $scope.correctAnswers = 0;
    var handleResults = function(data){
      $scope.displayedTweet = data[Math.floor(Math.random() * 4)];
      $scope.tweets = data;
      $scope.tweetToEmbed = $sce.trustAsHtml($scope.displayedTweet.embeddable_tweet);
    }
    TweetFactory.getResults.$promise.then(handleResults);
    $scope.checkAnswer = function(answerSelected, clickEvent) {
      $scope.theAnswer = $scope.displayedTweet;
      $scope.showCorrectAnswer = true;
      if (answerSelected === $scope.theAnswer) {
        $scope.correctAnswers += 1;
      } else {
        ClassFactory.addIncorrectClass(clickEvent.target.classList);
      }
    };
    $scope.nextQuestion = function() {
        $scope.showCorrectAnswer = false;
        ($scope.tweets).splice(0,4);
        if ($scope.tweets.length === 0) {
          $scope.showScore = false;
        } else {
          if ($scope.tweets.length < 4) {
            $scope.questionsRemaining = $scope.tweets.length;
            $scope.displayedTweet = $scope.tweets[Math.floor(Math.random() * $scope.questionsRemaining)];
            $scope.tweetToEmbed = $sce.trustAsHtml($scope.displayedTweet.embeddable_tweet);
          } else {
            $scope.displayedTweet = $scope.tweets[Math.floor(Math.random() * 4)];
            $scope.tweetToEmbed = $sce.trustAsHtml($scope.displayedTweet.embeddable_tweet);
          }
        }
    };
    $scope.startGame = function() {
      $scope.correctAnswers = 0;
      GameFactory.getTheTweets.query().$promise.then(handleResults);
      GameFactory.startGame;
      $scope.showScore = true;
    };
  }
]);