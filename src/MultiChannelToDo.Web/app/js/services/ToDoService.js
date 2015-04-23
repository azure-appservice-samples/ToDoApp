'use strict';
multiChannelToDoApp
    .factory('toDoService', ['$http', function ($http) {
        return {

            getItems: function () {
                return $http.get(apiPath + '/ToDoItems');
            },

            add: function (id, task) {
                return $http.post(apiPath + '/ToDoItems', { "Id": id + 1, "Text": task, "Complete": false });
            },

            complete: function (item) {
                return $http.put(apiPath + '/ToDoItems/' + item.Id, { "Id": item.Id, "Text": item.Text, "Complete": true });
            }
        }
    }]);