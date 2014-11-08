app.controller('NavbarCtrl', ['$scope', 'UserFactory',
  function($scope, UserFactory) {
  $scope.user = UserFactory.currentUser;
}]);