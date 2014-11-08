app.controller('HomeCtrl', ['$scope', 'User', 'SearchFactory',
  function($scope, User, SearchFactory) {
    $scope.user = User.currentUser;
    $scope.tweets = SearchFactory.getResults;
}]);

