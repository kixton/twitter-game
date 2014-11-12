app.controller('MenuCtrl', ['$scope', "GameFactory",
  function($scope, GameFactory) {
    $scope.startGame = GameFactory.startGame
    $scope.view = true
    $scope.scores
    $scope.showHighScore = function() {
      $scope.view = false;
    };
    $scope.showMenu = function() {
      $scope.view = true;
    };
}]);
