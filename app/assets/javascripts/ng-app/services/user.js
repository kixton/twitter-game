app.factory('User', ['$resource', function($resource) {
  var userResource = $resource('/api/current-user');

  return {
    currentUser: userResource.get()
  };
}]);