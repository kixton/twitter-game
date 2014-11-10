app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TwitterFactory',
  function($scope, UserFactory, TwitterFactory) {
    $scope.user = UserFactory.currentUser;
    $scope.tweets = SearchFactory.getResults.query();
    $scope.tweets.$promise.then(function(data){
      $scope.test = data;
    });
}]);

