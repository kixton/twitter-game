app.factory('ScoreFactory', ['$resource', function($resource) {
  var scoreRsc = $resource('/scores');
  var charRsc = $resource('/scores/chart');
  var test = charRsc.query(function(data) {
    var scoreData = data
    return scoreData
  });
  return {
    allScores: scoreRsc,
    getScoreSeries: test,
    postScore: function(score) {
      var newScore = new scoreRsc(score);
      newScore.$save(function(data) {
        console.log("new score saved");
      });
    }
  };
}]);