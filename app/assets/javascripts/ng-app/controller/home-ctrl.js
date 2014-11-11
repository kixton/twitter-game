app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TweetFactory',
  function($scope, UserFactory, TweetFactory) {
    $scope.user = UserFactory.currentUser;
    TweetFactory.getResults.$promise.then(function(data){
      $scope.displayedTweet = data[TweetFactory.number];
      $scope.tweets = data;
    });
    $scope.checkAnswer = function(answer) {
      if (answer === $scope.displayedTweet) {
        console.log("THAT'S RIGHT")
      } else {
        console.log("NOOOO!!!")
      }
    }
}]);

