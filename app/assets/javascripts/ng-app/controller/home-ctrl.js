app.controller('HomeCtrl', ['$scope', 'UserFactory', 'TweetFactory', '$timeout', '$location',
  function($scope, UserFactory, TweetFactory, $timeout, $location) {
    
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
