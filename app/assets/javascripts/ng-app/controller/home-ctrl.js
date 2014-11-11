app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TweetFactory', '$timeout',
  function($scope, UserFactory, TweetFactory, $timeout) {
    $scope.showCorrectAnswer = false
    $scope.user = UserFactory.currentUser;
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
        $scope.displayedTweet = $scope.tweets[Math.floor(Math.random() * 4)];
      }, 5000);
    };
}]);
