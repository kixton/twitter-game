app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TweetFactory',
  function($scope, UserFactory, TweetFactory) {
    $scope.user = UserFactory.currentUser;
    $scope.tweets = TweetFactory.getResults;
    $scope.randNum = Math.floor(Math.random() * 4)
    // $scope.userNames = TweetFactory.userNames;
    $scope.checkAnswer = function(answer) {
      var correctAnswer = this.tweets[this.randNum].name;
      
      if (correctAnswer === answer.name) {
        console.log("correct");
      } else {
        console.log("incorrect");
      }
      //load next question
    }
}]);

