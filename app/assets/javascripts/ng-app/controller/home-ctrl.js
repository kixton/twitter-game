app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TweetFactory',
  function($scope, UserFactory, TweetFactory) {
    $scope.user = UserFactory.currentUser;
    $scope.tweets = TweetFactory.getResults;
    // $scope.userNames = TweetFactory.userNames;
}]);

