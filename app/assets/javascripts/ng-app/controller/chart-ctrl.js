app.controller('ChartCtrl', ['$scope', "GameFactory", "ScoreFactory", "UserFactory", "$location",
  function($scope, GameFactory, ScoreFactory, UserFactory, $location) {
    $scope.backToMenu = function() {
      $location.path("/menu")
    };
    $scope.chartConfig = {
      options: {
        chart: {
          type: 'bar'
        }
      },
      series: [{
        data: ScoreFactory.getScoreSeries
      }],
      title: {
        text: 'Scores'
      },
      loading: false
    }
}]);