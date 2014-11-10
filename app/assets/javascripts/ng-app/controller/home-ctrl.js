app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TwitterFactory',
  function($scope, UserFactory, TwitterFactory) {
    $scope.user = UserFactory.currentUser;
    $scope.tweets = TwitterFactory.tweets;
}]);

