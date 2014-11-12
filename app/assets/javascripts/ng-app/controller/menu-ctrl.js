app.controller('MenuCtrl', ['$scope', "GameFactory",
  function($scope, GameFactory) {
    $scope.startGame = GameFactory.startGame
}]);
