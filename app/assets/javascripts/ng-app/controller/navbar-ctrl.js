app.controller('NavbarCtrl', ['$scope', 'User',
  function($scope, User) {
  $scope.user = User.currentUser;
}]);