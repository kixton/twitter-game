app.controller('HomeCtrl', ['$scope', 'UserFactory', 'SearchFactory',
  function($scope, UserFactory, SearchFactory) {
    $scope.user = UserFactory.currentUser;
}]);

