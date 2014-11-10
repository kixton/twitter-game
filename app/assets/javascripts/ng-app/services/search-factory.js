app.factory('SearchFactory', ['$resource', function($resource){
  var searchRsc = $resource("/tweets");
  var friendRsc = $resource("/friends");

  return {
    getResults: searchRsc,
    getFriends: friendRsc
  };
}]);