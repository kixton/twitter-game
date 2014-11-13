app.controller('MenuCtrl', ['$scope', "GameFactory", "ScoreFactory", "UserFactory",
  function($scope, GameFactory, ScoreFactory, UserFactory) {
    $scope.startGame = GameFactory.startGame
    $scope.view = true
    ScoreFactory.allScores.query().$promise.then(function(data) {
      $scope.scores = data
    });
    UserFactory.currentUser.$promise.then(function(data) {
      $scope.currentUser = data
    });
    $scope.showHighScore = function() {
      $scope.view = false;
    };
    $scope.showMenu = function() {
      $scope.view = true;
    };
    $scope.showGraph = function() {
      
    };
}]);
