app.factory('ClassFactory', function() {
  return {
    addIncorrectClass: function(array) {
      array.add("incorrect")
    }
  };
});