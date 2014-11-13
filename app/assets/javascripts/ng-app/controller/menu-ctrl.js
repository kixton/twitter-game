app.controller('MenuCtrl', ['$scope', "GameFactory", "ScoreFactory",
  function($scope, GameFactory, ScoreFactory) {
    $scope.startGame = GameFactory.startGame
    $scope.view = true
    ScoreFactory.allScores.query().$promise.then(function(data) {
      $scope.scores = data
    });

    $scope.showHighScore = function() {
      $scope.view = false;
    };
    $scope.showMenu = function() {
      $scope.view = true;
    };
}]);
