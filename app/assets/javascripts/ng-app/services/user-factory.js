app.factory('UserFactory', ['$resource', function($resource) {
  var userRsc = $resource('/api/current-user');
  return {
    currentUser: userRsc.get()
  };
}]);