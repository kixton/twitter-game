app.controller('HomeCtrl', ['$scope', 'User',
  function($scope, User) {
    $scope.user = User.currentUser;
}]);