app.controller('MenuCtrl', ['$scope', '$location',
  function($scope, $location) {
    $scope.startGame = function() {
      $location.path('/tweets')
      console.log("wtf");
    };
}]);
