app.factory('ScoreFactory', ['$resource', function($resource) {
  var scoreRsc = $resource('/scores');
  var charRsc = $resource('/scores/chart');
  var test = charRsc.query(function(data) {
    console.log(data);
    var scoreData = data
    return scoreData
  });
  
  return {
    allScores: scoreRsc,
    getScoreSeries: test
    
  };
}]);