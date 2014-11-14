app.controller('ChartCtrl', ['$scope', "GameFactory", "ScoreFactory", "UserFactory", "$location",
  function($scope, GameFactory, ScoreFactory, UserFactory, $location) {
    // $scope.addPoints = function () {
    //     var seriesArray = $scope.chartConfig.series
    //     var rndIdx = Math.floor(Math.random() * seriesArray.length);
    //     seriesArray[rndIdx].data = seriesArray[rndIdx].data.concat([1, 10, 20])
    // };

    // $scope.addSeries = function () {
    //     var rnd = []
    //     for (var i = 0; i < 10; i++) {
    //         rnd.push(Math.floor(Math.random() * 20) + 1)
    //     }
    //     $scope.chartConfig.series.push({
    //         data: rnd
    //     })
    // };

    // $scope.removeRandomSeries = function () {
    //     var seriesArray = $scope.chartConfig.series
    //     var rndIdx = Math.floor(Math.random() * seriesArray.length);
    //     seriesArray.splice(rndIdx, 1)
    // };

    // $scope.swapChartType = function () {
    //     if (this.chartConfig.options.chart.type === 'line') {
    //         this.chartConfig.options.chart.type = 'bar'
    //     } else {
    //         this.chartConfig.options.chart.type = 'line'
    //         this.chartConfig.options.chart.zoomType = 'x'
    //     }
    // };

    // $scope.toggleLoading = function () {
    //     this.chartConfig.loading = !this.chartConfig.loading
    // };
    $scope.getScoreSeries = function() {
      ScoreFactory.allScores.query().$promise.then(function(data) {
        $scope.scores = data
        _.map(this.scores, function(value, key){ 
            $scope.chartConfig.series.data.push(value)
          });
      });
    };

    $scope.chartConfig = {
        options: {
            chart: {
                type: 'bar'
            }
        },
        series: [{
            data: [10, 15, 12, 8, 7]
        }],
        title: {
            text: 'Scores'
        },

        loading: false
    }
  }]);