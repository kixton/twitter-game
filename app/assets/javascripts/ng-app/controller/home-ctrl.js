app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TweetFactory',
  function($scope, UserFactory, TweetFactory) {
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
    }
}]);