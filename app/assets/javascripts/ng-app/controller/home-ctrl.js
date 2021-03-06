app.controller('HomeCtrl', ['$scope', '$location', 'UserFactory',
  function($scope, $location, UserFactory) {
    $scope.user = UserFactory.currentUser;
    $scope.user.$promise.then(function(data) {
      $scope.twitter_uid = data.twitter_uid
      if ($scope.twitter_uid === null) {
        $location.path('/')
      } else {
        $location.path('/menu')
      }
    });
}]);
