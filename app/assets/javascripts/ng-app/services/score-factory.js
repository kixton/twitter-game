app.factory('ScoreFactory', ['$resource', function($resource) {
  var scoreRsc = $resource('/scores');
  return {
    allScores: scoreRsc
  };
}]);