app.controller('HomeCtrl', ['$scope', 'UserFactory', 'SearchFactory',
  function($scope, UserFactory, SearchFactory) {
    $scope.user = UserFactory.currentUser;
    $scope.tweets = SearchFactory.getResults.query();
    $scope.tweets.$promise.then(function(data){
      $scope.tweetData = data.ids;
    });
}]);

