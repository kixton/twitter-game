app.controller('TweetCtrl', ['$scope', '$timeout', '$location', '$sce', 'UserFactory', 'TweetFactory', 'GameFactory', 'ClassFactory',
  function($scope, $timeout, $location, $sce, UserFactory, TweetFactory, GameFactory, ClassFactory) {
    $scope.showCorrectAnswer = false
    $scope.showScore = true
    $scope.theAnswer
    $scope.buttonClass
    $scope.correctAnswers = 0
    var handleResults = function(data){
      $scope.displayedTweet = data[TweetFactory.number];
      $scope.tweets = data;
      $scope.tweetToEmbed = $sce.trustAsHtml($scope.displayedTweet.embeddable_tweet);
    }
    TweetFactory.getResults.$promise.then(handleResults);
    $scope.checkAnswer = function(answerSelected, clickEvent) {
      $scope.theAnswer = $scope.displayedTweet
      if (answerSelected === $scope.theAnswer) {
        $scope.correctAnswers += 1;
        $scope.response = "Correct"
        $scope.showCorrectAnswer = true;
      } else {
        $scope.showCorrectAnswer = true;
        $scope.response = "Incorrect"
        ClassFactory.addIncorrectClass(clickEvent.target.classList)
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
      }, 1000);
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
  }
]);