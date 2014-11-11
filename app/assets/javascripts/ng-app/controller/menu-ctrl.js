app.controller('MenuCtrl', ['$scope', '$location', "GameFactory",
  function($scope, $location, GameFactory) {
    $scope.startGame = GameFactory.startGame
}]);
